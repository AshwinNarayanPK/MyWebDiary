<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Working</h1>
	<%
		
		String msg = new String();
		String UserId = new String();
		UserId = (String)session.getAttribute("UserId");
		msg = request.getParameter("msg");
		out.println("UserId: "+UserId+"<br>");
		out.println("msg: "+msg+"<br>");
		out.println("Date: "+LocalDate.now());
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");  
	    String strDate = formatter.format(date);  
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MyWebDiary", "root", "password32");
			String query = "insert into TheDiary values(?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, UserId);
			pstmt.setString(2,strDate);
			pstmt.setString(3,msg);
			pstmt.executeUpdate();
		}
		catch(Exception e){
			e.printStackTrace();
			out.println("<br><h1>You have Already wrote your day, today</h1>");
		}
	%>
</body>
</html>