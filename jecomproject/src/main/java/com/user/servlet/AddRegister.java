package com.user.servlet;

import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import com.DAL.UserDAlIMplement;
import com.DB.DBConnect;
import com.entity.User;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "userRegister", urlPatterns = { "/register" })
public class AddRegister extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {

        try {

            // Getting request from the client
            String first = req.getParameter("first");
            String last = req.getParameter("last");
            String country = req.getParameter("countryCode");
            long phone = Long.parseLong(req.getParameter("phone"));
            String companyname = req.getParameter("companyname");
            String address = req.getParameter("address");
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            String hashedpassword = BCrypt.hashpw(password, BCrypt.gensalt(10));
           

            // Printing in the console for debugging purpose
            System.out.println("First Name: " + first);
            System.out.println("Last Name: " + last);
            System.out.println("Country Code: " + country);
            System.out.println("Phone: " + phone);
            System.out.println("Company Name: " + companyname);
            System.out.println("Address: " + address);
            System.out.println("Email: " + email);
            System.out.println("Password: " + password);
            System.out.println("Hashed: "+hashedpassword);

            // Data connection object
            UserDAlIMplement dal = new UserDAlIMplement(DBConnect.getConn());

            if (dal.isUserExists(email)) {
                String message = "Account with this email already registered";
                req.setAttribute("message", message);
                req.getRequestDispatcher("/register.jsp").forward(req, res);
                return;
            }

            // Password equality check
            if (!req.getParameter("password").equals(req.getParameter("repassword"))) {
                String message = "Passwords do not match";
                req.setAttribute("message", message);
                req.getRequestDispatcher("/register.jsp").forward(req, res);
                return;
            }

            // Created object of User class to implement the data to the database through
            // userRegistration class
            User userObj = new User();
            userObj.setFirst(first);
            userObj.setLast(last);
            userObj.setCountry(country);
            userObj.setPhone(phone);
            userObj.setCompanyName(companyname);
            userObj.setAddress(address);
            userObj.setEmail(email);
            userObj.setPassword(password);

            // Message with data implementation status
            boolean success = dal.userRegistration(userObj);
            if (success) {
                // Registration successful, set success message
                String successMessage = "Registration successful. Redirecting to login page...";
                req.setAttribute("successMessage", successMessage);

                // Forward to register.jsp to display the success message
                req.getRequestDispatcher("/register.jsp").forward(req, res);

                // Use JavaScript to redirect to login.jsp after 2 seconds
                res.getWriter().println("<script>setTimeout(function(){window.location.href='/login.jsp';},2000);</script>");
            } else {
                // Registration failed, set failure message
                String message = "Registration failed. Please try again.";
                req.setAttribute("message", message);
                req.getRequestDispatcher("/register.jsp").forward(req, res);
                return;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
