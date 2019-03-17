<%@page import="com.pit.policy.Demo.GetLevelName"%>
<%@page import="java.time.Year"%>
<%@page import="java.util.Locale"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.pit.policy.Demo.DownlineDemo"%>
<%@page import="com.pit.policy.save.ConvertLevel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.pit.policy.save.GetIntroCodeForDownline"%>
<%@page import="com.pit.policy.save.CountLevelNumber"%>
<%@page import="com.pit.policy.save.GetpromBussFromLevel"%>
<%@page import="com.pit.policy.save.MaintainPinUseUnUse"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.pit.policy.database.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adviser Save</title>
</head>
<body>
<input type = "hidden" name = "pinNos" id="pinNos" value = "<%= request.getParameter("pinNos")%>">
<input type = "hidden" name = "level" id="level" value = "<%= request.getParameter("allotlevel")%>">

<%
Connection connection=DBConnection.getConnection();
PreparedStatement ptmt=connection.prepareStatement("set global max_connections=100000000");
ptmt.executeQuery();

Date date1 = Calendar.getInstance().getTime();  
DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");  
String strDate = dateFormat.format(date1);  
System.out.println(strDate);


DateFormat formatter2 = new SimpleDateFormat("dd-MM-yyyy"); 
Date dOfPay = new SimpleDateFormat("dd-MM-yyyy", Locale.ENGLISH)
        .parse(formatter2.format(date1));
System.out.println(dOfPay);

PreparedStatement pstmt10=connection.prepareStatement("select * from year_structure ");
ResultSet rs1=pstmt10.executeQuery();
String startDate=null,endtDate=null;
Date sDate = null,eDate = null;
String newYear=null;
while(rs1.next())
{	
	startDate=rs1.getString("startDate");
	System.out.println(startDate);
	sDate = new SimpleDateFormat("dd-MM-yyyy", Locale.ENGLISH)
            .parse(startDate);
	endtDate=rs1.getString("endDate");
	System.out.println(endtDate);
	eDate = new SimpleDateFormat("dd-MM-yyyy", Locale.ENGLISH)
            .parse(endtDate);
	if(dOfPay.compareTo(sDate) >= 0&&dOfPay.compareTo(eDate) <= 0)
	{
		newYear=rs1.getString("year");
	}
}

String promBuss=GetpromBussFromLevel.getpromBuss(request.getParameter("allotlevel"),newYear);
System.out.println("Pin Number="+request.getParameter("pinNos"));
Calendar calendar = Calendar.getInstance();
java.sql.Date ourdate = new java.sql.Date(calendar.getTime().getTime());

int levelNoFirst=GetLevelName.getLevelNo(request.getParameter("allotlevel"));

PreparedStatement pstmt=connection.prepareStatement("insert into advisors(pin_no,name,intro_code,intro_name,pan_card,mobile,addhar_card,near_opc,dob,address,pin_code,code,pay_method,doj,opc,level,introlevel,pbuss,target,year,levelNo,status) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
pstmt.setString(1, request.getParameter("pinNos"));
pstmt.setString(2, request.getParameter("name"));
pstmt.setString(3, request.getParameter("intCode"));
pstmt.setString(4, request.getParameter("itroName"));
pstmt.setString(5, request.getParameter("panCard"));
pstmt.setString(6, request.getParameter("mobNo"));
pstmt.setString(7, request.getParameter("aadharNo"));
pstmt.setString(8, request.getParameter("nearOpc"));
pstmt.setString(9, request.getParameter("dob"));
pstmt.setString(10, request.getParameter("address"));
pstmt.setString(11, request.getParameter("code"));
pstmt.setString(12, request.getParameter("pinCode"));
pstmt.setString(13, request.getParameter("paymethod"));
pstmt.setDate(14, ourdate);
pstmt.setString(15, "null");
pstmt.setString(16, request.getParameter("allotlevel"));
pstmt.setString(17, request.getParameter("introlevel"));
pstmt.setString(18, "0");
pstmt.setString(19, promBuss);
pstmt.setString(20, newYear);
pstmt.setInt(21, levelNoFirst);
pstmt.setString(22, "Active");
int res=pstmt.executeUpdate();
if(res>0)
{
	PreparedStatement pst=connection.prepareStatement("insert into wallet(pinNo,debit,credit,balance,year) values(?,?,?,?,?)");
	pst.setString(1, request.getParameter("pinNos"));
	pst.setString(2, "0");
	pst.setString(3, "0");
	pst.setString(4, "0");
	pst.setString(5, newYear);
	pst.executeUpdate();
	
	boolean b=MaintainPinUseUnUse.maintainPinUseUnUse(request.getParameter("nearOpc"));
	boolean val1=MaintainPinUseUnUse.deletePinFromOPcAvaiPin(request.getParameter("nearOpc"), request.getParameter("name"), request.getParameter("mobNo"), request.getParameter("itroName"));
int no=CountLevelNumber.countLevelNumber(request.getParameter("allotlevel"));
PreparedStatement pstmt1=connection.prepareStatement("insert into advisordownlinereport(name,advCode,intCode,mobile,doj,level,proBuss,pending,team,promotion,year) values(?,?,?,?,?,?,?,?,?,?,?)");
pstmt1.setString(1,request.getParameter("name"));
pstmt1.setString(2,request.getParameter("pinNos"));
pstmt1.setString(3,request.getParameter("intCode"));
pstmt1.setString(4,request.getParameter("mobNo"));
pstmt1.setDate(5,ourdate);
pstmt1.setString(6,Integer.toString(no));
pstmt1.setString(7,"0");
pstmt1.setString(8,"0");
pstmt1.setString(9,"0");
pstmt1.setString(10,"0");
pstmt1.setString(11,newYear);
pstmt1.executeUpdate();


/*Below code is for storing Advisor downline report  */
String pinNo=request.getParameter("pinNos");

System.out.println("Intro evel="+request.getParameter("allotlevel"));
System.out.println("Intro evel="+request.getParameter("pinNo"));
Connection con=DBConnection.getConnection();
if(request.getParameter("allotlevel").equals("Executiive Manager"))
{
	
	
	
	String cpbuss=GetpromBussFromLevel.getpromBussDone(pinNo,newYear);
	
	
	String rpbussi=GetpromBussFromLevel.getpromBussRemain(pinNo,newYear);
	
	
	String checkP=GetpromBussFromLevel.checkPromotion(pinNo,newYear);
	
	
	PreparedStatement p=con.prepareStatement("update advisordownlinereport set proBuss=? ,pending=? ,team=? ,promotion=?,Executiive_Manager=? where advCode=? And year=?");
	p.setString(1,cpbuss);
	p.setString(2,rpbussi);
	p.setString(3,"1");
	p.setString(4,checkP);
	p.setString(5,pinNo);
	p.setString(6, pinNo);
	p.setString(7, newYear);
	p.executeUpdate();
	/* String nm1[]={"Executiive Manager","SR Zonal Officer","Zonal Officer","Rezonal Officer","SR Developement Officer","Developement Officer","SR. Inspector","Inspector","Team Leader","Organizer","Field Officer","Sales Executive"};
	float pr=0;
	int completepromBuss=0,reamainpromBuss=0,CompletePromotion=0;
	ArrayList<String> introCode = new ArrayList();
	ArrayList<String> pbuss = new ArrayList();
	ArrayList<String> rbuss = new ArrayList();
	ArrayList<String> promotion = new ArrayList();
	String code1=null;
	
	
	
	for(int k=0;k<nm1.length;k++)
	{
		if(k==0)
		{
			String cpbuss=GetpromBussFromLevel.getpromBussDone(request.getParameter("allotlevel"));
			pbuss.add(k, cpbuss);
			
			String rpbussi=GetpromBussFromLevel.getpromBussRemain(request.getParameter("allotlevel"));
			rbuss.add(k, rpbussi);
			
			String checkP=GetpromBussFromLevel.checkPromotion(request.getParameter("allotlevel"));
			promotion.add(k, checkP);
		}
		else
		{
		for(int l=k; l<12;l++)
		{
			
			String cpbuss=GetpromBussFromLevel.getpromBussDone(introCode.get(l));
			pbuss.add(l, cpbuss);
			
			String rpbussi=GetpromBussFromLevel.getpromBussRemain(introCode.get(l));
			rbuss.add(l, rpbussi);
			
			String checkP=GetpromBussFromLevel.checkPromotion(introCode.get(l));
			promotion.add(l, checkP);
			
			break;
		}
		}
	}
	
	for(int p=0;p<pbuss.size();p++)
	{
		completepromBuss=Integer.parseInt(pbuss.get(p));
	}
	for(int r=0;r<rbuss.size();r++)
	{
		reamainpromBuss=Integer.parseInt(rbuss.get(r));
	}
	for(int c=0;c<promotion.size();c++)
	{
		CompletePromotion=Integer.parseInt(promotion.get(c));
	}
	PreparedStatement p=con.prepareStatement("update advisordownlinereport set proBuss=? ,pending=? ,team=? ,promotion=? where advCode=?");
	p.setString(1,Integer.toString(completepromBuss ));
	p.setString(1,Integer.toString(reamainpromBuss ));
	p.setString(1,Integer.toString(introCode.size()));
	p.setString(1,Integer.toString(CompletePromotion ));
	p.setString(2, request.getParameter("allotlevel"));
	p.executeUpdate(); */
}
else
{
	String levelNo=null,introCode=null,introcode1=null;
	int LevelNUM=0,LevelNUM1=0,l=0;
	String level=null,intcode=null;
	
		
		
		String nm[]={"Sales Executive","Field Officer","Organizer","Team Leader","Inspector","SR. Inspector","Developement Officer","SR Developement Officer","Rezonal Officer","Zonal Officer","SR Zonal Officer","Executiive Manager","SR Executiive Manager","ABC"};
		ArrayList<String> nmm=ConvertLevel.convertLevel(nm);
	PreparedStatement pstmt12=con.prepareStatement("select * from advisors where year=? And pin_no=?");
	pstmt12.setString(1, newYear);
	pstmt12.setString(2, pinNo);
	ResultSet rs=pstmt12.executeQuery();
	int m=0;
	while(rs.next())
	{	
		
		int cnt = 0;
		pinNo=rs.getString("pin_no");
		levelNo=rs.getString("levelNo");
		
		if(levelNo.equals(null)){
			levelNo="0";
		}
		String levelNo1=levelNo;
		introCode=rs.getString("intro_code");
		for(int i=Integer.parseInt(levelNo);i<13;i++)
		{
			
			if(i==Integer.parseInt(levelNo)){
				
				
				System.out.println("Level No 11 = "+levelNo+" Intro Code 11= "+introCode);
				System.out.println("update advisordownlinereport set "+nmm.get(Integer.parseInt(levelNo))+"=? where advCode=116975");
				PreparedStatement pstmt11=con.prepareStatement("update advisordownlinereport set "+nmm.get(Integer.parseInt(levelNo))+"=?,team=? where advCode=? And year=?");
				pstmt11.setString(1,introCode );
				pstmt11.setString(2,Integer.toString(cnt+1) );
				pstmt11.setString(3,pinNo );
				pstmt11.setString(4, newYear);
				int res11=pstmt11.executeUpdate();
				System.out.println(res);
				cnt = cnt + 1;
				 level=DownlineDemo.getLevelNo(introCode,newYear);
				 if(level==null)
				 {
				 
				 }
				 else
				 {
				System.out.println("level "+level);
				cnt = cnt + 1;
				intcode=DownlineDemo.getLevel(level, introCode);
				System.out.println("Level No22  = "+level+" Intro Code22 = "+intcode);
				PreparedStatement pstmt2=con.prepareStatement("update advisordownlinereport set "+nmm.get(Integer.parseInt(level))+"=?,team=? where advCode=? And year=?");
				pstmt2.setString(1,intcode );
				pstmt2.setString(2,Integer.toString(cnt+1) );
				pstmt2.setString(3,pinNo );
				pstmt2.setString(4,newYear );
				int res1=pstmt2.executeUpdate();
				 }
				}
			else
			{
				System.out.println("Insite else");
				String level1=DownlineDemo.getLevelNo(intcode,newYear);
				System.out.println("level Else "+level1);
				System.out.println();
				if(level1==null)
				{
					System.out.println("Break");
					break;
				}
				else
				{
				
				String intcode1=DownlineDemo.getLevel(level1, intcode);
				System.out.println("Level No33 = "+level1+" Intro Code33 = "+intcode1);
				PreparedStatement pstmt2=con.prepareStatement("update advisordownlinereport set "+nmm.get(Integer.parseInt(level1))+"=?,team=? where advCode=? And year=?");
				pstmt2.setString(1,intcode1 );
				pstmt2.setString(2,Integer.toString(cnt+1) );
				pstmt2.setString(3,pinNo );
				pstmt2.setString(4,newYear );
				int res1=pstmt2.executeUpdate();
				intcode=intcode1;
				cnt = cnt + 1;
				}
				
			}
		}
		
	}
}

/*End Downline reprt code  */

%>
<script type="text/javascript">
alert("Advisor registration successfully");
var pin_no=document.getElementById("pinNos").value;
var level=document.getElementById("level").value;
window.location='letter.jsp?pin_no='+pin_no+"&level="+level;
</script>
<%}else{%>
<script type="text/javascript">
alert("Advisor can't registered");
window.location='errorpage.html';
</script>	
<%}%>
</body>
</html>