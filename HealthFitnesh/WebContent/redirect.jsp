<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*, java.util.*, java.lang.*" %>
<%
	String[] samples =  (String []) session.getAttribute("userid");
	String url = "jdbc:mysql://localhost:3306/healthdatabase";
	String user = "root";
	String pass = "Root@7668";
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = (Connection) DriverManager.getConnection(url, user, pass);
		Statement sql = con.createStatement();
		int i = sql.executeUpdate("insert into timedetails(username, starttime, endtime)" 
				+"values('"+ samples[0] +"', '"+ samples[1] +"', '"+ (new java.util.Date()).toLocaleString() +"')");
		
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", "loginPage.html");
	}catch(Exception e){
		out.println("<p>"+ e +" "+ samples[1] +"</p>");
	}
%>
</body>
</html>