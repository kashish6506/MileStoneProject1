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

@WebServlet("/StudentLogin")
public class StudentLogin extends HttpServlet {
	private ResultSet resultSet;
	private PreparedStatement pstmt;
	private Connection con;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(true);
		String user_name = req.getParameter("user_name");
		String password = req.getParameter("password");
		
		String url = "jdbc:mysql://localhost:3306/crs";

        String user = "root";

        String pwd = "root";
        
        
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(url, user, pwd);
            pstmt = con.prepareStatement("select * from student where user_name=? and password=?");
            pstmt.setString(1, user_name);
            pstmt.setString(2, password);
            
            resultSet =pstmt.executeQuery();
            
            if(resultSet.next()==true) {
            	session.setAttribute("user_name",resultSet.getString("user_name"));
            	session.setAttribute("sid", resultSet.getInt("sid"));
        
            	resp.sendRedirect("/CrsServlet/StudHome.jsp");
            	
            }
            else {
            	resp.sendRedirect("/CrsServlet/studLoginFail.html");
            }
        }
        catch (Exception e) {
			e.printStackTrace();
		}
	}

}
