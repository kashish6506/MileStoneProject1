<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.io.*,java.util.*,java.sql.*"%>

<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>View All Users</h2>
<% 


Connection con;

ResultSet resultSet;

Statement stmt;

try {

        Class.forName("com.mysql.cj.jdbc.Driver");

        String url = "jdbc:mysql://localhost:3306/crs";

        String user = "root";

        String pwd = "root";

        con = DriverManager.getConnection(url, user, pwd);

        String sql = "Select * from users";

        stmt = con.createStatement();

       
        resultSet = stmt.executeQuery(sql);
       %>
       <table border="1">

        <tr>

            

            <th>User Name</th>

            <th>Password</th>

          

        </tr>
         <%

        while (resultSet.next()) {

        %>
        <tr>

           

            <td><%=resultSet.getString(1)%></td>

            <td><%=resultSet.getString(2)%></td>
           
           

        </tr>
        
        <%

        }

        } catch (Exception e) {

        out.println(e);

        }  

        %>

    </table>

    <br>

    <a href="AdminHome.jsp"> Go to Home Page</a>
</body>
</html>