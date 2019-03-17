<%@page import="java.io.PrintWriter"%>
<%@page import="com.pit.policy.save.GetIntroLevel"%>
<%
PrintWriter pw=response.getWriter();

if(request.getParameter("level").equals("Level"))
{
	String introLevel=GetIntroLevel.getintroLevel(request.getParameter("introId"));
	pw.println(introLevel);
}
%>