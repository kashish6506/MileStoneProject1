package com.digit.java.Servlet.CRS;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Changecourse")
public class Changecourse extends HttpServlet{
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet resultSet;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int cid = Integer.parseInt(req.getParameter("cid"));
		
		 HttpSession session=req.getSession();
		 
		 try {
	       	  Class.forName("com.mysql.cj.jdbc.Driver");
	       	  String url = "jdbc:mysql://localhost:3306/crs";
	          String user = "root";
	          String pwd = "root";
	          
	          con=DriverManager.getConnection(url,user,pwd);

	          pstmt=con.prepareStatement("update student set cid = ? where sid = ?");//<--change course in student table which is present in course table
	          pstmt.setInt(1, cid);
	          pstmt.setInt(2,(int)session.getAttribute("sid"));

	          
	          int x = pstmt.executeUpdate();
	          if(x>0)
	             {
	            	 resp.sendRedirect("/CrsServlet/Changecoursesuccess.jsp");
	          	   
	             }
	             else 
	             {
	          	   resp.sendRedirect("/CrsServlet/Changecoursefail.jsp");
	             }

	          }
		 catch (Exception e)
         {
			 e.printStackTrace();
         }

		
	}

}