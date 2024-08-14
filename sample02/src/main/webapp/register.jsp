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
String name=request.getParameter("name");
String gnd=request.getParameter("gender");
String eid=request.getParameter("email");
String pwd=request.getParameter("password");
String upiid=request.getParameter("upiid");



try
{
Class.forName("com.mysql.jdbc.Driver");

	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/user","root","9922");
	Statement st=con.createStatement();
	String qry="insert into users values('"+name+"','"+gnd+"','"+eid+"','"+pwd+"','"+upiid+"')";
	int res=st.executeUpdate(qry);
	if(res>0)
		response.sendRedirect("registersuccess.html");
	else
		//out.write("error.html");
		response.sendRedirect("error.html");
}
catch(Exception e)
{
	out.write(e.getMessage());
}

%>

</body>
</html>