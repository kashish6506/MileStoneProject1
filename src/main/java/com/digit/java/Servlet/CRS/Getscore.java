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

@WebServlet("/Getscore")
public class Getscore extends HttpServlet{
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet resultSet;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session=req.getSession();
		

		 try{
			 Class.forName("com.mysql.cj.jdbc.Driver");
	   	     String url = "jdbc:mysql://localhost:3306/crs";
	         String user = "root";
	         String pwd = "root";
	         con=DriverManager.getConnection(url,user,pwd);
             pstmt=con.prepareStatement("select* from score where sid=?");
             pstmt.setInt(1,(int)session.getAttribute("sid"));//101
             
             resultSet  = pstmt.executeQuery();

             if(resultSet.next()==true)
             {
          	   session.setAttribute("quizz",resultSet.getString("quizz"));
          	   session.setAttribute("assignment",resultSet.getInt("assignment"));
          	   session.setAttribute("projects",resultSet.getInt("projects"));
          	   session.setAttribute("finals",resultSet.getInt("finals"));


          	   resp.sendRedirect("/CrsServlet/Studentgetscore.jsp");
          	   
             }
             else {
          	   resp.sendRedirect("/CrsServlet/Studentgetscorefail.jsp");
             }

	         }
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }

		
	}

}
