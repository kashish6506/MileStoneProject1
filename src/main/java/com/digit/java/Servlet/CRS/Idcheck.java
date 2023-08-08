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

@WebServlet("/Idcheck")
public class Idcheck extends HttpServlet{
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet resultSet;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int sid = Integer.parseInt(req.getParameter("sid"));
		HttpSession session=req.getSession();
		 
		 try {
	       	  Class.forName("com.mysql.cj.jdbc.Driver");
	       	  String url = "jdbc:mysql://localhost:3306/crs";
	          String user = "root";
	          String pwd = "root";
	          
	          con=DriverManager.getConnection(url,user,pwd);
	          pstmt=con.prepareStatement("select* from student where sid=? and cid=?");
	          pstmt.setInt(1,sid);
	          pstmt.setInt(2,(int)session.getAttribute("cid"));
	          resultSet  = pstmt.executeQuery();

              
	          if(resultSet.next()==true)
	             {	 
	        	     session.setAttribute("sid",resultSet.getInt("sid"));
	        	     session.setAttribute("sname",resultSet.getString("sname"));
	            	 resp.sendRedirect("/CrsServlet/Gradestudentssuccess.jsp");
	          	   
	             }
	             else {
	          	   resp.sendRedirect("/CrsServlet/Gradestudentsfail.jsp");
	             }

	          }
		 catch (Exception e)
         {
			 e.printStackTrace();
         }

	}

}
