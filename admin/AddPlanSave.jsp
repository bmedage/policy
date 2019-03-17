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
<%try{
		System.out.println("In Plan Add  Servlet");
	String year=request.getParameter("fyear");
	String month=request.getParameter("pmonth");
	String planid=request.getParameter("planid");
	String interest=request.getParameter("interest");
	String minamt=request.getParameter("minamt");
	String probusiness=request.getParameter("probusiness");
	String incentive=request.getParameter("incentive");
	String remark=request.getParameter("remark");
	System.out.println(" Plan Id"+planid);
	String insert="insert into Add_Plan (month,interest,min_amt,pro_business,incentive,remark,year,plan_id)values(?,?,?,?,?,?,?,?)";
	//Calendar calendar = Calendar.getInstance();
    //java.sql.Date ourdate = new java.sql.Date(calendar.getTime().getTime());
	Connection cn=DBConnection.getConnection();
	PreparedStatement ptmt=cn.prepareStatement("set global max_connections=100000000");
	ptmt.executeQuery();
	PreparedStatement ps=(PreparedStatement) cn.prepareStatement(insert);
	ps.setString(1, month);
	ps.setString(2, interest);
	ps.setString(3, minamt);
	ps.setString(4,probusiness);
	ps.setString(5, incentive);
	ps.setString(6,remark);
	ps.setString(7,year);
	ps.setString(8,planid);
	int res=ps.executeUpdate();
	if(res>0)
	{%>
	<script type="text/javascript">
	alert("Plan  Inserted Sucesssfully");
	window.location='AddPlan.jsp';
	</script>
	<%}
	else{%>
	<script type="text/javascript">
	alert("Plan not Inserted");
	window.location='errorpage.html';
	</script>
	<%}
		
	
	
	}
catch(Exception e)
	{
	e.printStackTrace();
	}
 	%>
</body>
</html>