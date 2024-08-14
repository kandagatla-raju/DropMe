<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% String email=request.getParameter("email");
String password=request.getParameter("password");


Class.forName("com.mysql.jdbc.Driver");

	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/user","root","9922");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where email='"+email+"' and password='"+password+"'");
try
{
	rs.next();
		if(rs.getString("email").equals(email) && rs.getString("password").equals(password)){
				//out.write("welcome.html");
			response.sendRedirect("welcome.html");
			   }
	     else{
				//out.write("error.html");
	    	 response.sendRedirect("error.html");
	     }
	
	     con.close();

}
catch(Exception e)
{
       out.write(e.getMessage());
}
%>
</body>
</html>