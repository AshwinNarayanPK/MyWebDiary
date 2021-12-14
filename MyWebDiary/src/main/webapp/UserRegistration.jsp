<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String UserId = request.getParameter("UserId");
		String Password = request.getParameter("Password");
		String Email = request.getParameter("Email");
		boolean flag = true;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MyWebDiary", "root", "password32");
			out.println("Registered Successfully");
			String query = "insert into UserDetails (UserId,Password,Email) values(?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, UserId);
			pstmt.setString(2,Password);
			pstmt.setString(3,Email);
			pstmt.executeUpdate();
			
		}
		catch(Exception e){
			out.println(e);
			e.printStackTrace();
			flag = false;
		}
		
		if(flag){
			session.setAttribute("UserId",request.getParameter("UserId"));
			response.sendRedirect("Dashboard.jsp");
		}
	%>
</body>
</html>
