<%@page import="java.util.Locale"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.pit.policy.save.AddPromotionalBuss"%>
<%@page import="com.pit.policy.save.GetPromBuss"%>
<%@page import="com.pit.policy.save.SaveIncentiveFromLevel"%>
<%@page import="com.pit.policy.save.GetWalletBalanceInPolicySave"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.pit.policy.save.AddRenewealMaster1"%>
<%@page import="com.pit.policy.save.MaintainAdvAcStmt"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.pit.policy.save.GetPeriodfromPlanId"%>
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

<input type = "hidden" name = "formNo" id = "formNo" value = "<%= request.getParameter("formNo") %>" >
<%
System.out.println("ppayMethod"+request.getParameter("ppayMethod"));
System.out.println("DDNo "+request.getParameter("ddNo"));
System.out.println("Bank Name "+request.getParameter("bankName"));
System.out.println("Branch Name"+request.getParameter("bName"));
%>
<%
Connection cn=DBConnection.getConnection();
PreparedStatement ptmt=cn.prepareStatement("set global max_connections=100000000");
ptmt.executeQuery();

Date date1 = Calendar.getInstance().getTime();  
DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");  
String strDate = dateFormat.format(date1);  
System.out.println(strDate);


DateFormat formatter2 = new SimpleDateFormat("dd-MM-yyyy"); 
Date dOfPay = new SimpleDateFormat("dd-MM-yyyy", Locale.ENGLISH)
        .parse(formatter2.format(date1));
System.out.println(dOfPay);

PreparedStatement pstmt10=cn.prepareStatement("select * from year_structure ");
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

Calendar calendar1 = Calendar.getInstance();
java.sql.Date ourdate = new java.sql.Date(calendar1.getTime().getTime());

/* This format is used for conversion of date to String For save saveIncentiveFromLevel method call  */
DateFormat dateFormat5 = new SimpleDateFormat("yyyy-MM-dd");

if(request.getParameter("planType").equals("FD"))
{
	String formNo=request.getParameter("formNo");
	String name=request.getParameter("name");
	String panCard=request.getParameter("panCard");
	String mobNo=request.getParameter("mobNo");
	String aadharNo=request.getParameter("aadharNo");
	String nearOPC=request.getParameter("near");
	String dob=request.getParameter("dob");
	String address=request.getParameter("address");
	String custId=request.getParameter("custId");
	String pinCode=request.getParameter("pinCode");
	String finYear=request.getParameter("finYear");
	String planType=request.getParameter("planType");
	String planID=request.getParameter("planID");
	String month=request.getParameter("month");
	String introCode=request.getParameter("introCode");
	String introName=request.getParameter("introName");
	String introLevel=request.getParameter("introLevel");
	String sIncentive=request.getParameter("sIncentive");
	String sAmount=request.getParameter("sAmount");
	String netPay=request.getParameter("netPay");
	String payMethod=request.getParameter("payMethod");
	String planAmount=request.getParameter("planAmount");
	String payMode=null;
	String priceForMode=null;
	if(request.getParameter("y") != null)
	{
		payMode="Y";
		String yearly=request.getParameter("yearly");
		priceForMode=yearly;
	}
	else if(request.getParameter("h") != null)
	{
		payMode="H";
		String halfly=request.getParameter("halfly");
		priceForMode=halfly;
	}
	else if(request.getParameter("q") != null)
	{
		payMode="Q";
		String quartly=request.getParameter("quartly");
		priceForMode=quartly;
	}
	else if(request.getParameter("m") != null)
	{
		payMode="M";
		String monthly=request.getParameter("monthly");
		priceForMode=monthly;
	}
	String mAmount=request.getParameter("mAmount");
	String mDate=request.getParameter("mDate");
	
	/*This code save Bussiness report */
	String promBussPer1=GetPromBuss.getPromBuss(newYear, planType, month);
			String promBuss1=Integer.toString(Integer.parseInt(planAmount)/100*Integer.parseInt(promBussPer1));
	PreparedStatement pstt=cn.prepareStatement("insert into busssinessreport(opcName,type,paymode,month,price,year,date,pbuss) values(?,?,?,?,?,?,?,?)");
	pstt.setString(1,nearOPC);
	pstt.setString(2, planType);
	pstt.setString(3, "No");
	pstt.setString(4,month );
	pstt.setString(5,planAmount );
	pstt.setString(6, newYear);
	pstt.setDate(7, ourdate);
	pstt.setString(8, promBuss1);
	pstt.executeUpdate();
	
	String ddno=null;
	if(request.getParameter("ddNo")==null)
	
	{
		ddno="0";
	}
	else
	{
	ddno=request.getParameter("ddNo");
	}
	
	String banknm=null;
	if(request.getParameter("banknm")==null)
	
	{
		banknm="0";
	}
	else
	{
		banknm= request.getParameter("bankName");
	}
	
	String branchnm=null;
	if(request.getParameter("branchnm")==null)
	
	{
		branchnm="0";
	}
	else
	{
		branchnm=request.getParameter("bName");
	}





	
	PreparedStatement pstmt=cn.prepareStatement("insert into add_new_policy(Form_No,Name,Pan_Card,Mobile_No,Aadhar_No,Near_OPC,DOB,Address,Cust_Id,Pin_Code,finyear,planType,planId,month,introCode,intro_name,introLevel,Spot_Inc,Spot_Amt,Net_Pay,Payment_Mtd,planAmt,paymentMode,priceForMode,maturityAmount,mDate,date,pPayMtd,ddNo,bankName,branchName) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	pstmt.setString(1, formNo);
	pstmt.setString(2, name);
	pstmt.setString(3, panCard);
	pstmt.setString(4, mobNo);
	pstmt.setString(5, aadharNo);
	pstmt.setString(6, nearOPC);
	pstmt.setString(7, dob);
	pstmt.setString(8, address);
	pstmt.setString(9, custId);
	pstmt.setString(10, pinCode);
	pstmt.setString(11, newYear);
	pstmt.setString(12, planType);
	pstmt.setString(13,planID);
	pstmt.setString(14, month);
	pstmt.setString(15, introCode);
	pstmt.setString(16, introName);
	pstmt.setString(17, introLevel);
	pstmt.setString(18,sIncentive );
	pstmt.setString(19, sAmount);
	pstmt.setString(20, netPay);
	pstmt.setString(21,payMethod );
	pstmt.setString(22,planAmount );
	pstmt.setString(23,priceForMode);
	pstmt.setString(24,"No");
	pstmt.setString(25, mAmount);
	pstmt.setString(26, mDate);
	pstmt.setDate(27, ourdate);
	pstmt.setString(28, request.getParameter("ppayMethod"));
	 pstmt.setString(29,ddno);
		pstmt.setString(30,banknm);
		pstmt.setString(31, branchnm);
	int res=pstmt.executeUpdate();
	if(res>0)
	{
		/* This code save Incentive for All The level */
			/*dateFormat1.format(DOP),monthForPayId*/
		int val=SaveIncentiveFromLevel.saveIncentiveFromLevel(introLevel, month, newYear, planType, introCode, planAmount,dateFormat5.format(ourdate),formNo);	
		if(request.getParameter("payMethod").equals("Cash"))
		{
			String credit=GetWalletBalanceInPolicySave.getCredit(introCode,newYear);
			String debit=GetWalletBalanceInPolicySave.getdebit(introCode,newYear);
			String balance=GetWalletBalanceInPolicySave.getBalance(introCode,newYear);
			
			
			String promBussPer=GetPromBuss.getPromBuss(newYear, planType, month);
			String promBuss=Integer.toString(Integer.parseInt(planAmount)/100*Integer.parseInt(promBussPer));
			
			/*This add promotional bussiness to advisors  */
			int v=AddPromotionalBuss.addPromotionalBussiness(introCode, promBuss,newYear);
			
			String panCheck=GetPromBuss.CheckPanCard(introCode);
			float TDS=0,Admin=0,spotAmt=0;
			
			Admin=Float.parseFloat(request.getParameter("sAmount"))/100*5;
			if(panCheck.equals("null"))
			{
				TDS=Float.parseFloat(request.getParameter("sAmount"))/100*20;
			}
			else
			{
				TDS=Float.parseFloat(request.getParameter("sAmount"))/100*10;
			}
			spotAmt=Float.parseFloat(request.getParameter("sAmount"))-TDS-Admin;
			
			PreparedStatement pstmt1=cn.prepareStatement("update wallet set debit=?,credit=?,balance=? where pinNo=?");
			pstmt1.setString(1, Float.toString(spotAmt+Float.parseFloat(debit)));
			pstmt1.setString(2,credit);
			pstmt1.setString(3, balance);
			pstmt1.setString(4, introCode);
			pstmt1.executeUpdate();
			
			DateFormat dateFormat1 = new SimpleDateFormat("MM"); 
			/*dateFormat1.format(DOP),monthForPayId*/
			PreparedStatement p=cn.prepareStatement("insert into transaction(pinNo,tranType,debit,credit,balance,remark,date,bussiness,pbussiness,TDS,Admin,withdrawal,monthForPayId) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
			p.setString(1, introCode);
			p.setString(2, "Incentive");
			p.setString(3,Float.toString(spotAmt));
			p.setString(4, "0");
			p.setString(5, "0");
			p.setString(6, "Pay By Policy No"+formNo);
			p.setDate(7, ourdate);
			p.setString(8, planAmount);
			p.setString(9, promBuss);
			p.setString(10,Float.toString( TDS));
			p.setString(11, Float.toString(Admin));
			p.setString(12, "0");
			p.setString(13, dateFormat1.format(ourdate));
			p.executeUpdate();
	 
		}else
		{
			String credit=GetWalletBalanceInPolicySave.getCredit(introCode,newYear);
			String debit=GetWalletBalanceInPolicySave.getdebit(introCode,newYear);
			String balance=GetWalletBalanceInPolicySave.getBalance(introCode,newYear);
			
			String promBussPer=GetPromBuss.getPromBuss(newYear, planType, month);
			String promBuss=Integer.toString(Integer.parseInt(planAmount)/100*Integer.parseInt(promBussPer));
			
			/*This add promotional bussiness to advisors  */
			int v=AddPromotionalBuss.addPromotionalBussiness(introCode, promBuss,newYear);
			
			
			String panCheck=GetPromBuss.CheckPanCard(introCode);
			float TDS=0,Admin=0,spotAmt=0;
			
			Admin=Float.parseFloat(request.getParameter("sAmount"))/100*5;
			if(panCheck.equals("null"))
			{
				TDS=Float.parseFloat(request.getParameter("sAmount"))/100*20;
			}
			else
			{
				TDS=Float.parseFloat(request.getParameter("sAmount"))/100*10;
			}
			spotAmt=Float.parseFloat(request.getParameter("sAmount"))-TDS-Admin;
			
			PreparedStatement pstmt1=cn.prepareStatement("update wallet set debit=?,credit=?,balance=? where pinNo=?");
			pstmt1.setString(1, debit);
			pstmt1.setString(2,Float.toString(spotAmt+Float.parseFloat(credit)));
			pstmt1.setString(3, Float.toString(spotAmt+Float.parseFloat(balance)));
			pstmt1.setString(4, introCode);
			pstmt1.executeUpdate();
			
			DateFormat dateFormat1 = new SimpleDateFormat("MM"); 
			/*dateFormat1.format(DOP),monthForPayId*/
			PreparedStatement p=cn.prepareStatement("insert into transaction(pinNo,tranType,debit,credit,balance,remark,date,bussiness,pbussiness,TDS,Admin,withdrawal,monthForPayId) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
			p.setString(1, introCode);
			p.setString(2, "Incentive");
			p.setString(3,Float.toString(Admin+TDS));
			p.setString(4, request.getParameter("sAmount"));
			p.setString(5, Float.toString(spotAmt));
			p.setString(6, "Pay By Policy No"+formNo);
			p.setDate(7, ourdate);
			p.setString(8, planAmount);
			p.setString(9, promBuss);
			p.setString(10, Float.toString(TDS));
			p.setString(11,Float.toString( Admin));
			p.setString(12, "0");
			p.setString(13, dateFormat1.format(ourdate));
			p.executeUpdate();
			
			
			
			
			
			
		}
	%>
	<script type="text/javascript">
	alert("Policy Inserted Sucesssfully");
	var formNo = document.getElementById("formNo").value;
	window.location='Renewal.jsp?formNo='+formNo;
	</script>
	<%}
	else{%>
	<script type="text/javascript">
	alert("Policy not Inserted");
	window.location='errorpage.html';
	</script>
	<%}
	
}
else if(request.getParameter("planType").equals("RD"))
{
	
	String formNo=request.getParameter("formNo");
	String name=request.getParameter("name");
	String panCard=request.getParameter("panCard");
	String mobNo=request.getParameter("mobNo");
	String aadharNo=request.getParameter("aadharNo");
	String nearOPC=request.getParameter("near");
	String dob=request.getParameter("dob");
	String address=request.getParameter("address");
	String custId=request.getParameter("custId");
	String pinCode=request.getParameter("pinCode");
	String finYear=request.getParameter("finYear");
	String planType=request.getParameter("planType");
	String planID=request.getParameter("planID");
	System.out.println("Plan Id="+planID);
	String month=request.getParameter("month");
	String introCode=request.getParameter("introCode");
	String introName=request.getParameter("introName");
	String introLevel=request.getParameter("introLevel");
	String sIncentive=request.getParameter("sIncentive");
	String sAmount=request.getParameter("sAmount");
	String netPay=request.getParameter("netPay");
	String payMethod=request.getParameter("payMethod");
	String planAmount=request.getParameter("planAmount");
	String payMode=null;
	String priceForMode=null;
	if(request.getParameter("y") != null)
	{
		payMode="Y";
		String yearly=request.getParameter("yearly");
		priceForMode=yearly;
	}
	else if(request.getParameter("h") != null)
	{
		payMode="H";
		String halfly=request.getParameter("halfly");
		priceForMode=halfly;
	}
	else if(request.getParameter("q") != null)
	{
		payMode="Q";
		String quartly=request.getParameter("quartly");
		priceForMode=quartly;
	}
	else if(request.getParameter("m") != null)
	{
		payMode="M";
		String monthly=request.getParameter("monthly");
		priceForMode=monthly;
	}
	String mAmount=request.getParameter("mAmount");
	String mDate=request.getParameter("mDate");
	
	String promBussPer1=GetPromBuss.getPromBuss(newYear, planType, month);
	String promBuss1=Integer.toString(Integer.parseInt(priceForMode)/100*Integer.parseInt(promBussPer1));
	PreparedStatement pstt=cn.prepareStatement("insert into busssinessreport(opcName,type,paymode,month,price,year,date,pbuss) values(?,?,?,?,?,?,?,?)");
	pstt.setString(1,nearOPC);
	pstt.setString(2, planType);
	pstt.setString(3, payMode);
	pstt.setString(4,month );
	pstt.setString(5,priceForMode );
	pstt.setString(6, newYear);
	pstt.setDate(7, ourdate);
	pstt.setString(8, promBuss1);
	pstt.executeUpdate();
	
	String ddno=null;
	if(request.getParameter("ddNo")==null)
	
	{
		ddno="0";
	}
	else
	{
	ddno=request.getParameter("ddNo");
	}
	
	String banknm=null;
	if(request.getParameter("banknm")==null)
	
	{
		banknm="0";
	}
	else
	{
		banknm= request.getParameter("bankName");
	}
	
	String branchnm=null;
	if(request.getParameter("branchnm")==null)
	
	{
		branchnm="0";
	}
	else
	{
		branchnm=request.getParameter("bName");
	}





	
	PreparedStatement pstmt=cn.prepareStatement("insert into add_new_policy(Form_No,Name,Pan_Card,Mobile_No,Aadhar_No,Near_OPC,DOB,Address,Cust_Id,Pin_Code,finyear,planType,planId,month,introCode,intro_name,introLevel,Spot_Inc,Spot_Amt,Net_Pay,Payment_Mtd,planAmt,paymentMode,priceForMode,maturityAmount,mDate,date,pPayMtd,ddNo,bankName,branchName) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	pstmt.setString(1, formNo);
	pstmt.setString(2, name);
	pstmt.setString(3, panCard);
	pstmt.setString(4, mobNo);
	pstmt.setString(5, aadharNo);
	pstmt.setString(6, nearOPC);
	pstmt.setString(7, dob);
	pstmt.setString(8, address);
	pstmt.setString(9, custId);
	pstmt.setString(10, pinCode);
	pstmt.setString(11, newYear);
	pstmt.setString(12, planType);
	pstmt.setString(13,planID);
	pstmt.setString(14, month);
	pstmt.setString(15, introCode);
	pstmt.setString(16, introName);
	pstmt.setString(17, introLevel);
	pstmt.setString(18,sIncentive );
	pstmt.setString(19, sAmount);
	pstmt.setString(20, netPay);
	pstmt.setString(21, payMethod);
	pstmt.setString(22,planAmount );
	pstmt.setString(23,payMode );
	pstmt.setString(24,priceForMode );
	pstmt.setString(25, mAmount);
	pstmt.setString(26, mDate);
	pstmt.setDate(27, ourdate);
	pstmt.setString(28, request.getParameter("ppayMethod"));
	 pstmt.setString(29,ddno);
		pstmt.setString(30,banknm);
		pstmt.setString(31, branchnm);
	int res=pstmt.executeUpdate();
	if(res>0)
	{
		/* This code save Incentive for All The level */
		String policyNum=formNo;
		int val=SaveIncentiveFromLevel.saveIncentiveFromLevel(introLevel, month, newYear, planType, introCode, priceForMode,(dateFormat5.format(ourdate)),policyNum);
		if(request.getParameter("payMethod").equals("Cash"))
		{
			String credit=GetWalletBalanceInPolicySave.getCredit(introCode,newYear);
			String debit=GetWalletBalanceInPolicySave.getdebit(introCode,newYear);
			String balance=GetWalletBalanceInPolicySave.getBalance(introCode,newYear);
			
			
			String promBussPer=GetPromBuss.getPromBuss(newYear, planType, month);
			String promBuss=Integer.toString(Integer.parseInt(priceForMode)/100*Integer.parseInt(promBussPer));
			
			/*This add promotional bussiness to advisors  */
			int v=AddPromotionalBuss.addPromotionalBussiness(introCode, promBuss,newYear);
			
			
			String panCheck=GetPromBuss.CheckPanCard(introCode);
			float TDS=0,Admin=0,spotAmt=0;
			
			Admin=Float.parseFloat(request.getParameter("sAmount"))/100*5;
			if(panCheck.equals("null"))
			{
				TDS=Float.parseFloat(request.getParameter("sAmount"))/100*20;
			}
			else
			{
				TDS=Float.parseFloat(request.getParameter("sAmount"))/100*10;
			}
			spotAmt=Float.parseFloat(request.getParameter("sAmount"))-TDS-Admin;
			
			PreparedStatement pstmt1=cn.prepareStatement("update wallet set debit=?,credit=?,balance=? where pinNo=?");
			pstmt1.setString(1, Float.toString(spotAmt+Float.parseFloat(debit)));
			pstmt1.setString(2,credit);
			pstmt1.setString(3, balance);
			pstmt1.setString(4, introCode);
			pstmt1.executeUpdate();
			
			DateFormat dateFormat1 = new SimpleDateFormat("MM"); 
			/*dateFormat1.format(DOP),monthForPayId*/
			PreparedStatement p=cn.prepareStatement("insert into transaction(pinNo,tranType,debit,credit,balance,remark,date,bussiness,pbussiness,TDS,Admin,withdrawal,monthForPayId) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
			p.setString(1, introCode);
			p.setString(2, "Incentive");
			p.setString(3,Float.toString(spotAmt));
			p.setString(4, "0");
			p.setString(5, "0");
			p.setString(6, "Pay By Policy No"+formNo);
			p.setDate(7, ourdate);
			p.setString(8, planAmount);
			p.setString(9, promBuss);
			p.setString(10, Float.toString(TDS));
			p.setString(11, Float.toString(Admin));
			p.setString(12, "0");
			p.setString(13, dateFormat1.format(ourdate));
			p.executeUpdate();
	 
		}else
		{
			String credit=GetWalletBalanceInPolicySave.getCredit(introCode,newYear);
			String debit=GetWalletBalanceInPolicySave.getdebit(introCode,newYear);
			String balance=GetWalletBalanceInPolicySave.getBalance(introCode,newYear);
			
			String promBussPer=GetPromBuss.getPromBuss(newYear, planType, month);
			String promBuss=Integer.toString(Integer.parseInt(priceForMode)/100*Integer.parseInt(promBussPer));
			
			/*This add promotional bussiness to advisors  */
			int v=AddPromotionalBuss.addPromotionalBussiness(introCode, promBuss,newYear);
			
			String panCheck=GetPromBuss.CheckPanCard(introCode);
			float TDS=0,Admin=0,spotAmt=0;
			
			Admin=Float.parseFloat(request.getParameter("sAmount"))/100*5;
			if(panCheck.equals("null"))
			{
				TDS=Float.parseFloat(request.getParameter("sAmount"))/100*20;
			}
			else
			{
				TDS=Float.parseFloat(request.getParameter("sAmount"))/100*10;
			}
			spotAmt=Float.parseFloat(request.getParameter("sAmount"))-TDS-Admin;
			
			PreparedStatement pstmt1=cn.prepareStatement("update wallet set debit=?,credit=?,balance=? where pinNo=?");
			pstmt1.setString(1, debit);
			pstmt1.setString(2,Float.toString(spotAmt+Float.parseFloat(credit)));
			pstmt1.setString(3, Float.toString(spotAmt+Float.parseFloat(balance)));
			pstmt1.setString(4, introCode);
			pstmt1.executeUpdate();
			
			DateFormat dateFormat1 = new SimpleDateFormat("MM"); 
			/*dateFormat1.format(DOP),monthForPayId*/
			PreparedStatement p=cn.prepareStatement("insert into transaction(pinNo,tranType,debit,credit,balance,remark,date,bussiness,pbussiness,TDS,Admin,withdrawal,monthForPayId) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
			p.setString(1, introCode);
			p.setString(2, "Incentive");
			p.setString(3,Float.toString(Admin+TDS));
			p.setString(4, request.getParameter("sAmount"));
			p.setString(5, Float.toString(spotAmt));
			p.setString(6, "Pay By Policy No"+formNo);
			p.setDate(7, ourdate);
			p.setString(8, planAmount);
			p.setString(9, promBuss);
			p.setString(10, Float.toString(TDS));
			p.setString(11, Float.toString(Admin));
			p.setString(12, "0");
			p.setString(13, dateFormat1.format(ourdate));
			p.executeUpdate();
			
		
		}
		
		
		
		PreparedStatement pstmt2=cn.prepareStatement("insert into renewal_master(cust_name,cust_id,bond_id,Mat_price,Pay_price,Adv_name,plan_id,dom,year) values(?,?,?,?,?,?,?,?,?)");
		pstmt2.setString(1, name);
		pstmt2.setString(2, custId);
		pstmt2.setString(3, custId);
		pstmt2.setString(4, mAmount);
		pstmt2.setString(5, priceForMode);
		pstmt2.setString(6, introName);
		pstmt2.setString(7, planID);
		pstmt2.setString(8, mDate);
		pstmt2.setString(9, newYear);
		int res1=pstmt2.executeUpdate();
		
		List<String> list = new ArrayList<String>();
		if(payMode.equals("Y"))
		{
			Calendar now = Calendar.getInstance();
			int year1 = now.get(Calendar.YEAR);
			int year=Integer.parseInt(month)/12;
			int j=0;
			for (int i = 0; i < list.size(); i++) {
				list.remove(i);
			}
			for(int i=0;i<year;i++)
			{
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
			}
		}
		else if(payMode.equals("H"))
		{
			Calendar now = Calendar.getInstance();
			int year1 = now.get(Calendar.YEAR);
			int year=Integer.parseInt(month)/6;
			int j=0;
			for (int i = 0; i < list.size(); i++) {
				list.remove(i);
			}
			for(int i=0;i<year/2;i++)
			{
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
			}
		}
		else if(payMode.equals("Q"))
		{
			Calendar now = Calendar.getInstance();
			int year1 = now.get(Calendar.YEAR);
			int year=Integer.parseInt(month)/3;
			int j=0;
			for (int i = 0; i < list.size(); i++) {
				list.remove(i);
			}
			for(int i=0;i<year/4;i++)
			{
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
			}
		}else
		{
			
			Calendar now = Calendar.getInstance();
			int year1 = now.get(Calendar.YEAR);
			int year=Integer.parseInt(month)/1;
			int j=0;
			for (int i = 0; i < list.size(); i++) {
				list.remove(i);
			}
			for(int i=0;i<year/12;i++)
			{
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
			}
		}
		int result=AddRenewealMaster1.addRenewealMaster1(custId,payMode,month,list);
		
		
	%>
	<script type="text/javascript">
	alert("Policy Inserted Sucesssfully");
	var formNo = document.getElementById("formNo").value;
	window.location='Renewal.jsp?formNo='+formNo;
	</script>
	<%}
	else{%>
	<script type="text/javascript">
	alert("Policy not Inserted");
	window.location='errorpage.html';
	</script>
	<%}
}else if(request.getParameter("planType").equals("MIS"))
{
	
	String formNo=request.getParameter("formNo");
	String name=request.getParameter("name");
	String panCard=request.getParameter("panCard");
	String mobNo=request.getParameter("mobNo");
	String aadharNo=request.getParameter("aadharNo");
	String nearOPC=request.getParameter("near");
	String dob=request.getParameter("dob");
	String address=request.getParameter("address");
	String custId=request.getParameter("custId");
	String pinCode=request.getParameter("pinCode");
	String finYear=request.getParameter("finYear");
	String planType=request.getParameter("planType");
	String planID=request.getParameter("planID");
	System.out.println("Plan Id="+planID);
	String month=request.getParameter("month");
	String introCode=request.getParameter("introCode");
	String introName=request.getParameter("introName");
	String introLevel=request.getParameter("introLevel");
	String sIncentive=request.getParameter("sIncentive");
	String sAmount=request.getParameter("sAmount");
	String netPay=request.getParameter("netPay");
	String payMethod=request.getParameter("payMethod");
	String planAmount=request.getParameter("planAmount");
	String payMode=null;
	String priceForMode=null;
	if(request.getParameter("y") != null)
	{
		payMode="Y";
		String yearly=request.getParameter("yearly");
		priceForMode=yearly;
	}
	else if(request.getParameter("h") != null)
	{
		payMode="H";
		String halfly=request.getParameter("halfly");
		priceForMode=halfly;
	}
	else if(request.getParameter("q") != null)
	{
		payMode="Q";
		String quartly=request.getParameter("quartly");
		priceForMode=quartly;
	}
	else if(request.getParameter("m") != null)
	{
		payMode="M";
		String monthly=request.getParameter("monthly");
		priceForMode=monthly;
	}
	String mAmount=request.getParameter("mAmount");
	String mDate=request.getParameter("mDate");
	
	String promBussPer1=GetPromBuss.getPromBuss(newYear, planType, month);
	String promBuss1=Integer.toString(Integer.parseInt(priceForMode)/100*Integer.parseInt(promBussPer1));
	PreparedStatement pstt=cn.prepareStatement("insert into busssinessreport(opcName,type,paymode,month,price,year,date,pbuss) values(?,?,?,?,?,?,?,?)");
	pstt.setString(1,nearOPC);
	pstt.setString(2, planType);
	pstt.setString(3, payMode);
	pstt.setString(4,month );
	pstt.setString(5,priceForMode );
	pstt.setString(6, newYear);
	pstt.setDate(7, ourdate);
	pstt.setString(8, promBuss1);
	pstt.executeUpdate();
	
	String ddno=null;
	if(request.getParameter("ddNo")==null)
	
	{
		ddno="0";
	}
	else
	{
	ddno=request.getParameter("ddNo");
	}
	
	String banknm=null;
	if(request.getParameter("banknm")==null)
	
	{
		banknm="0";
	}
	else
	{
		banknm= request.getParameter("bankName");
	}
	
	String branchnm=null;
	if(request.getParameter("branchnm")==null)
	
	{
		branchnm="0";
	}
	else
	{
		branchnm=request.getParameter("bName");
	}





	
	PreparedStatement pstmt=cn.prepareStatement("insert into add_new_policy(Form_No,Name,Pan_Card,Mobile_No,Aadhar_No,Near_OPC,DOB,Address,Cust_Id,Pin_Code,finyear,planType,planId,month,introCode,intro_name,introLevel,Spot_Inc,Spot_Amt,Net_Pay,Payment_Mtd,planAmt,paymentMode,priceForMode,maturityAmount,mDate,date,pPayMtd,ddNo,bankName,branchName) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	pstmt.setString(1, formNo);
	pstmt.setString(2, name);
	pstmt.setString(3, panCard);
	pstmt.setString(4, mobNo);
	pstmt.setString(5, aadharNo);
	pstmt.setString(6, nearOPC);
	pstmt.setString(7, dob);
	pstmt.setString(8, address);
	pstmt.setString(9, custId);
	pstmt.setString(10, pinCode);
	pstmt.setString(11, newYear);
	pstmt.setString(12, planType);
	pstmt.setString(13,planID);
	pstmt.setString(14, month);
	pstmt.setString(15, introCode);
	pstmt.setString(16, introName);
	pstmt.setString(17, introLevel);
	pstmt.setString(18,sIncentive );
	pstmt.setString(19, sAmount);
	pstmt.setString(20, netPay);
	pstmt.setString(21, payMethod);
	pstmt.setString(22,planAmount );
	pstmt.setString(23,payMode );
	pstmt.setString(24,priceForMode );
	pstmt.setString(25, mAmount);
	pstmt.setString(26, mDate);
	pstmt.setDate(27, ourdate);
	pstmt.setString(28, request.getParameter("ppayMethod"));
	 pstmt.setString(29,ddno);
		pstmt.setString(30,banknm);
		pstmt.setString(31, branchnm);
	int res=pstmt.executeUpdate();
	if(res>0)
	{
		/* This code save Incentive for All The level */
		String policyNum=formNo;
		int val=SaveIncentiveFromLevel.saveIncentiveFromLevel(introLevel, month, newYear, planType, introCode, priceForMode,(dateFormat5.format(ourdate)),policyNum);
		if(request.getParameter("payMethod").equals("Cash"))
		{
			String credit=GetWalletBalanceInPolicySave.getCredit(introCode,newYear);
			String debit=GetWalletBalanceInPolicySave.getdebit(introCode,newYear);
			String balance=GetWalletBalanceInPolicySave.getBalance(introCode,newYear);
			
			
			String promBussPer=GetPromBuss.getPromBuss(newYear, planType, month);
			String promBuss=Integer.toString(Integer.parseInt(priceForMode)/100*Integer.parseInt(promBussPer));
			
			/*This add promotional bussiness to advisors  */
			int v=AddPromotionalBuss.addPromotionalBussiness(introCode, promBuss,newYear);
			
			
			String panCheck=GetPromBuss.CheckPanCard(introCode);
			float TDS=0,Admin=0,spotAmt=0;
			
			Admin=Float.parseFloat(request.getParameter("sAmount"))/100*5;
			if(panCheck.equals("null"))
			{
				TDS=Float.parseFloat(request.getParameter("sAmount"))/100*20;
			}
			else
			{
				TDS=Float.parseFloat(request.getParameter("sAmount"))/100*10;
			}
			spotAmt=Float.parseFloat(request.getParameter("sAmount"))-TDS-Admin;
			
			PreparedStatement pstmt1=cn.prepareStatement("update wallet set debit=?,credit=?,balance=? where pinNo=?");
			pstmt1.setString(1, Float.toString(spotAmt+Float.parseFloat(debit)));
			pstmt1.setString(2,credit);
			pstmt1.setString(3, balance);
			pstmt1.setString(4, introCode);
			pstmt1.executeUpdate();
			
			DateFormat dateFormat1 = new SimpleDateFormat("MM"); 
			/*dateFormat1.format(DOP),monthForPayId*/
			PreparedStatement p=cn.prepareStatement("insert into transaction(pinNo,tranType,debit,credit,balance,remark,date,bussiness,pbussiness,TDS,Admin,withdrawal,monthForPayId) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
			p.setString(1, introCode);
			p.setString(2, "Incentive");
			p.setString(3,Float.toString(spotAmt));
			p.setString(4, "0");
			p.setString(5, "0");
			p.setString(6, "Pay By Policy No"+formNo);
			p.setDate(7, ourdate);
			p.setString(8, planAmount);
			p.setString(9, promBuss);
			p.setString(10, Float.toString(TDS));
			p.setString(11, Float.toString(Admin));
			p.setString(12, "0");
			p.setString(13, dateFormat1.format(ourdate));
			p.executeUpdate();
	 
		}else
		{
			String credit=GetWalletBalanceInPolicySave.getCredit(introCode,newYear);
			String debit=GetWalletBalanceInPolicySave.getdebit(introCode,newYear);
			String balance=GetWalletBalanceInPolicySave.getBalance(introCode,newYear);
			
			String promBussPer=GetPromBuss.getPromBuss(newYear, planType, month);
			String promBuss=Integer.toString(Integer.parseInt(priceForMode)/100*Integer.parseInt(promBussPer));
			
			/*This add promotional bussiness to advisors  */
			int v=AddPromotionalBuss.addPromotionalBussiness(introCode, promBuss,newYear);
			
			String panCheck=GetPromBuss.CheckPanCard(introCode);
			float TDS=0,Admin=0,spotAmt=0;
			
			Admin=Float.parseFloat(request.getParameter("sAmount"))/100*5;
			if(panCheck.equals("null"))
			{
				TDS=Float.parseFloat(request.getParameter("sAmount"))/100*20;
			}
			else
			{
				TDS=Float.parseFloat(request.getParameter("sAmount"))/100*10;
			}
			spotAmt=Float.parseFloat(request.getParameter("sAmount"))-TDS-Admin;
			
			PreparedStatement pstmt1=cn.prepareStatement("update wallet set debit=?,credit=?,balance=? where pinNo=?");
			pstmt1.setString(1, debit);
			pstmt1.setString(2,Float.toString(spotAmt+Float.parseFloat(credit)));
			pstmt1.setString(3, Float.toString(spotAmt+Float.parseFloat(balance)));
			pstmt1.setString(4, introCode);
			pstmt1.executeUpdate();
			
			DateFormat dateFormat1 = new SimpleDateFormat("MM"); 
			/*dateFormat1.format(DOP),monthForPayId*/
			PreparedStatement p=cn.prepareStatement("insert into transaction(pinNo,tranType,debit,credit,balance,remark,date,bussiness,pbussiness,TDS,Admin,withdrawal,monthForPayId) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
			p.setString(1, introCode);
			p.setString(2, "Incentive");
			p.setString(3,Float.toString(Admin+TDS));
			p.setString(4, request.getParameter("sAmount"));
			p.setString(5, Float.toString(spotAmt));
			p.setString(6, "Pay By Policy No"+formNo);
			p.setDate(7, ourdate);
			p.setString(8, planAmount);
			p.setString(9, promBuss);
			p.setString(10, Float.toString(TDS));
			p.setString(11, Float.toString(Admin));
			p.setString(12, "0");
			p.setString(13, dateFormat1.format(ourdate));
			p.executeUpdate();
			
		
		}
		
		
		
		PreparedStatement pstmt2=cn.prepareStatement("insert into MIS_master(cust_name,cust_id,bond_id,Mat_price,Pay_price,Adv_name,plan_id,dom,planType) values(?,?,?,?,?,?,?,?,?)");
		pstmt2.setString(1, name);
		pstmt2.setString(2, custId);
		pstmt2.setString(3, custId);
		pstmt2.setString(4, mAmount);
		pstmt2.setString(5, priceForMode);
		pstmt2.setString(6, introName);
		pstmt2.setString(7, planID);
		pstmt2.setString(8, mDate);
		pstmt2.setString(9, "MIS");
		int res1=pstmt2.executeUpdate();
		
		List<String> list = new ArrayList<String>();
		if(payMode.equals("Y"))
		{
			Calendar now = Calendar.getInstance();
			int year1 = now.get(Calendar.YEAR);
			int year=Integer.parseInt(month)/12;
			int j=0;
			for (int i = 0; i < list.size(); i++) {
				list.remove(i);
			}
			for(int i=0;i<year;i++)
			{
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
			}
		}
		else if(payMode.equals("H"))
		{
			Calendar now = Calendar.getInstance();
			int year1 = now.get(Calendar.YEAR);
			int year=Integer.parseInt(month)/6;
			int j=0;
			for (int i = 0; i < list.size(); i++) {
				list.remove(i);
			}
			for(int i=0;i<year/2;i++)
			{
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
			}
		}
		else if(payMode.equals("Q"))
		{
			Calendar now = Calendar.getInstance();
			int year1 = now.get(Calendar.YEAR);
			int year=Integer.parseInt(month)/3;
			int j=0;
			for (int i = 0; i < list.size(); i++) {
				list.remove(i);
			}
			for(int i=0;i<year/4;i++)
			{
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
			}
		}else
		{
			
			Calendar now = Calendar.getInstance();
			int year1 = now.get(Calendar.YEAR);
			int year=Integer.parseInt(month)/1;
			int j=0;
			for (int i = 0; i < list.size(); i++) {
				list.remove(i);
			}
			for(int i=0;i<year/12;i++)
			{
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
				list.add(Integer.toString(year1+i)+"-"+Integer.toString(year1+i+1));
			}
		}
		int result=AddRenewealMaster1.addRenewealMasterMIS(custId,payMode,month,list,priceForMode);
		
		
	%>
	<script type="text/javascript">
	alert("Policy Inserted Sucesssfully");
	var formNo = document.getElementById("formNo").value;
	window.location='Renewal.jsp?formNo='+formNo;
	</script>
	<%}
	else{%>
	<script type="text/javascript">
	alert("Policy not Inserted");
	window.location='errorpage.html';
	</script>
	<%}
}
%>
</body>
</html>