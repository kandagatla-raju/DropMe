<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String email=request.getParameter("email");
String start=request.getParameter("start");
String destiny=request.getParameter("destiny");
String date=request.getParameter("date");
String time=request.getParameter("time");
String vehicle_no=request.getParameter("vehicle_no");
String phone=request.getParameter("phone");


try
{
Class.forName("com.mysql.jdbc.Driver");

	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/user","root","9922");
	Statement st=con.createStatement();
	String qry="insert into shareride values('"+email+"','"+start+"','"+destiny+"','"+date+"','"+time+"','"+vehicle_no+"','"+phone+"')";
	int res=st.executeUpdate(qry);
	if(res>0)
		//response.sendRedirect("registermyride.html");
		out.write("Successfully registered the ride..!");
	else
		out.write("error");
		//response.sendRedirect("error.html");
}
catch(Exception e)
{
	out.write(e.getMessage());
}

%>

</body>
</html>