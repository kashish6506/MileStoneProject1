<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>

<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body {
  background-color:MintCream ;
  
  
  
}
.styled-table {
    border-collapse: collapse;
    margin: 25px 0;
    font-size: 0.9em;
    font-family: sans-serif;
    min-width: 400px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
    
}
.styled-table thead tr {
    background-color: #009879;
    color: #ffffff;
    text-align: left;
}
.styled-table th,
.styled-table td {
    padding: 12px 15px;
}
.styled-table tbody tr {
    border-bottom: 1px solid #dddddd;
}

.styled-table tbody tr:nth-of-type(even) {
    background-color: #f3f3f3;
}

.styled-table tbody tr:last-of-type {
    border-bottom: 2px solid #009879;
}
.styled-table tbody tr.active-row {
    font-weight: bold;
    color: #009879;
}
.styled-table{
margin-left: auto;
  margin-right: auto;}
td {
  text-align: center;
  
}
td {
  height: 50px;
  vertical-align: bottom;
}
</style>
</head>
<body>


<h1 align="center">Mark Card</h1>
<%
Connection con;

ResultSet resultSet;

PreparedStatement pstmt;

session = request.getSession();

int sid =(int)session.getAttribute("sid");

try{
	
	Class.forName("com.mysql.cj.jdbc.Driver");

    String url = "jdbc:mysql://localhost:3306/crs";

    String user = "root";

    String pwd = "root";

    con = DriverManager.getConnection(url, user, pwd);

    String sql = "select * from score where sid=?";

    pstmt=con.prepareStatement(sql);

    pstmt.setInt(1, sid);

  
    resultSet=pstmt.executeQuery();
%>

  <table border="1" class="styled-table">
  <thead>

        <tr>

            

            <th>Student ID</th>

            <th>Quiz</th>

            <th>Assignment</th>

            <th>Projects</th>

            <th>Finals</th>

            

        </tr>
        </thead>

        <%

        while (resultSet.next()) {

        %>
 <tbody>
        <tr>

            <td><%=resultSet.getInt(1)%></td>

            <td><%=resultSet.getInt(2)%></td>

            <td><%=resultSet.getInt(3)%></td>

            <td><%=resultSet.getInt(4)%></td>

            <td><%=resultSet.getInt(5)%></td>

           

        </tr>
         </tbody>

        <%

        }

        } catch (Exception e) {

        out.println(e);

        }  

        %>

    </table>

    <br>

   

</body>
</html>