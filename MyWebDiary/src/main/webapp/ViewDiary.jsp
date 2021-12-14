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
<title>View Your Diary</title>
<style>
table, td {
  border: 1px solid black;
}
</style>
</head>
<body>
<%
	

	String lowerDate = new String();
	String upperDate = new String();
	String userId = new String();
	
	userId = (String)session.getAttribute("UserId");
	lowerDate = request.getParameter("lowerlimit");
	upperDate = request.getParameter("upperlimit");
	out.println("UserId: "+userId+"<br>");
	out.println("LowerDate: "+lowerDate+"<br>");
	out.println("UpperDate: "+upperDate+"<br>");
	
	try{
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MyWebDiary", "root", "password32");
		String query = "select diaryday,message from thediary where userid=? and diaryday between ? and ?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1, userId);
		pstmt.setString(2,lowerDate);
		pstmt.setString(3, upperDate);
		ResultSet rst = pstmt.executeQuery();
		if(rst.next()==false){
			out.println("No Records Found");
		}
		else{
			%>
			<table>
			<tr><th>Date</th><th>Message</th></tr><%
			do{%>
			<tr><td ><%=rst.getString(1)%></td><td><%=rst.getString(2)%></td></tr><%
			}while(rst.next());%>
			</table><% 
		}	
	}
	catch(Exception e){
		e.printStackTrace();
	}
	
%>
</body>
</html>