<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.util.*, java.lang.*" %>
<%

	double ht = Double.parseDouble(request.getParameter("hgt").toString());
	double wt = Double.parseDouble(request.getParameter("wgt").toString());
	float bmi = (float)(ht/wt);
	double ptr = 1.8 * wt;
	double wtr = 4;
	
	String username = session.getAttribute("userid").toString();
	
	String url = "jdbc:mysql://localhost:3306/healthdatabase";
	String user = "root";
	String password = "Root@7668";
	
	try{
		String query = "select * from user where username = '"+ username +"'";
		Class.forName("com.mysql.jdbc.Driver");
		Connection c = DriverManager.getConnection(url, user, password);
		
		PreparedStatement ps = c.prepareStatement(query);
		ResultSet rs = ps.executeQuery();
		
		String s = "";
		
		if(rs.next()){
			s = rs.getString(3);
			if(s.equals("male")){
				wtr = 5;
			}
		}
		
		
	}catch(Exception e){
		out.println("<h1>"+ e +"</h1>");
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>

<center>
         <h1>Fitness Tracking</h1>
      </center>
      
      <table border = "0" align = "center" width="30%" height="40%"> 
         <tr bgcolor = "#949494">
            <th> parameter: </th>
            <th> Value </th>
         </tr> 
         <tr>
            <td align = "center">BMI(Body mass index)&nbsp;&nbsp;&nbsp;:</td>
            <td align = "center"><% out.print( bmi+" Kg/m<sup>2</sup>" ); %></td>
         </tr>
         <tr>
            <td align = "center">Protein  intake Required&nbsp;&nbsp;&nbsp;: </td>
            <td align = "center"><% out.print( ptr+" g" ); %></td>
         </tr> 
         <tr>
            <td align = "center">Water intake &emsp;&emsp;&emsp;&emsp;&emsp;: </td>
            <td align = "center"><% out.print( wtr +" L" ); %></td>
         </tr> 
      </table> 

</body>
</html>