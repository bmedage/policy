<%@page import="com.pit.policy.Demo.GetLevelName"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.pit.policy.save.ConvertLevel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.pit.policy.save.GetIntroCodeForDownline"%>
<%@page import="com.pit.policy.save.CountLevelNumber"%>
<%@page import="com.pit.policy.save.GetpromBussFromLevel"%>
<%@page import="com.pit.policy.save.MaintainPinUseUnUse"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Date"%>
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
Connection connection=DBConnection.getConnection();
PreparedStatement ptmt=connection.prepareStatement("set global max_connections=100000000");
ptmt.executeQuery();
System.out.println("Connection "+connection);
try
{
	System.out.println("Insite try");
String advId=null,finalname=null,Jioning_Date=null,level=null,introid=null,introlevel=null,levelName=null,introlevelName=null;
 String level1=null; 
PreparedStatement pstmtt=connection.prepareStatement("select pin_no,name,doj,levelNo,intro_code from advisors where year=?");
pstmtt.setString(1,"2016-17");
ResultSet rs=pstmtt.executeQuery();
while(rs.next())
{
	advId=rs.getString("pin_no");
	finalname=rs.getString("name");
	Jioning_Date=rs.getString("doj");
	level=rs.getString("levelNo");
	 level1=Integer.toString(Integer.parseInt(level)+1); 
	levelName=GetLevelName.getLevelName(level1);
	introid=rs.getString("intro_code");
	
	


String promBuss=GetpromBussFromLevel.getpromBuss(levelName,"2016-17");
System.out.println("Pin Number="+advId);
Calendar calendar = Calendar.getInstance();
java.sql.Date ousrdate = new java.sql.Date(calendar.getTime().getTime());

PreparedStatement pstmt=connection.prepareStatement("insert into advisors(pin_no,name,intro_code,intro_name,pan_card,mobile,addhar_card,near_opc,dob,address,pin_code,code,pay_method,doj,opc,level,introlevel,pbuss,target,year,levelNo) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
pstmt.setString(1, advId);
pstmt.setString(2, finalname);
pstmt.setString(3, introid);
pstmt.setString(4, "0");
pstmt.setString(5, "0");
pstmt.setString(6, "0");
pstmt.setString(7, "0");
pstmt.setString(8, "1001_PTN");
pstmt.setString(9, "0");
pstmt.setString(10, "0");
pstmt.setString(11, advId);
pstmt.setString(12, "0");
pstmt.setString(13, "Cash");
pstmt.setString(14, Jioning_Date);
pstmt.setString(15, "null");
pstmt.setString(16, levelName);
pstmt.setString(17, "0");
pstmt.setString(18, "0");
pstmt.setString(19, promBuss);
pstmt.setString(20,"2017-18");
pstmt.setString(21,level1);
int res=pstmt.executeUpdate();
if(res>0)
{
	PreparedStatement pst=connection.prepareStatement("insert into wallet(pinNo,debit,credit,balance,year) values(?,?,?,?,?)");
	pst.setString(1, advId);
	pst.setString(2, "0");
	pst.setString(3, "0");
	pst.setString(4, "0");
	pst.setString(5, "2017-18");
	pst.executeUpdate();
	
	boolean b=MaintainPinUseUnUse.maintainPinUseUnUse("1001_PATAN");
	boolean val1=MaintainPinUseUnUse.deletePinFromOPcAvaiPin("1001_PATAN", finalname, "0", "0");
int no=CountLevelNumber.countLevelNumber(levelName);
PreparedStatement pstmt1=connection.prepareStatement("insert into advisordownlinereport(name,advCode,intCode,mobile,doj,level,proBuss,pending,team,promotion,year) values(?,?,?,?,?,?,?,?,?,?,?)");
pstmt1.setString(1,finalname);
pstmt1.setString(2,advId);
pstmt1.setString(3,introid);
pstmt1.setString(4,"0");
pstmt1.setString(5,Jioning_Date);
pstmt1.setString(6,Integer.toString(no));
pstmt1.setString(7,"0");
pstmt1.setString(8,"0");
pstmt1.setString(9,"0");
pstmt1.setString(10,"0");
pstmt1.setString(11,"2017-18");
pstmt1.executeUpdate();


/*Below code is for storing Advisor downline report  */
String pinNo=advId;

System.out.println("Intro evel="+levelName);
System.out.println("Intro evel="+request.getParameter("pinNo"));


/*End Downline reprt code  */
}
}
}
catch(Exception ee)
{
	ee.printStackTrace();
}
finally
{
	DBConnection.close(connection);
	System.out.println("Connection Close");
}%>
</body>
</html>