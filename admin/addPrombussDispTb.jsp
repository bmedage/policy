<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.pit.policy.database.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class = "container" style = "overflow: auto;width:95%;" >
<table  style="border: 3px solid #ddd; overflow-y:initial;" id="table" >
    <thead>
      <tr>
        <th>SN</th>
								 			<th>YEAR</th>
											<th>PLAN</th>
											<th>3</th>
											<th>6</th>
											<th>12</th>
											<th>18</th>
											<th>24</th>
											<th>30</th>
											<th>36</th>
											<th>42</th>
											<th>48</th>
											<th>54</th>
											<th>60</th>
											<th>66</th>
											<th>72</th>
											<th>78</th>
											<th>84</th>
											<th>90</th>
											<th>96</th>
											<th>102</th>
											<th>108</th>
											<th>114</th>
											<th>120</th>
											<th>Edit</th>
											<th>ACT/DCT</th>
        
      </tr>
    </thead>
 <tbody>
<% String type[]={"FD","RD","MIS"}	;
int count=0;
for(int j=0;j<type.length;j++)
{
	count++;
String planid=null;
	Connection con=DBConnection.getConnection();
	PreparedStatement ptmt=con.prepareStatement("set global max_connections=100000000");
	ptmt.executeQuery();
	PreparedStatement pstmt=con.prepareStatement("select * from prom_buss_structure where year=? And type=? group by type");
	pstmt.setString(1, request.getParameter("fyear"));
	pstmt.setString(2, type[j]);
	ResultSet rs=pstmt.executeQuery();
	int i=0;
	String arr[]={"3","6","12","18","24","30","36","42","48","54","60","66","72","78","84","90","96","102","108","114","120"};
	while(rs.next())
	{
		%>
		 <tr>
		 <td><%=count %></td>
        <td><%=rs.getString("year") %></td>
        <td><%=rs.getString("type") %></td>
		<%
		for(i=0;i<arr.length;i++)
		{
			/* System.out.println(arr[i]); */
		PreparedStatement pstmt1=con.prepareStatement("select * from prom_buss_structure where type=? And month=? And year=?");
		pstmt1.setString(1, rs.getString("type"));
		pstmt1.setString(2, arr[i]);
		pstmt1.setString(3, rs.getString("year"));
		ResultSet rs1=pstmt1.executeQuery();
		if(rs1.next()){
		%>
        
        <td><%=rs1.getString("price") %></td>
        <%}} %>
           <td><a href="addPromBussEdit.jsp?&type=<%=rs.getString("type")%>&year=<%=rs.getString("year")%>">Edit</a></td>
           <td><a href="">Act</a> <a href="">Dct</a></td>
      </tr>
 
     <%} }%>
      </tbody>
      </table>
   </div>
</body>
</html>