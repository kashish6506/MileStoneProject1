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

@WebServlet("/AddProfessor")

public class AddProfessor  extends HttpServlet{
	private Connection con;
	private PreparedStatement pstmt;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		    int pid  = Integer.parseInt(req.getParameter("pid"));
		    String pname = req.getParameter("pname");
		    int exp  = Integer.parseInt(req.getParameter("exp"));
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
	        	
	        	pstmt = con.prepareStatement("insert into professor values(?,?,?,?,?,?)");
	        	pstmt.setInt(1,pid);
	        	pstmt.setString(2,pname);
	        	pstmt.setInt(3,exp);
	        	pstmt.setInt(4,cid);
	        	pstmt.setString(5,user_name);
	        	pstmt.setString(6,password);
	        	
	        	 int x = pstmt.executeUpdate();

	             if(x>0) {

	                 resp.sendRedirect("/CrsServlet/AddProfessorSuccess.jsp");

	             }

	             else {

	                 resp.sendRedirect("/CrsServlet/AddProfessorFail.html");

	             }
				
	        	
	        }
	        catch (Exception e) {
				e.printStackTrace();		}
		}
	}


