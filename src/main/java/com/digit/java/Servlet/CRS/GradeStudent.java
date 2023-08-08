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

@WebServlet("/GradeStudent")
public class GradeStudent extends HttpServlet {
	private Connection con;
	private PreparedStatement pstmt;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int stud_id  = Integer.parseInt(req.getParameter("stud_id"));
	    
		int quizz  = Integer.parseInt(req.getParameter("quizz"));
		int assignment  = Integer.parseInt(req.getParameter("assignment"));
		int projects  = Integer.parseInt(req.getParameter("projects"));
		int finals  = Integer.parseInt(req.getParameter("finals"));
		
		String url = "jdbc:mysql://localhost:3306/crs";

        String user = "root";

        String pwd = "root";
        
        try {
        	Scanner sc = new Scanner(System.in);
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	con = DriverManager.getConnection(url, user, pwd);
        	
        	pstmt = con.prepareStatement("Insert into score values(?,?,?,?,?)");
        	pstmt.setInt(1,stud_id);
        	pstmt.setInt(2,quizz);
        	pstmt.setInt(3,assignment);
        	pstmt.setInt(4,projects);
        	pstmt.setInt(5,finals);
        	
        	
        	 int x = pstmt.executeUpdate();

             if(x>0) {

                 resp.sendRedirect("/CrsServlet/Gradestudentssuccess.jsp");

             }

             else {

                 resp.sendRedirect("/CrsServlet/Gradestudentsfail.jsp");

             }
			
        	
        }
        catch (Exception e) {
			e.printStackTrace();		}
		
	}

}
