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
//String email=request.getParameter("email");
String start=request.getParameter("start");
String destiny=request.getParameter("destiny");
//String date=request.getParameter("date");
//String time=request.getParameter("time");

try
{
Class.forName("com.mysql.jdbc.Driver");

	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/user","root","9922");
	Statement st=con.createStatement();
	String qry="select * from shareride where start='"+start+"' and destiny='"+destiny+"' and date>=CURRENT_DATE "  ;
	ResultSet res=st.executeQuery(qry);
	out.println("<html><body><style>table,tr,td{border: 2px solid black;border-collapse: collapse;padding: 10px;}body{margin:30px 20px;paddiong:15px;background:#d6fbff}#h1{background:green;padding=10px}</style><table align='center'><h1 id='h1' align='center'>Available For Share Rides</h1><tr><td><b>        Email</b></td><td><b>   date</b></td><td><b>    time</b></td><td><b>    Vehicle No.</b></td><td><b>   phone</b></td><td><b>Status</b></td></tr>");
	while(res.next()) {
        /*out.write("Name: "+res.getString("email")+", ");
        out.write("Vehicle No.: "+res.getString("vehicle_no")+", ");
        out.write("date: "+res.getString("date")+", ");
        out.write("time: "+res.getString("time")+", ");
        out.write("phone : "+res.getString("phone")+", ");*/
        out.println("<tr><td>"+res.getString("email")+"</td><td>"+res.getString("date")+"</td><td>"+res.getString("time")+"</td><td>"+res.getString("vehicle_no")+"</td><td>"+res.getString("phone")+"</td><td><a href='success.jsp'>Book</a></td></tr>");
	}
	out.println("</table></body></html>");
	
}
catch(Exception e)
{
	out.write(e.getMessage());
}

%>

</body>
</html>