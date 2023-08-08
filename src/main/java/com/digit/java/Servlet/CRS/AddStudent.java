package com.digit.java.Servlet.CRS;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddStudent")

public class AddStudent extends HttpServlet {
	private PreparedStatement pstmt;
	private Connection con;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

		    int sid  = Integer.parseInt(req.getParameter("sid"));
		    String sname = req.getParameter("sname");
		    String email = req.getParameter("email");
			int cid  = Integer.parseInt(req.getParameter("cid"));
			String user_name = req.getParameter("user_name");
			String password = req.getParameter("password");
			
			
			String url = "jdbc:mysql://localhost:3306/crs";

	        String user = "root";

	        String pwd = "root";
	        
	        try {
	        	Scanner sc = new Scanner(System.in);
	        	Class.forName("com.mysql.cj.jdbc.Driver");
	        	con = DriverManager.getConnection(url, user, pwd);
	        	
	        	pstmt = con.prepareStatement("Insert into Student values(?,?,?,?,?,?)");
	        	pstmt.setInt(1,sid);
	        	pstmt.setString(2,sname);
	        	pstmt.setString(3,email);
	        	pstmt.setString(4,user_name);
	        	pstmt.setString(5,password);
	        	pstmt.setInt(6,cid);
	        	
	        	 int x = pstmt.executeUpdate();

	             if(x>0) {

	                 resp.sendRedirect("/CrsServlet/AddStudentSuccess.jsp");

	             }

	             else {

	                 resp.sendRedirect("/CrsServlet/AddStudentFail.html");

	             }
				
	        	
	        }
	        catch (Exception e) {
				e.printStackTrace();		}
		}
	}


