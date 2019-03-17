<%@page import="org.omg.IOP.Codec"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.pit.policy.database.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.pit.policy.save.GetIntroCodeForDownline"%>
<%@page import="com.pit.policy.save.Getprice"%>
<%@page import="java.io.PrintWriter"%>
<%
PrintWriter pw=response.getWriter();
String pinNo=request.getParameter("pinNo");

System.out.println("Intro evel="+request.getParameter("allotlevel"));
System.out.println("Intro evel="+request.getParameter("pinNo"));
Connection con=DBConnection.getConnection();
PreparedStatement ptmt=con.prepareStatement("set global max_connections=100000000");
ptmt.executeQuery();
if(request.getParameter("allotlevel").equals("Executiive Manager"))
{
	String code=GetIntroCodeForDownline.getIntroCodeForDownline("Executiive Manager", pinNo);
	PreparedStatement pstmt=con.prepareStatement("update advisors set Executiive Manager=? where advCode=?");
	pstmt.setString(1,request.getParameter("allotlevel"));
	pstmt.setString(2, pinNo);
	pstmt.executeUpdate();
}
else if(request.getParameter("allotlevel").equals("SR Zonal Officer"))
{
	String nm[]={"Executiive Manager"};
	float pr=0;
	ArrayList<String> introCode = new ArrayList();
	String code=null,code1=null;
	for (int i=0; i<nm.length; i++)
    {
		System.out.println("I="+i);
		if(i==0)
		{
		code=GetIntroCodeForDownline.getIntroCodeForDownline(nm[i], pinNo);
		introCode.add(i, code);
		System.out.println("Return Code= "+code);
		}
		else
		{
		String codePass=introCode.get(i-1);
		code1=GetIntroCodeForDownline.getIntroCodeForDownline(nm[i], codePass);
		introCode.add(i, code1);
		System.out.println("return Code= "+code1);
		}
	}
	pw.println();
}
else if(request.getParameter("allotlevel").equals("Zonal Officer"))
{
	String nm[]={"SR Zonal Officer","Executiive Manager"};
	float pr=0;
	ArrayList<String> introCode = new ArrayList();
	String code=null,code1=null;
	for (int i=0; i<nm.length; i++)
    {
		System.out.println("I="+i);
		if(i==0)
		{
		code=GetIntroCodeForDownline.getIntroCodeForDownline(nm[i], pinNo);
		introCode.add(i, code);
		System.out.println("Return Code= "+code);
		}
		else
		{
		String codePass=introCode.get(i-1);
		code1=GetIntroCodeForDownline.getIntroCodeForDownline(nm[i], codePass);
		introCode.add(i, code1);
		System.out.println("return Code= "+code1);
		}
	}
	pw.println(pr);
}


else if(request.getParameter("allotlevel").equals("Rezonal Officer"))
{
	String nm[]={"Zonal Officer","SR Zonal Officer","Executiive Manager"};
	float pr=0;
	ArrayList<String> introCode = new ArrayList();
	String code=null,code1=null;
	for (int i=0; i<nm.length; i++)
    {
		System.out.println("I="+i);
		if(i==0)
		{
		code=GetIntroCodeForDownline.getIntroCodeForDownline(nm[i], pinNo);
		introCode.add(i, code);
		System.out.println("Return Code= "+code);
		}
		else
		{
		String codePass=introCode.get(i-1);
		code1=GetIntroCodeForDownline.getIntroCodeForDownline(nm[i], codePass);
		introCode.add(i, code1);
		System.out.println("return Code= "+code1);
		}
	}
	pw.println(pr);
}

else if(request.getParameter("allotlevel").equals("SR Developement Officer"))
{
	String nm[]={"Rezonal Officer","Zonal Officer","SR Zonal Officer","Executiive Manager"};
	float pr=0;
	ArrayList<String> introCode = new ArrayList();
	String code=null,code1=null;
	for (int i=0; i<nm.length; i++)
    {
		System.out.println("I="+i);
		if(i==0)
		{
		code=GetIntroCodeForDownline.getIntroCodeForDownline(nm[i], pinNo);
		introCode.add(i, code);
		System.out.println("Return Code= "+code);
		}
		else
		{
		String codePass=introCode.get(i-1);
		code1=GetIntroCodeForDownline.getIntroCodeForDownline(nm[i], codePass);
		introCode.add(i, code1);
		System.out.println("return Code= "+code1);
		}
	}
	pw.println(pr);
}

else if(request.getParameter("allotlevel").equals("Developement Officer"))
{
	String nm[]={"SR Developement Officer","Rezonal Officer","Zonal Officer","SR Zonal Officer","Executiive Manager"};
	float pr=0;
	ArrayList<String> introCode = new ArrayList();
	String code=null,code1=null;
	for (int i=0; i<nm.length; i++)
    {
		System.out.println("I="+i);
		if(i==0)
		{
		code=GetIntroCodeForDownline.getIntroCodeForDownline(nm[i], pinNo);
		introCode.add(i, code);
		System.out.println("Return Code= "+code);
		}
		else
		{
		String codePass=introCode.get(i-1);
		code1=GetIntroCodeForDownline.getIntroCodeForDownline(nm[i], codePass);
		introCode.add(i, code1);
		System.out.println("return Code= "+code1);
		}
	}
	pw.println(pr);
}


else if(request.getParameter("allotlevel").equals("SR. Inspector"))
{
	String nm[]={"Developement Officer","SR Developement Officer","Rezonal Officer","Zonal Officer","SR Zonal Officer","Executiive Manager"};
	float pr=0;
	ArrayList<String> introCode = new ArrayList();
	String code=null,code1=null;
	for (int i=0; i<nm.length; i++)
    {
		System.out.println("I="+i);
		if(i==0)
		{
		code=GetIntroCodeForDownline.getIntroCodeForDownline(nm[i], pinNo);
		introCode.add(i, code);
		System.out.println("Return Code= "+code);
		}
		else
		{
		String codePass=introCode.get(i-1);
		code1=GetIntroCodeForDownline.getIntroCodeForDownline(nm[i], codePass);
		introCode.add(i, code1);
		System.out.println("return Code= "+code1);
		}
	}
	pw.println(pr);
}

else if(request.getParameter("allotlevel").equals("Inspector"))
{
	String nm[]={"SR. Inspector","Developement Officer","SR Developement Officer"};
	float pr=0;
	ArrayList<String> introCode = new ArrayList();
	String code=null,code1=null;
	for (int i=0; i<nm.length; i++)
    {
		System.out.println("I="+i);
		if(i==0)
		{
		code=GetIntroCodeForDownline.getIntroCodeForDownline(nm[i], pinNo);
		introCode.add(i, code);
		System.out.println("Return Code= "+code);
		}
		else
		{
		String codePass=introCode.get(i-1);
		code1=GetIntroCodeForDownline.getIntroCodeForDownline(nm[i], codePass);
		introCode.add(i, code1);
		System.out.println("return Code= "+code1);
		}
	}
	pw.println(pr);
}

else if(request.getParameter("allotlevel").equals("Team Leader"))
{
	String nm[]={"Inspector","SR. Inspector","Developement Officer","SR Developement Officer","Rezonal Officer"};
	float pr=0;
	ArrayList<String> introCode = new ArrayList();
	String code=null,code1=null;
	for (int i=0; i<nm.length; i++)
    {
		System.out.println("I="+i);
		if(i==0)
		{
		code=GetIntroCodeForDownline.getIntroCodeForDownline(nm[i], pinNo);
		introCode.add(i, code);
		System.out.println("Return Code= "+code);
		}
		else
		{
		String codePass=introCode.get(i-1);
		code1=GetIntroCodeForDownline.getIntroCodeForDownline(nm[i], codePass);
		introCode.add(i, code1);
		System.out.println("return Code= "+code1);
		}
	}
	pw.println(pr);
}

else if(request.getParameter("allotlevel").equals("Organizer"))
{
	String nm[]={"Team Leader","Inspector","SR. Inspector","Developement Officer","SR Developement Officer","Rezonal Officer","Zonal Officer"};
	float pr=0;
	ArrayList<String> introCode = new ArrayList();
	String code=null,code1=null;
	for (int i=0; i<nm.length; i++)
    {
		System.out.println("I="+i);
		if(i==0)
		{
		code=GetIntroCodeForDownline.getIntroCodeForDownline(nm[i], pinNo);
		introCode.add(i, code);
		System.out.println("Return Code= "+code);
		}
		else
		{
		String codePass=introCode.get(i-1);
		code1=GetIntroCodeForDownline.getIntroCodeForDownline(nm[i], codePass);
		introCode.add(i, code1);
		System.out.println("return Code= "+code1);
		}
	}
	pw.println(pr);
}

else if(request.getParameter("allotlevel").equals("Field Officer"))
{
	String nm[]={"Organizer","Team Leader","Inspector","SR. Inspector","Developement Officer","SR Developement Officer","Rezonal Officer","Zonal Officer","SR Zonal Officer"};
	float pr=0;
	ArrayList<String> introCode = new ArrayList();
	String code=null,code1=null;
	for (int i=0; i<nm.length; i++)
    {
		System.out.println("I="+i);
		if(i==0)
		{
		code=GetIntroCodeForDownline.getIntroCodeForDownline(nm[i], pinNo);
		introCode.add(i, code);
		System.out.println("Return Code= "+code);
		}
		else
		{
		String codePass=introCode.get(i-1);
		code1=GetIntroCodeForDownline.getIntroCodeForDownline(nm[i], codePass);
		introCode.add(i, code1);
		System.out.println("return Code= "+code1);
		}
	}
	pw.println(pr);
}

else if(request.getParameter("allotlevel").equals("Sales Executive"))
{
	String nm[]={"Field Officer","Organizer","Team Leader","Inspector","SR. Inspector","Developement Officer","SR Developement Officer","Rezonal Officer","Zonal Officer","SR Zonal Officer","Executiive Manager"};
	float pr=0;
	ArrayList<String> introCode = new ArrayList();
	String code=null,code1=null;
	for (int i=0; i<nm.length; i++)
    {
		System.out.println("I="+i);
		if(i==0)
		{
		code=GetIntroCodeForDownline.getIntroCodeForDownline(nm[i], pinNo);
		introCode.add(i, code);
		System.out.println("Return Code= "+code);
		}
		else
		{
		String codePass=introCode.get(i-1);
		code1=GetIntroCodeForDownline.getIntroCodeForDownline(nm[i], codePass);
		introCode.add(i, code1);
		System.out.println("return Code= "+code1);
		}
	}
	pw.println(pr);
}

%>