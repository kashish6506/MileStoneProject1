<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1 align="center">Here student details</h1>
<h1 align="center"><%
try{
	session = request.getSession();
	 Class.forName("com.mysql.cj.jdbc.Driver");
  	  String url = "jdbc:mysql://localhost:3306/crs";
     String user = "root";
     String pwd = "root";
     
     Connection con =DriverManager.getConnection(url,user,pwd);
     PreparedStatement pstmt=con.prepareStatement("select* from student where cid=?");
     pstmt.setInt(1,(int)session.getAttribute("cid"));
     ResultSet resultSet  = pstmt.executeQuery();
     
     while(resultSet.next()){

out.println(" <br><br><br><br><br><br><br><br><br> " +
"student's corse id -->"+session.getAttribute("cid")+"<br>"+
"student's username -->"+resultSet.getString("user_name")+"<br>"+
"student's email -->"+resultSet.getString("email")+"<br>"
);

     }
	
}catch(Exception e){
	e.printStackTrace();
}
%></h1>
<br><br><h1><a href="profloginsuccess.html">press here to go back</a></h1>

</body>
</html>