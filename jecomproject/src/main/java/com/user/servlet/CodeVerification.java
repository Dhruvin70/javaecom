package com.user.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.entity.User;

/**
 * Servlet implementation class CodeVerification
 */

@WebServlet(name = "Verification", urlPatterns = { "/otp-verification" })
public class CodeVerification extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CodeVerification() {
    	
        super();
    
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String input1 = request.getParameter("input1");
		String input2 = request.getParameter("input2");
		String input3 = request.getParameter("input3");
		String input4 = request.getParameter("input4");
		String input5 = request.getParameter("input5");
		String input6 = request.getParameter("input6");
		
		int concated = Integer.parseInt(input1 +input2+input3+input4+input5+input6);
		
		
		
	}

}
