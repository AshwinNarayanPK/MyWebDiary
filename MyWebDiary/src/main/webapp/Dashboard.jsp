<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	
	function toRedirect(){
		document.write("<form action='WriteDiary.jsp'><input type='text' name='msg'><br><input type='submit' name='Enter Msg'></form>");
	}
	function toview(){
		document.write("<form action='ViewDiary.jsp'><input type='date' name='lowerlimit'><br><input type='date' name='upperlimit'><br><input type='submit' value='enter'></form>")
	}
	
	
	
</script>
<meta charset="ISO-8859-1">
<title>User-Dashboard</title>
</head>
<body>
	<h1> Describe Your Day</h1><br>
	<form action="" method="post">
		<input type="submit" name="btn" value="Write" onclick="toRedirect()">
	</form>
	<br>
	<form>
		<h1>View Your Diary</h1>
		<br>
		<input type="submit" value="view" onclick="toview()">
		
	</form>
	<%
		String UserId =(String)session.getAttribute("UserId");
		
	%>
</body>
</html>