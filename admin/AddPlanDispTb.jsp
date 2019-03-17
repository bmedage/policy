<%@page import="com.pit.policy.dbconnection.Conn"%>
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
<title>Add Plan Display Table</title>
<!-- tables -->
<link rel="stylesheet" type="text/css" href="css/table-style.css" />
<link rel="stylesheet" type="text/css" href="css/basictable.css" />
<script type="text/javascript" src="js/jquery.basictable.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
      $('#table').basictable();

      $('#table-breakpoint').basictable({
        breakpoint: 768
      });

      $('#table-swap-axis').basictable({
        swapAxis: true
      });

      $('#table-force-off').basictable({
        forceResponsive: false
      });

      $('#table-no-resize').basictable({
        noResize: true
      });

      $('#table-two-axis').basictable();

      $('#table-max-height').basictable({
        tableWrapper: true
      });
    });
</script>
<!-- //tables -->

</head>
<body>
<%
if(session.getAttribute("userName")==null)
{%>
	<script type="text/javascript">
	alert("Please LogIn First");
	window.location='adminlogin.jsp';
	</script>
<%}
%>
<%

System.out.println(request.getParameter("fyear"));
if(request.getParameter("type").equals("FD"))
{%>
<table  style="border: 3px solid #ddd; overflow-y:initial;" id="table" >
    <thead>
      <tr>
        <th><b>PlanId</b></th>
        <th><b>Amount</b></th>
        <th style="width:50px;"><b><label>3</label></b></th>
        <th style="width:50px;"><b>6</b></th>
        <th style="width:50px; "><b>12</b></th>
        <th style="width:50px; "><b>18</b></th>
        <th style="width:50px; "><b>24</b></th>
        <th style="width:50px; "><b>30</b></th>
        <th style="width:50px; "><b>36</b></th>
        <th style="width:50px; "><b>42</b></th>
        <th style="width:50px; "><b>48</b></th>
        <th style="width:50px; "><b>54</b></th>
        <th style="width:50px; "><b>60</b></th>
        <th style="width:50px; "><b>66</b></th>
        <th style="width:50px; "><b>72</b></th>
        <th style="width:50px; "><b>78</b></th>
        <th style="width:50px; "><b>84</b></th>
        <th style="width:50px; "><b>90</b></th>
        <th style="width:50px; "><b>96</b></th>
         <th style="width:50px; "><b>102</b></th>
          <th style="width:50px; "><b>108</b></th>
           <th style="width:50px; "><b>114</b></th>
        <th style="width:50px; "><b>120</b></th>
        <th style="width:50px; "><b>Edit</b></th>
        <th style="width:50px; "><b>Act/Dct</b></th>
        
      </tr>
    </thead>
 <tbody>
 
<%	String planid=null;
	Connection con=DBConnection.getConnection();
	PreparedStatement ptmt=con.prepareStatement("set global max_connections=100000000");
	ptmt.executeQuery();
	PreparedStatement pstmt=con.prepareStatement("select * from addPlan where year=? And type=? ");
	pstmt.setString(1, request.getParameter("fyear"));
	pstmt.setString(2, "FD");
	ResultSet rs=pstmt.executeQuery();
	int i=0;
	String arr[]={"3","6","12","18","24","30","36","42","48","54","60","66","72","78","84","90","96","102","108","114","120"};
	while(rs.next())
	{
		%>
		 <tr>
        <td><%=rs.getString("planid") %></td>
        <td><%=rs.getString("amount") %></td>
		<%
		planid=rs.getString("planid");
		for(i=0;i<arr.length;i++)
		{
			/* System.out.println(arr[i]); */
		PreparedStatement pstmt1=con.prepareStatement("select * from add_plan where plan_id=? And month=? And year=?");
		pstmt1.setString(1, planid);
		pstmt1.setString(2, arr[i]);
		pstmt1.setString(3, request.getParameter("fyear"));
		ResultSet rs1=pstmt1.executeQuery();
		if(rs1.next()){
		%>
        
        <td><%=rs1.getString("price") %></td>
        <%}} %>
           <td><a href="AddPlanEdits.jsp?id=<%=rs.getString("planid")%>&type=<%="FD"%>&year=<%=request.getParameter("fyear")%>">Edit</a></td>
           <td><a href="">Act</a> <a href="">Dct</a></td>
      </tr>
 
     <%} %>
      </tbody>
      </table>
      <%}else if(request.getParameter("type").equals("RD"))
      {
      
      %>
    	  <table  style="border: 3px solid #ddd;" id="table" >
    <thead>
      <tr>
        <th><b>PId</b></th>
        <th><b>Amt</b></th>
        <th><b>Y</b></th>
        <th><b>H</b></th>
        <th><b>Q</b></th>
        <th><b>M</b></th>
        <th style="width:50px;"><b>3</b></th>
         <th style="width:50px;"><b>6</b></th>
        <th style="width:50px; "><b>12</b></th>
        <th style="width:50px; "><b>18</b></th>
        <th style="width:50px; "><b>24</b></th>
        <th style="width:50px; "><b>30</b></th>
        <th style="width:50px; "><b>36</b></th>
        <th style="width:50px; "><b>42</b></th>
        <th style="width:50px; "><b>48</b></th>
        <th style="width:50px; "><b>54</b></th>
        <th style="width:50px; "><b>60</b></th>
        <th style="width:50px; "><b>66</b></th>
        <th style="width:50px; "><b>72</b></th>
        <th style="width:50px; "><b>78</b></th>
        <th style="width:50px; "><b>84</b></th>
        <th style="width:50px; "><b>90</b></th>
        <th style="width:50px; "><b>96</b></th>
         <th style="width:50px; "><b>102</b></th>
          <th style="width:50px; "><b>108</b></th>
           <th style="width:50px; "><b>114</b></th>
        <th style="width:50px; "><b>120</b></th>
        <th><b>Edit</b></th>
        <th><b>Act/Dct</b></th>
      </tr>
    </thead>
 <tbody>
  <%	String planid=null;
	Connection con=DBConnection.getConnection();
	PreparedStatement pstmt=con.prepareStatement("select * from addPlan where year=? And type=? ");
	pstmt.setString(1, request.getParameter("fyear"));
	pstmt.setString(2, "RD");
	ResultSet rs=pstmt.executeQuery();
	int i=0;
	String arr[]={"Y","H","Q","M","3","6","12","18","24","30","36","42","48","54","60","66","72","78","84","90","96","102","108","114","120"};
	while(rs.next())
	{
		%>
		 <tr>
        <td><%=rs.getString("planid") %></td>
        <td><%=rs.getString("amount") %></td>
		<%
		planid=rs.getString("planid");
		for(i=0;i<arr.length;i++)
		{
			/* System.out.println(arr[i]); */
		PreparedStatement pstmt1=con.prepareStatement("select * from add_plan where plan_id=? And month=? And year=? And type=?");
		pstmt1.setString(1, planid);
		pstmt1.setString(2, arr[i]);
		pstmt1.setString(3, request.getParameter("fyear"));
		pstmt1.setString(4,"RD");
		ResultSet rs1=pstmt1.executeQuery();
		if(rs1.next()){
		%>
        
        <td><%=rs1.getString("price") %></td>
        <%}} %>
           <td><a href="AddPlanEditsRD.jsp?id=<%=rs.getString("planid")%>&type=<%="RD"%>&year=<%=request.getParameter("fyear")%>">Edit</a></td>
           <td><a href="">Act</a> <a href="">Dct</a></td>
      </tr>
 
     <%} %>
      </tbody>
      </table>
      <%}
      else if(request.getParameter("type").equals("MIS"))
      {
      System.out.println("Insite MIS");
      %>
    	  <table  style="border: 3px solid #ddd;" id="table" >
    <thead>
      <tr>
        <th><b>PId</b></th>
        <th><b>Amt</b></th>
        <th><b>Y</b></th>
        <th><b>H</b></th>
        <th><b>Q</b></th>
        <th><b>M</b></th>
        <th style="width:50px;"><b>3</b></th>
         <th style="width:50px;"><b>6</b></th>
        <th style="width:50px; "><b>12</b></th>
        <th style="width:50px; "><b>18</b></th>
        <th style="width:50px; "><b>24</b></th>
        <th style="width:50px; "><b>30</b></th>
        <th style="width:50px; "><b>36</b></th>
        <th style="width:50px; "><b>42</b></th>
        <th style="width:50px; "><b>48</b></th>
        <th style="width:50px; "><b>54</b></th>
        <th style="width:50px; "><b>60</b></th>
        <th style="width:50px; "><b>66</b></th>
        <th style="width:50px; "><b>72</b></th>
        <th style="width:50px; "><b>78</b></th>
        <th style="width:50px; "><b>84</b></th>
        <th style="width:50px; "><b>90</b></th>
        <th style="width:50px; "><b>96</b></th>
         <th style="width:50px; "><b>102</b></th>
          <th style="width:50px; "><b>108</b></th>
           <th style="width:50px; "><b>114</b></th>
        <th style="width:50px; "><b>120</b></th>
        <th><b>Edit</b></th>
        <th><b>Act/Dct</b></th>
      </tr>
    </thead>
 <tbody>

  <%	String planid=null;
	Connection con=DBConnection.getConnection();
	PreparedStatement pstmt=con.prepareStatement("select * from addPlan where year=? And type=? ");
	pstmt.setString(1, request.getParameter("fyear"));
	pstmt.setString(2, "MIS");
	ResultSet rs=pstmt.executeQuery();
	int i=0;
	String arr[]={"Y","H","Q","M","3","6","12","18","24","30","36","42","48","54","60","66","72","78","84","90","96","102","108","114","120"};
	while(rs.next())
	{
		%>
		 <tr>
        <td><%=rs.getString("planid") %></td>
        <td><%=rs.getString("amount") %></td>
		<%
		planid=rs.getString("planid");
		for(i=0;i<arr.length;i++)
		{
			/* System.out.println(arr[i]); */
		PreparedStatement pstmt1=con.prepareStatement("select * from add_plan where plan_id=? And month=? And year=? And type=?");
		pstmt1.setString(1, planid);
		pstmt1.setString(2, arr[i]);
		pstmt1.setString(3, request.getParameter("fyear"));
		pstmt1.setString(4,"MIS");
		ResultSet rs1=pstmt1.executeQuery();
		if(rs1.next()){
			System.out.println("Price="+rs1.getString("price"));
		%>
        
        <td><%=rs1.getString("price") %></td>
        <%}} %>
           <td><a href="AddPlanEditsMIS.jsp?id=<%=rs.getString("planid")%>&type=<%="MIS"%>&year=<%=request.getParameter("fyear")%>">Edit</a></td>
           <td><a href="">Act</a> <a href="">Dct</a></td>
      </tr>
 
     <%} %>
      </tbody>
      </table>
      <%}%>

</body>
</html>