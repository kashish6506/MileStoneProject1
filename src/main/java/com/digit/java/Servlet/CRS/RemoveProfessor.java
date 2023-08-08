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
@WebServlet("/RemoveProfessor")

public class RemoveProfessor extends HttpServlet {
	
	
	
	private Connection con;
	private PreparedStatement pstmt;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int pid  = Integer.parseInt(req.getParameter("pid"));
		
		String url = "jdbc:mysql://localhost:3306/crs";

        String user = "root";

        String pwd = "root";
        
        try {
        	Scanner sc = new Scanner(System.in);
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	con = DriverManager.getConnection(url, user, pwd);
        	
        	pstmt = con.prepareStatement("Delete from Professor where pid=?");
        	pstmt.setInt(1,pid);
        	
        	 int x = pstmt.executeUpdate();

             if(x>0) {

                 resp.sendRedirect("/CrsServlet/RemoveProfessorSuccess.jsp");

             }

             else {

                 resp.sendRedirect("/CrsServlet/RemoveProfessorFail.html");

             }
			
        	
        }
        catch (Exception e) {
			e.printStackTrace();		
			}
	}
	}


