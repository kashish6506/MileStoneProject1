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

@WebServlet("/RemoveCourse")

public class RemoveCourse extends HttpServlet{
	private Connection con;
	private PreparedStatement pstmt;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int cid  = Integer.parseInt(req.getParameter("cid"));
		
		String url = "jdbc:mysql://localhost:3306/crs";

        String user = "root";

        String pwd = "root";
        
        try {
        	Scanner sc = new Scanner(System.in);
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	con = DriverManager.getConnection(url, user, pwd);
        	
        	pstmt = con.prepareStatement("Delete from Course where cid=?");
        	pstmt.setInt(1,cid);
        	
        	 int x = pstmt.executeUpdate();

             if(x>0) {

                 resp.sendRedirect("/CrsServlet/RemoveCourseSuccess.jsp");

             }

             else {

                 resp.sendRedirect("/CrsServlet/RemoveCourseFail.html");

             }
			
        	
        }
        catch (Exception e) {
			e.printStackTrace();		
			}
	}

}
