<%@page import="java.io.PrintWriter"%>
<%@page import="com.pit.policy.save.GetGHYHQMAmount"%>
<%
PrintWriter pw=response.getWriter();
String planType=request.getParameter("planType");
String year=request.getParameter("year");
String planID=request.getParameter("planID");
if(planType.equals("RD"))
{
	if(request.getParameter("y").equals("Y"))
	{
	String y=GetGHYHQMAmount.getGHYAmount(planID, planType, year);
	pw.println(y);
	}
	else if(request.getParameter("y").equals("H"))
	{
		String h=GetGHYHQMAmount.getGHHAmount(planID, planType, year);	
		pw.println(h);
	}
	else if(request.getParameter("y").equals("Q"))
	{
		String q=GetGHYHQMAmount.getGHQAmount(planID, planType, year);
		pw.println(q);
	}
	else if(request.getParameter("y").equals("M"))
	{
		String m=GetGHYHQMAmount.getGHMAmount(planID, planType, year);
		pw.println(m);
	}
	
}
else if(planType.equals("FD"))
{
	if(request.getParameter("y").equals("Y"))
	{
	pw.println("0");
	}
	else if(request.getParameter("y").equals("H"))
	{
		pw.println("0");
	}
	else if(request.getParameter("y").equals("Q"))
	{
		pw.println("0");
	}
	else if(request.getParameter("y").equals("M"))
	{
		pw.println("0");
	}
	
}
%>