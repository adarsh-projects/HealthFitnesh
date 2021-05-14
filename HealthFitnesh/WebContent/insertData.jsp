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
		String url = "jdbc:mysql://localhost:3306/healthdatabase";
		String user = "root";
		String pass = "Root@7668";
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmpsd");
		String username = request.getParameter("username");
		String gender = request.getParameter("gnd");
		String weight = request.getParameter("wgt");
		String height = request.getParameter("hgt");
		
		if(password.equals(confirmPassword)){
			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = (Connection) DriverManager.getConnection(url, user, pass);
				Statement s = con.createStatement();
				int i = s.executeUpdate("insert into user(email, username, gender, height, weight, password)"+
												"values('"+email+"','"+username+"','"+gender+"','"+height+"','"+weight+"','"+password+"')");
				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location", "loginPage.html");
			}catch(Exception e){
				out.println("<p>"+ e +"</p>");
			}
		}else{
			out.println("<p>Password and Cofirm Password wasn\'t matching </p>");
		}
	%>
</body>
</html>