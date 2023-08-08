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

@WebServlet("/RemoveStudent")

public class RemoveStudent extends HttpServlet{
	private PreparedStatement pstmt;
	private Connection con;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int sid  = Integer.parseInt(req.getParameter("sid"));
		
		String url = "jdbc:mysql://localhost:3306/crs";

        String user = "root";

        String pwd = "root";
        
        try {
        	Scanner sc = new Scanner(System.in);
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	con = DriverManager.getConnection(url, user, pwd);
        	
        	pstmt = con.prepareStatement("Delete from Student where sid=?");
        	pstmt.setInt(1,sid);
        	
        	 int x = pstmt.executeUpdate();

             if(x>0) {

                 resp.sendRedirect("/CrsServlet/RemoveStudentSuccess.jsp");

             }

             else {

                 resp.sendRedirect("/CrsServlet/RemoveStudentFail.html");

             }
			
        	
        }
        catch (Exception e) {
			e.printStackTrace();		
			}
	}

}
