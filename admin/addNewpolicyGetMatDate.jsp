<%@page import="java.io.PrintWriter"%>
<%@page import="com.pit.policy.save.GetPeriodfromPlanId"%>
<%@page import="java.util.Calendar"%>
<%
Calendar calendar = Calendar.getInstance();
java.sql.Date ourdate = new java.sql.Date(calendar.getTime().getTime());
PrintWriter pw=response.getWriter();
String maturityDate=GetPeriodfromPlanId.getMaturityDate(Integer.parseInt(request.getParameter("month")),"0");
pw.println(maturityDate);
%>
