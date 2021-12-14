<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
</head>
<body>

	<%
		String Username = new String();
		Username = request.getParameter("Username");
		String Pwd = request.getParameter("pwd");
		try{

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MyWebDiary", "root", "password32");
			String query = "select Password from UserDetails where UserId=? ";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, Username);
			ResultSet rst = pstmt.executeQuery();		
			
			if(rst.next()){
				String SqPwd = rst.getString("Password");
				session.setAttribute("UserId",Username);
				response.sendRedirect("Dashboard.jsp");
			}
			else{
				out.println("Invalid login credentials");
			}
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
	%>
</body>
</html>