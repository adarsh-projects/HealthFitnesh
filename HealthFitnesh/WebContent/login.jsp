<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">

</head>
<body>
	<%@ page import="java.sql.*, java.util.*, java.lang.*" %>
	<%
		String email = request.getParameter("email");
		String pass = request.getParameter("psw");
		
		String url = "jdbc:mysql://localhost:3306/healthdatabase";
		String user = "root";
		String password = "Root@7668";
		
		try{
			
			String query = "select * from user where email = '"+email+"'";
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection c = DriverManager.getConnection(url, user, password);
			
			PreparedStatement ps = c.prepareStatement(query); // string to sql query
			
			ResultSet rs = ps.executeQuery();
			
			String s = "";
			
			if(rs.next()){
				s = rs.getString(6);
			}
			
			if(s.equals(pass)){
				
				String sttime = (new java.util.Date()).toLocaleString();

				String[] sample = new String[2];
				
				sample[0] = rs.getString(2);
				sample[1] = sttime;
				
				session.setAttribute("userid", sample);
				
				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location", "Home.jsp");
				
			}else{
				out.println("<h3>Please Register before Login<h3>");
			}
		}catch(Exception e){
			out.println("<h1>"+ e +"</h1>");
		}
	%>
</body>
</html>