<%@page import="java.util.Calendar"%>
<%@page import="com.pit.policy.save.Getprice"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.pit.policy.save.GetIntroLevel"%>
<%
PrintWriter pw=response.getWriter();
System.out.println("Intro evel="+request.getParameter("introLevel"));
System.out.println("Intro evel="+request.getParameter("planType"));
System.out.println("Intro evel="+request.getParameter("month"));


/* String introSpot=GetIntroLevel.getintroSpot(request.getParameter("introLevel"), Integer.toString(year), request.getParameter("planType"), request.getParameter("month"));
pw.println(introSpot); */


if(request.getParameter("introLevel").equals("Sales Executive"))
{
	int year = Calendar.getInstance().get(Calendar.YEAR);
	String year1=Integer.toString(year);
	System.out.println(year1.substring(year1.length() - 2));
	String year2="20"+(Integer.parseInt(year1.substring(year1.length() - 2))-1)+"-"+year1.substring(year1.length() - 2);
	System.out.println(year2);

	float price=Getprice.addMonthsForIncentive1(request.getParameter("introLevel"),request.getParameter("planType"),year2 ,request.getParameter("month") );
	pw.println(price);
}
else if(request.getParameter("introLevel").equals("Field Officer"))
{
	int year = Calendar.getInstance().get(Calendar.YEAR);
	String year1=Integer.toString(year);
	System.out.println(year1.substring(year1.length() - 2));
	String year2="20"+(Integer.parseInt(year1.substring(year1.length() - 2))-1)+"-"+year1.substring(year1.length() - 2);
	System.out.println(year2);
	float pr=0;
	String nm[]={"Sales Executive","Field Officer"};
	for (int i=0; i<nm.length; i++)
    {
		float price=Getprice.addMonthsForIncentive1(nm[i], request.getParameter("planType"),year2 ,request.getParameter("month"));
	pr=pr+price;
	}
	pw.println(pr);
}
else if(request.getParameter("introLevel").equals("Field Officer"))
{
	int year = Calendar.getInstance().get(Calendar.YEAR);
	String year1=Integer.toString(year);
	System.out.println(year1.substring(year1.length() - 2));
	String year2="20"+(Integer.parseInt(year1.substring(year1.length() - 2))-1)+"-"+year1.substring(year1.length() - 2);
	System.out.println(year2);
	float pr=0;
	String nm[]={"Sales Executive","Field Officer"};
	for (int i=0; i<nm.length; i++)
    {
		float price=Getprice.addMonthsForIncentive1(nm[i], request.getParameter("planType"),year2 ,request.getParameter("month"));
	pr=pr+price;
	}
	pw.println(pr);
}

else if(request.getParameter("introLevel").equals("Organizer"))
{
	int year = Calendar.getInstance().get(Calendar.YEAR);
	String year1=Integer.toString(year);
	System.out.println(year1.substring(year1.length() - 2));
	String year2="20"+(Integer.parseInt(year1.substring(year1.length() - 2))-1)+"-"+year1.substring(year1.length() - 2);
	System.out.println(year2);
	float pr=0;
	String nm[]={"Sales Executive","Field Officer","Organizer"};
	for (int i=0; i<nm.length; i++)
    {
		float price=Getprice.addMonthsForIncentive1(nm[i], request.getParameter("planType"),year2 ,request.getParameter("month"));
	pr=pr+price;
	}
	pw.println(pr);
}

else if(request.getParameter("introLevel").equals("Team Leader"))
{
	int year = Calendar.getInstance().get(Calendar.YEAR);
	String year1=Integer.toString(year);
	System.out.println(year1.substring(year1.length() - 2));
	String year2="20"+(Integer.parseInt(year1.substring(year1.length() - 2))-1)+"-"+year1.substring(year1.length() - 2);
	System.out.println(year2);
	float pr=0;
	String nm[]={"Sales Executive","Field Officer","Organizer","Team Leader"};
	for (int i=0; i<nm.length; i++)
    {
		float price=Getprice.addMonthsForIncentive1(nm[i], request.getParameter("planType"),year2 ,request.getParameter("month"));
	pr=pr+price;
	}
	pw.println(pr);
}

else if(request.getParameter("introLevel").equals("Inspector"))
{
	int year = Calendar.getInstance().get(Calendar.YEAR);
	String year1=Integer.toString(year);
	System.out.println(year1.substring(year1.length() - 2));
	String year2="20"+(Integer.parseInt(year1.substring(year1.length() - 2))-1)+"-"+year1.substring(year1.length() - 2);
	System.out.println(year2);
	float pr=0;
	String nm[]={"Sales Executive","Field Officer","Organizer","Team Leader","Inspector"};
	for (int i=0; i<nm.length; i++)
    {
		float price=Getprice.addMonthsForIncentive1(nm[i], request.getParameter("planType"),year2 ,request.getParameter("month"));
	pr=pr+price;
	}
	pw.println(pr);
}

else if(request.getParameter("introLevel").equals("SR. Inspector"))
{
	int year = Calendar.getInstance().get(Calendar.YEAR);
	String year1=Integer.toString(year);
	System.out.println(year1.substring(year1.length() - 2));
	String year2="20"+(Integer.parseInt(year1.substring(year1.length() - 2))-1)+"-"+year1.substring(year1.length() - 2);
	System.out.println(year2);
	float pr=0;
	String nm[]={"Sales Executive","Field Officer","Organizer","Team Leader","Inspector","SR. Inspector"};
	for (int i=0; i<nm.length; i++)
    {
		float price=Getprice.addMonthsForIncentive1(nm[i], request.getParameter("planType"),year2 ,request.getParameter("month"));
	pr=pr+price;
	}
	pw.println(pr);
}


else if(request.getParameter("introLevel").equals("Developement Officer"))
{
	int year = Calendar.getInstance().get(Calendar.YEAR);
	String year1=Integer.toString(year);
	System.out.println(year1.substring(year1.length() - 2));
	String year2="20"+(Integer.parseInt(year1.substring(year1.length() - 2))-1)+"-"+year1.substring(year1.length() - 2);
	System.out.println(year2);
	float pr=0;
	String nm[]={"Sales Executive","Field Officer","Organizer","Team Leader","Inspector","SR. Inspector","Developement Officer"};
	for (int i=0; i<nm.length; i++)
    {
		float price=Getprice.addMonthsForIncentive1(nm[i], request.getParameter("planType"),year2 ,request.getParameter("month"));
	pr=pr+price;
	}
	pw.println(pr);
}

else if(request.getParameter("introLevel").equals("SR Developement Officer"))
{
	int year = Calendar.getInstance().get(Calendar.YEAR);
	String year1=Integer.toString(year);
	System.out.println(year1.substring(year1.length() - 2));
	String year2="20"+(Integer.parseInt(year1.substring(year1.length() - 2))-1)+"-"+year1.substring(year1.length() - 2);
	System.out.println(year2);
	float pr=0;
	String nm[]={"Sales Executive","Field Officer","Organizer","Team Leader","Inspector","SR. Inspector","Developement Officer","SR Developement Officer"};
	for (int i=0; i<nm.length; i++)
    {
		float price=Getprice.addMonthsForIncentive1(nm[i], request.getParameter("planType"),year2 ,request.getParameter("month"));
	pr=pr+price;
	}
	pw.println(pr);
}

else if(request.getParameter("introLevel").equals("Rezonal Officer"))
{
	int year = Calendar.getInstance().get(Calendar.YEAR);
	String year1=Integer.toString(year);
	System.out.println(year1.substring(year1.length() - 2));
	String year2="20"+(Integer.parseInt(year1.substring(year1.length() - 2))-1)+"-"+year1.substring(year1.length() - 2);
	System.out.println(year2);
	float pr=0;
	String nm[]={"Sales Executive","Field Officer","Organizer","Team Leader","Inspector","SR. Inspector","Developement Officer","SR Developement Officer","Rezonal Officer"};
	for (int i=0; i<nm.length; i++)
    {
	float price=Getprice.addMonthsForIncentive1(nm[i], request.getParameter("planType"),year2 ,request.getParameter("month"));
	pr=pr+price;
	}
	pw.println(pr);
}

else if(request.getParameter("introLevel").equals("Zonal Officer"))
{
	int year = Calendar.getInstance().get(Calendar.YEAR);
	String year1=Integer.toString(year);
	System.out.println(year1.substring(year1.length() - 2));
	String year2="20"+(Integer.parseInt(year1.substring(year1.length() - 2))-1)+"-"+year1.substring(year1.length() - 2);
	System.out.println(year2);
	float pr=0;
	String nm[]={"Sales Executive","Field Officer","Organizer","Team Leader","Inspector","SR. Inspector","Developement Officer","SR Developement Officer","Rezonal Officer","Zonal Officer"};
	for (int i=0; i<nm.length; i++)
    {
	float price=Getprice.addMonthsForIncentive1(nm[i], request.getParameter("planType"),year2 ,request.getParameter("month"));
	pr=pr+price;
	}
	pw.println(pr);
}

else if(request.getParameter("introLevel").equals("SR Zonal Officer"))
{
	int year = Calendar.getInstance().get(Calendar.YEAR);
	String year1=Integer.toString(year);
	System.out.println(year1.substring(year1.length() - 2));
	String year2="20"+(Integer.parseInt(year1.substring(year1.length() - 2))-1)+"-"+year1.substring(year1.length() - 2);
	System.out.println(year2);
	float pr=0;
	String nm[]={"Sales Executive","Field Officer","Organizer","Team Leader","Inspector","SR. Inspector","Developement Officer","SR Developement Officer","Rezonal Officer","Zonal Officer","SR Zonal Officer"};
	for (int i=0; i<nm.length; i++)
    {
	float price=Getprice.addMonthsForIncentive1(nm[i], request.getParameter("planType"),year2 ,request.getParameter("month"));
	pr=pr+price;
	}
	pw.println(pr);
}

else if(request.getParameter("introLevel").equals("Executiive Manager"))
{
	int year = Calendar.getInstance().get(Calendar.YEAR);
	String year1=Integer.toString(year);
	System.out.println(year1.substring(year1.length() - 2));
	String year2="20"+(Integer.parseInt(year1.substring(year1.length() - 2))-1)+"-"+year1.substring(year1.length() - 2);
	System.out.println(year2);
	float pr=0;
	String nm[]={"Sales Executive","Field Officer","Organizer","Team Leader","Inspector","SR. Inspector","Developement Officer","SR Developement Officer","Rezonal Officer","Zonal Officer","SR Zonal Officer","Executiive Manager"};
	for (int i=0; i<nm.length; i++)
    {
	float price=Getprice.addMonthsForIncentive1(nm[i], request.getParameter("planType"),year2 ,request.getParameter("month"));
	pr=pr+price;
	}
	pw.println(pr);
}

%>