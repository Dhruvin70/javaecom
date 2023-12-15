package com.DAL;

import com.entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAlIMplement implements UserDAL{

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
            ps.setString(1,us.getFirst());
            ps.setString(2,us.getLast());
            ps.setString(3,us.getCompanyName());
            ps.setString(4, us.getAddress());
            ps.setString(5,us.getEmail());
            ps.setString(6, us.getPassword());
            ps.setLong(7,us.getPhone());
            ps.setString(8,us.getCountry());

            int executionResult = ps.executeUpdate();
            if (executionResult==1){
                insertion=true;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return insertion;
    }
    
    
    public boolean isUserExists(String email) {
        boolean userExists = false;
        try {
        	// SQL query to count the number of rows with the given email in the 'user' table        	
            String query = "SELECT COUNT(*) FROM user WHERE email=?";
            
            // Using try-with-resources to automatically close resources (PreparedStatement and ResultSet)
            try (PreparedStatement preparedStatement = coon.prepareStatement(query)) {
            	
                // Set the email parameter in the prepared statement
                preparedStatement.setString(1, email);
                
                // Execute the query and get the result set
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    // Check if the result set has at least one row
                    if (resultSet.next()) {
                        // Get the count value from the first column of the result set
                        int count = resultSet.getInt(1);
                        
                        // Set userExists to true if count is greater than 0 (user with the email exists)
                        userExists = count > 0;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userExists;
    }
}
