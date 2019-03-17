<%@page import="com.pit.policy.database.DBConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String appNo,custId,dop,mdate,introcode,introname,cname,mob_no,pan_card,aadhar_no,near_opc,dtob,Address,pin_code,plan_id,months,plan_type,payment_mode,iamount,noofins,pend_ins,paid_ins,paid_amt,m_amt,pay_amt,sec_amt,payMethod = null;

try
	{
		//paymode,instamt,noofinst,paidins,pendins,paidamt,matamount,payamt,secamt,payMethod
		
		System.out.println("check boxes on or off");
		System.out.println(request.getParameter("appNo"));
		System.out.println(request.getParameter("dom"));
		System.out.println(request.getParameter("incode"));
		System.out.println(request.getParameter("inname"));
		System.out.println(request.getParameter("name"));
		System.out.println(request.getParameter("mobno"));
		System.out.println(request.getParameter("pancard"));
		System.out.println(request.getParameter("aadharno"));
		System.out.println(request.getParameter("nearopc"));
		System.out.println(request.getParameter("dob"));
		System.out.println(request.getParameter("address"));
		System.out.println(request.getParameter("pincode"));
		System.out.println(request.getParameter("planid"));
		System.out.println(request.getParameter("month"));
		System.out.println(request.getParameter("plantype"));
		System.out.println(request.getParameter("paymode"));
		System.out.println(request.getParameter("instamt"));
		System.out.println(request.getParameter("noofinst"));
		System.out.println(request.getParameter("paidins"));
		System.out.println(request.getParameter("pendins"));
		System.out.println(request.getParameter("paidamt"));
		System.out.println(request.getParameter("matamount"));
		System.out.println(request.getParameter("payamt"));
		
		System.out.println("text boxes print");
		System.out.println(request.getParameter("appNo"));
		System.out.println(request.getParameter("custId"));
		System.out.println(request.getParameter("dop"));
		System.out.println(request.getParameter("mdate"));
		System.out.println(request.getParameter("introcode"));
		System.out.println(request.getParameter("introname"));
		System.out.println(request.getParameter("cname"));
		System.out.println(request.getParameter("mob_no"));
		System.out.println(request.getParameter("pan_card"));
		System.out.println(request.getParameter("aadhar_no"));
		System.out.println(request.getParameter("near_opc"));
		System.out.println(request.getParameter("dtob"));
		System.out.println(request.getParameter("Address"));
		System.out.println(request.getParameter("pin_code"));
		System.out.println(request.getParameter("plan_id"));
		System.out.println(request.getParameter("months"));
		System.out.println(request.getParameter("plan_type"));
		System.out.println(request.getParameter("payment_mode"));
		System.out.println(request.getParameter("iamount"));
		System.out.println(request.getParameter("noofins"));
		System.out.println(request.getParameter("pend_ins"));
		//System.out.println(request.getParameter("paid_ins"));
		//System.out.println(request.getParameter("paid_amt"));
		//System.out.println(request.getParameter("m_amt"));
		//System.out.println(request.getParameter("pay_amt"));
		System.out.println(request.getParameter("sec_amt"));
		System.out.println(request.getParameter("payMethod"));


		sec_amt = request.getParameter("sec_amt");
		payMethod = request.getParameter("payMethod");
		
		if(request.getParameter("appNo") != null)
		{
			
			appNo = request.getParameter("appNo");
			custId = request.getParameter("custId");

			if(request.getParameter("dtop") != null) // get check box value
			{
				dop = request.getParameter("dop");	// get text box value for stored on db
			}
			else
			{
				dop = "0";	
			}
			if(request.getParameter("dom") != null)
			{
				mdate = request.getParameter("mdate");
			}
			else
			{
				mdate = "0";	
			}
			if(request.getParameter("incode") != null)
			{
				introcode = request.getParameter("introcode");
			}
			else
			{
				introcode = "0";
			}
			if(request.getParameter("inname") != null)
			{
				introname = request.getParameter("introname");
			}
			else
			{
				introname = "0";
			}
			if(request.getParameter("name") != null)
			{
				cname = request.getParameter("cname");
			}
			else
			{
				cname = "0";
			}
			if(request.getParameter("mobno") != null)
			{
				mob_no = request.getParameter("mob_no");
			}
			else
			{
				mob_no = "0";
			}
			if(request.getParameter("pancard") != null)
			{
				pan_card = request.getParameter("pan_card");
			}
			else
			{
				pan_card = "0";
			}
			if(request.getParameter("aadharno") != null)
			{
				aadhar_no = request.getParameter("aadhar_no");
			}
			else
			{
				aadhar_no = "0";
			}
			if(request.getParameter("nearopc") != null)
			{
				near_opc = request.getParameter("near_opc");
			}
			else
			{
				near_opc = "0";
			}
			if(request.getParameter("dob") != null)
			{
				dtob = request.getParameter("dtob");
			}
			else
			{
				dtob = "0";
			}
			if(request.getParameter("address") != null)
			{
				Address = request.getParameter("Address");
			}
			else
			{
				Address = "0";
			}
			if(request.getParameter("pincode") != null)
			{
				pin_code = request.getParameter("pin_code");
			}
			else
			{
				pin_code = "0";
			}
			if(request.getParameter("planid") != null)
			{
				plan_id = request.getParameter("plan_id");
			}
			else
			{
				plan_id = "0";
			}
			if(request.getParameter("month") != null)
			{
				months = request.getParameter("months");
			}
			else
			{
				months = "0";
			}
			if(request.getParameter("plantype") != null)
			{
				plan_type = request.getParameter("plan_type");
			}
			else
			{
				plan_type = "0";
			}
			if(request.getParameter("paymode") != null)
			{
				payment_mode = request.getParameter("payment_mode");
			}
			else
			{
				payment_mode = "0";
			}
			if(request.getParameter("instamt") != null)
			{
				iamount = request.getParameter("iamount");
			}
			else
			{
				iamount = "0";
			}
			if(request.getParameter("noofinst") != null)
			{
				noofins = request.getParameter("noofins");
			}
			else
			{
				noofins = "0";
			}
			if(request.getParameter("paidins") != null)
			{
				paid_ins = request.getParameter("paid_ins");
			}
			else
			{
				paid_ins = "0";
			}
			if(request.getParameter("pendins") != null)
			{
				pend_ins = request.getParameter("pend_ins");
			}
			else
			{
				pend_ins = "0";
			}
			if(request.getParameter("paidamt") != null)
			{
				paid_amt = request.getParameter("paid_amt");
			}
			else
			{
				paid_amt = "0";
			}
			if(request.getParameter("matamount") != null)
			{
				m_amt = request.getParameter("m_amt");
			}
			else
			{
				m_amt = "0";
			}
			if(request.getParameter("payamt") != null)
			{
				pay_amt = request.getParameter("pay_amt");
			}
			else
			{
				pay_amt = "0";
			}
			
			// appNo,custId,dop,mdate,introcode,introname,cname,mob_no,pan_card,aadhar_no,near_opc,dtob,Address,pin_code,plan_id,months,plan_type,payment_mode,iamount,noofins,pend_ins,paid_ins,paid_amt,m_amt,pay_amt,sec_amt,payMethod
			System.out.println("Save used Data for db");
			System.out.println(appNo);
			System.out.println(custId);
			System.out.println(dop);
			System.out.println(mdate);
			System.out.println(introcode);
			System.out.println(introname);
			System.out.println(cname);
			System.out.println(mob_no);
			System.out.println(pan_card);
			System.out.println(aadhar_no);
			System.out.println(near_opc);
			System.out.println(dtob);
			System.out.println(Address);
			System.out.println(pin_code);
			System.out.println(plan_id);
			System.out.println(months);
			System.out.println(plan_type);
			System.out.println(payment_mode);
			System.out.println(iamount);
			System.out.println(noofins);
			System.out.println(pend_ins);
			System.out.println(paid_ins);
			System.out.println(paid_amt);
			System.out.println(m_amt);
			System.out.println(pay_amt);
			System.out.println(sec_amt);
			System.out.println(payMethod);


			Connection cn=DBConnection.getConnection();
			//PreparedStatement ptmt=cn.prepareStatement("set global max_connections=100000000");
			//ptmt.executeQuery();
		 	PreparedStatement pstmt = cn.prepareStatement("insert into policy_renewal(Form_no,custId,dop,mdate,introcode,introname,cname,mob_no,pan_card,aadhar_no,near_opc,dtob,Address,pin_code,plan_id,months,plan_type,payment_mode,iamount,noofins,pendins,paid_ins,paid_amt,m_amt,pay_amt,sec_amt,payMethod) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
														 //insert into policy_renewal(Form_no,custId,dop,mdate,introcode,introname,cname,mob_no,pan_card,aadhar_no,near_opc,dtob,Address,pin_code,plan_id,months,plan_type,payment_mode,iamount,noofins,pendins,paid_ins,paid_amt,m_amt,pay_amt,sec_amt,payMethod) values('Form_no','custId','dop','mdate','introcode','introname','cname','mob_no','pan_card','aadhar_no','near_opc','dtob','Address','pin_code','plan_id','months','plan_type','payment_mode','iamount','noofins','pendins','paid_ins','paid_amt','m_amt','pay_amt','sec_amt','paymethod');

												 
			pstmt.setString(1,appNo);
			pstmt.setString(2,custId);
			pstmt.setString(3,dop);
			pstmt.setString(4,mdate);
			pstmt.setString(5,introcode);
			pstmt.setString(6,introname);
			pstmt.setString(7,cname);
			pstmt.setString(8,mob_no);
			pstmt.setString(9,pan_card);
			pstmt.setString(10,aadhar_no);
			pstmt.setString(11,near_opc);
			pstmt.setString(12,dtob);
			pstmt.setString(13,Address);
			pstmt.setString(14,pin_code);
			pstmt.setString(15,plan_id);
			pstmt.setString(16,months);
			pstmt.setString(17,plan_type);
			pstmt.setString(18,payment_mode);
			pstmt.setString(19,iamount);
			pstmt.setString(20,noofins);
			pstmt.setString(21,pend_ins);
			pstmt.setString(22,paid_ins);
			pstmt.setString(23,paid_amt);
			pstmt.setString(24,m_amt);
			pstmt.setString(25,pay_amt);
			pstmt.setString(26,sec_amt);
			pstmt.setString(27,payMethod);
			
/*			it get parameter of checkboxes name 
			===================================================
			pstmt.setString(1,request.getParameter("appNo"));
			pstmt.setString(2,request.getParameter("dom"));
			pstmt.setString(3,request.getParameter("incode"));
			pstmt.setString(4,request.getParameter("inname"));
			pstmt.setString(5,request.getParameter("name"));
			pstmt.setString(6,request.getParameter("mobno"));
			pstmt.setString(7,request.getParameter("pancard"));
			pstmt.setString(8,request.getParameter("aadharno"));
			pstmt.setString(9,request.getParameter("nearopc"));
			pstmt.setString(10,request.getParameter("dob"));
			pstmt.setString(11,request.getParameter("address"));
			pstmt.setString(12,request.getParameter("pincode"));
			pstmt.setString(13,request.getParameter("planid"));
			pstmt.setString(14,request.getParameter("month"));
			pstmt.setString(15,request.getParameter("plantype"));
			pstmt.setString(16,request.getParameter("paymode"));
			pstmt.setString(17,request.getParameter("instamt"));
			pstmt.setString(18,request.getParameter("noofinst"));
			pstmt.setString(19,request.getParameter("paidins"));
			pstmt.setString(20,request.getParameter("pendins"));
			pstmt.setString(21,request.getParameter("paidamt"));
			pstmt.setString(22,request.getParameter("matamount"));
			pstmt.setString(23,request.getParameter("payamt"));
*/			
			int res = pstmt.executeUpdate();
			if(res>0)
			{
				%>
				<script type="text/javascript">
				alert("Inserted Sucesssfully");
				window.location='addPolicyMaturity.jsp';
				</script>
				<%
			}
			else
			{
				%>
				<script type="text/javascript">
				alert("Data is not Inserted");
				window.location='errorpage.html';
				</script>
				<%
			}      
			

		}
		else
		{
			%>
			<script>
				Window.location("errorpage.html");
			</script>
			<%
		}
		

	}
	catch(Exception ex)
	{
		
		
	}
%>

</body>
</html>