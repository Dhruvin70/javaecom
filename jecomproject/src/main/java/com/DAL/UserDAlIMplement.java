package com.DAL;

import com.entity.User;

import com.user.servlet.UserLogin;

import jakarta.security.auth.message.callback.PrivateKeyCallback.Request;
import jakarta.servlet.http.HttpSession;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class UserDAlIMplement implements UserDAL {

	private Connection coon;

	public UserDAlIMplement(Connection coon) {
		super();
		this.coon = coon;
	}

	@Override
	public boolean userRegistration(User us) {
		System.out.println("at UserRegistration");
		boolean insertion = false;
		try {
			String sql = "INSERT INTO user(first, last, company_name, address, email, password, phone, countryCode) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = coon.prepareStatement(sql);
			ps.setString(1, us.getFirst());
			ps.setString(2, us.getLast());
			ps.setString(3, us.getCompanyName());
			ps.setString(4, us.getAddress());
			ps.setString(5, us.getEmail());
			ps.setString(6, us.getPassword());
			ps.setLong(7, us.getPhone());
			ps.setString(8, us.getCountry());

			int executionResult = ps.executeUpdate();
			if (executionResult == 1) {
				insertion = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return insertion;
	}

	public boolean isUserExists(String email) {
		boolean userExists = false;
		try {
			// SQL query to count the number of rows with the given email in the 'user'
			// table
			String query = "SELECT COUNT(*) FROM user WHERE email=?";

			// Using try-with-resources to automatically close resources (PreparedStatement
			// and ResultSet)
			try (PreparedStatement preparedStatement = coon.prepareStatement(query)) {

				// Set the email parameter in the prepared statement
				preparedStatement.setString(1, email);

				// Execute the query and get the result set
				try (ResultSet resultSet = preparedStatement.executeQuery()) {
					// Check if the result set has at least one row
					if (resultSet.next()) {
						// Get the count value from the first column of the result set
						int count = resultSet.getInt(1);

						// Set userExists to true if count is greater than 0 (user with the email
						// exists)
						userExists = count > 0;
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userExists;
	}

	@Override
	public User userLogin(String email) {
		User logined = null;
		try {
			String userValues = "SELECT * FROM user WHERE email=? ";

			PreparedStatement ps = coon.prepareStatement(userValues);
			ps.setString(1, email);
			ResultSet userDetailSet = ps.executeQuery();

			if (userDetailSet.next()) {
				logined = new User();
				String userFirst = userDetailSet.getString("first");

				logined.setEmail(userDetailSet.getString("email"));
				logined.setPassword(userDetailSet.getString("password"));
				logined.setFirst(userFirst);
				logined.setId(userDetailSet.getInt("id"));
				logined.setLast(userDetailSet.getString("last"));
				logined.setAddress(userDetailSet.getString("address"));
				logined.setPhone(Long.parseLong(userDetailSet.getString("phone")));

				// Print user data to the console
				System.out.println("User Email: " + logined.getEmail());
				System.out.println("User Password: " + logined.getPassword());
				System.out.println("User Password: " + logined.getId());
			}

			// Close the ResultSet and PreparedStatement
			userDetailSet.close();
			ps.close();
			coon.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return logined;
	}

	public static boolean isStrongPassword(String password) {
		// Define a regular expression for password strength
		String regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";

		// Compile the regular expression
		Pattern pattern = Pattern.compile(regex);

		// Match the password against the pattern
		Matcher matcher = pattern.matcher(password);

		// Return true if the password matches the pattern (strong password), otherwise
		// false
		return matcher.matches();
	}

	public boolean updateDatabase(String fieldId, String newData, int userId) {
		boolean updated = false;

		String updateQuery = "UPDATE user SET " + fieldId + " = ? WHERE id = ?";

		try {
			PreparedStatement ps = coon.prepareStatement(updateQuery);
			ps.setString(1, newData);
			ps.setInt(2, userId);

			int x = ps.executeUpdate();
			if (x == 1) {

				updated = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return updated;
	}

	public User getUserById(int userId) {
		User user = null;

		String selectQuery = "SELECT * FROM user WHERE id = ?";

		try {
			PreparedStatement ps = coon.prepareStatement(selectQuery);
			ps.setInt(1, userId);

			ResultSet resultSet = ps.executeQuery();

			if (resultSet.next()) {
				user = new User();
				user.setEmail(resultSet.getString("email"));
				user.setFirst(resultSet.getString("first"));
				user.setId(resultSet.getInt("id"));
				user.setLast(resultSet.getString("last"));
				user.setAddress(resultSet.getString("address"));
				user.setPhone(Long.parseLong(resultSet.getString("phone")));
				// Set other user attributes as needed
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return user;
	}

	public boolean resetPassword(String email, String newPassword) {
		boolean changed = false;

		String changing = "UPDATE user SET password =? WHERE email =? ";

		try {
			PreparedStatement ps = coon.prepareStatement(changing);
			ps.setString(2, email);
			ps.setString(1, newPassword);

			int x = ps.executeUpdate();

			if (x == 1) {
				changed = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return changed;
	}

}
