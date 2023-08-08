package com.digit.java.Servlet.CRS;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Grading")
public class Grading extends HttpServlet{
	
	private Connection con;
	private PreparedStatement pstmt;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int quizz = Integer.parseInt(req.getParameter("quizz"));
		int assignment = Integer.parseInt(req.getParameter("assignment"));
		int projects = Integer.parseInt(req.getParameter("projects"));
		int finals= Integer.parseInt(req.getParameter("finals"));
		
		 HttpSession session=req.getSession();
		 
		 try {
	       	  Class.forName("com.mysql.cj.jdbc.Driver");
	       	  String url = "jdbc:mysql://localhost:3306/crs";
	          String user = "root";
	          String pwd = "root";
	          
	          con = DriverManager.getConnection(url, user, pwd);
	          pstmt = con.prepareStatement("insert into score values(?,?,?,?,?)");
              
	          pstmt.setInt(1,(int)session.getAttribute("sid"));
	          pstmt.setInt(2, quizz);
	          pstmt.setInt(3, assignment);
	          pstmt.setInt(4, projects);
	          pstmt.setInt(5, finals);

	          int x = pstmt.executeUpdate();

	            if(x>0) 
	            {
	            	System.out.println("Query updated in grade...");
	                resp.sendRedirect("/CrsServlet/Gradesuccess.jsp");

	            }

	            else {

	                resp.sendRedirect("/CrsServlet/Gradefail.jsp");

	            }
	          }
		 catch (Exception e)
         {
//			 e.printStackTrace();
			 resp.sendRedirect("/CrsServlet/Alreadygraded.jsp");
         }

	}

}
