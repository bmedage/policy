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
<style>
input[type=text]:disabled {
    background: #dddddd;
}
</style>
<body>
<%
	String inst_amt= null;
	String noofins = null;
	String paid = null;
	double mAmount = 0.0;
	int result = 0;
	/* String appNo = request.getParameter("appNo"); */
%>
<%
		try
			{
			Connection cn=DBConnection.getConnection();
			PreparedStatement ptmt=cn.prepareStatement("set global max_connections=100000000");
			ptmt.executeQuery();
		 	Statement st = cn.createStatement();
		 	
		 	String custId = request.getParameter("custId");
		 	System.out.println("custId :: "+request.getParameter("custId"));
		/*  	System.out.println("appNo :: "+request.getParameter("appNo")); */
		 	System.out.println("select * from add_new_policy where Cust_Id="+custId);
			
		 	//ResultSet rs = st.executeQuery("select * from add_new_policy where Form_no="+appNo);
			ResultSet rs = st.executeQuery("select * from add_new_policy where Cust_Id="+custId);
			//								select * from add_new_policy where Form_no= '0021' And Cust_Id = '72468';
			while(rs.next())
			{
				System.out.println(rs.getString(1));
				inst_amt = rs.getString("priceForMode");
%>
								<div class="form-group">
									<div class="col-md-6">
									<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Date Of Policy</label>
										<div class="col-sm-6">
											<input type="text" class="form-control1" value = "<%= rs.getString("date") %>" name="dop" id="dop" placeholder="Application No"  disabled="disabled">
										</div>
										<div class="col-sm-2">
											<input type = "checkbox" name = "dtop" style = "height:30px;width:30px;"> 
										</div>
										
									</div>
										
									<div class="col-md-6">
									<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Date Of Maturity</label>
										<div class="col-sm-6">
											<input type="text" class="form-control1" value = "<%= rs.getString("mDate") %>" id="custId" placeholder="Card No" name="mdate" disabled="disabled">
										</div>
										<div class="col-sm-2" style = "float:left;">
											<input type = "checkbox" name = "dom" style = "height:30px;width:30px;">
										</div>
									</div>
								</div>
								
								<div class="form-group">
									<div class="col-md-6">
									<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Introducer Code</label>
										<div class="col-sm-6">
											<input type="text" class="form-control1" value = "<%= rs.getString("introcode") %>" id="applicationNo" placeholder="Application No" name="introcode" disabled="disabled">
										</div>
										<div class="col-sm-2">
											<input type = "checkbox" name = "incode" style = "height:30px;width:30px;">
										</div>
										
									</div>
										
									<div class="col-md-6">
									<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Intro Name</label>
										<div class="col-sm-6">
											<input type="text" class="form-control1" value = "<%= rs.getString("intro_name") %>" id="custId" placeholder="Card No" name="introname" disabled="disabled">
										</div>
										<div class="col-sm-2">
											<input type = "checkbox" name = "inname" style = "height:30px;width:30px;">
										</div>
									</div>
								</div>
								
								<div class="form-group">
									<div class="col-md-6">
									<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Name</label>
										<div class="col-sm-6">
											<input type="text" class="form-control1" id="applicationNo" value = "<%= rs.getString("Name") %>" placeholder="Application No" name="cname" disabled="disabled">
										</div>
										<div class="col-sm-2">
											<input type = "checkbox" name = "name" style = "height:30px;width:30px;">
										</div>
										
									</div>
										
									<div class="col-md-6">
									<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Mobile No</label>
										<div class="col-sm-6">
											<input type="text" class="form-control1" value = "<%= rs.getString("Mobile_No") %>" id="custId" placeholder="Card No" name="mob_no" disabled="disabled">
										</div>
										<div class="col-sm-2">
											<input type = "checkbox" name = "mobno" style = "height:30px;width:30px;">
										</div>
									</div>
								</div>
								
								<div class="form-group">
									<div class="col-md-6">
									<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">PAN Card</label>
										<div class="col-sm-6">
											<input type="text" class="form-control1" id="applicationNo" value = "<%= rs.getString("Pan_Card") %>" placeholder="" name="pan_card" disabled="disabled">
										</div>
										<div class="col-sm-2">
											<input type = "checkbox" name = "pancard" style = "height:30px;width:30px;">
										</div>
										
									</div>
										
									<div class="col-md-6">
									<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Aadhar No</label>
										<div class="col-sm-6">
											<input type="text" class="form-control1" id="custId" value = "<%= rs.getString("Aadhar_No") %>" placeholder="" name="aadhar_no" disabled="disabled">
										</div>
										<div class="col-sm-2">
											<input type = "checkbox" name = "aadharno" style = "height:30px;width:30px;">
										</div>
									</div>
								</div>
								
								<div class="form-group">
									<div class="col-md-6">
									<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Near OPC</label>
										<div class="col-sm-6">
											<input type="text" class="form-control1" id="applicationNo" value = "<%= rs.getString("Near_OPC") %>" placeholder="Application No" name="near_opc" disabled="disabled">
										</div>
										<div class="col-sm-2">
											<input type = "checkbox" name = "nearopc" style = "height:30px;width:30px;">
										</div>
										
									</div>
										
									<div class="col-md-6">
									<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Date of Birth</label>
										<div class="col-sm-6">
											<input type="text" class="form-control1" id="custId" value = "<%= rs.getString("DOB") %>" placeholder="Card No" name="dtob" disabled="disabled">
										</div>
										<div class="col-sm-2">
											<input type = "checkbox" name = "dob" style = "height:30px;width:30px;">
										</div>
									</div>
								</div>
								
								<div class="form-group">
									<div class="col-md-6">
									<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Address</label>
										<div class="col-sm-6">
											<input type="text" class="form-control1" id="applicationNo" value = "<%= rs.getString("Address") %>" placeholder="Application No" name="Address" disabled="disabled">
										</div>
										<div class="col-sm-2">
											<input type = "checkbox" name = "address" style = "height:30px;width:30px;">
										</div>
										
									</div>
										
									<div class="col-md-6">
									<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Pin Code</label>
										<div class="col-sm-6">
											<input type="text" class="form-control1" id="custId" value = "<%= rs.getString("Pin_Code") %>" placeholder="Card No" name="pin_code" disabled="disabled">
										</div>
										<div class="col-sm-2">
											<input type = "checkbox" name = "pincode" style = "height:30px;width:30px;">
										</div>
									</div>
								</div>
								
								<div class="form-group">
									<div class="col-md-6">
									<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Plan Id</label>
										<div class="col-sm-6">
											<input type="text" class="form-control1" id="applicationNo" value = "<%= rs.getString("planId") %>" placeholder="Application No" name="plan_id" disabled="disabled">
										</div>
										<div class="col-sm-2">
											<input type = "checkbox" name = "planid" style = "height:30px;width:30px;">
										</div>
										
									</div>
										
									<div class="col-md-6">
									<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Month</label>
										<div class="col-sm-6">
											<input type="text" class="form-control1" id="custId" value = "<%= rs.getString("month") %>"placeholder="Card No" name="months" disabled="disabled">
										</div>
										<div class="col-sm-2">
											<input type = "checkbox" name = "month" style = "height:30px;width:30px;">
										</div>
										</div>
								</div>
								
								<div class="form-group">
									<div class="col-md-6">
									<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Plan Type</label>
										<div class="col-sm-6">
											<input type="text" class="form-control1" id="applicationNo" value = "<%= rs.getString("planType") %>" placeholder="Application No" name="plan_type" disabled="disabled">
										</div>
										<div class="col-sm-2">
											<input type = "checkbox" name = "plantype" style = "height:30px;width:30px;">
										</div>
										
									</div>
										
									<div class="col-md-6">
									<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Payment Mode</label>
										<div class="col-sm-6">
											<input type="text" class="form-control1" id="custId" value = "<%= rs.getString("paymentMode") %>" placeholder="Card No" name="payment_mode" disabled="disabled">
										</div>
										<div class="col-sm-2">
											<input type = "checkbox" name = "paymode" style = "height:30px;width:30px;">
										</div>
									</div>
								</div>
							
																		
								<div class="form-group">
									<div class="col-md-6">
									<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Install Amount</label>
										<div class="col-sm-6">
											<input type="text" class="form-control1" id="applicationNo" value = "<%= rs.getString("priceForMode") %>" placeholder="Application No" name="iamount" disabled="disabled">
										</div>
										<div class="col-sm-2">
											<input type = "checkbox" name = "instamt" style = "height:30px;width:30px;">
										</div>
										
									</div>
							<%} %>
							<%
							ResultSet rs2 = st.executeQuery("select COUNT('cust_id') from renewal_master1 where cust_id="+custId);
							//								 select * from renewal_master1 where cust_id="+custId;
							while(rs2.next())
							{
								System.out.println(rs2.getString(1));
								noofins = rs2.getString(1);
							%>
									<div class="col-md-6">
									<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">No of Instalment</label>
										<div class="col-sm-6">
											<input type="text" class="form-control1" id="custId" placeholder="Card No" value = "<%= rs2.getString(1) %>" name="noofins" disabled="disabled">
										</div>
										<div class="col-sm-2">
											<input type = "checkbox" name = "noofinst" style = "height:30px;width:30px;">
										</div>
									</div>
								</div>
							<%} %>
							
							<%
							int cnt = 0;
							ResultSet rs3 = st.executeQuery("select Reciept_no from renewal_master1 where cust_id="+custId);
							//								 select * from renewal_master1 where cust_id="+custId;
							while(rs3.next())
							{
								
								System.out.println(rs3.getString(1));
								if(rs3.getString(1).equals("payable"))
								{
									cnt++;
								}
								System.out.println("cnt :: "+cnt);
							}
							%>
								<div class="form-group">
									<div class="col-md-6">
									<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Pending Install</label>
										<div class="col-sm-6">
											<input type="text" class="form-control1" id="custId" value = "<%= cnt %>" placeholder="Card No" name="pend_ins" disabled="disabled">
										</div>
										<div class="col-sm-2">
											<input type = "checkbox" name = "pendins" style = "height:30px;width:30px;">
										</div>
									</div>
							<% 
								
							    System.out.println("instalment amount :: "+inst_amt);
							    System.out.println("instalment count :: "+cnt);
							    
								
								//paid instalment = no of instalment - pending instalment
								result = Integer.parseInt(noofins) - cnt;
								
								
								//paid amount = paid installment * installment amt
								int paid_amt = Integer.parseInt(inst_amt) * result;
								
								
								%>
									<div class="col-md-6">
									<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Paid Instalment</label>
										<div class="col-sm-6">
											<input type="text" class="form-control1" value = "<%= result %>" id="applicationNo" placeholder="Application No" name="paid_ins" disabled="disabled">
										</div>
										<div class="col-sm-2">
											<input type = "checkbox" name = "paidins" style = "height:30px;width:30px;">
										</div>
										
									</div>
										
									
								</div>
								
								<div class="form-group">
									<div class="col-md-6">
									<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Paid Amount</label>
										<div class="col-sm-6">
											<input type="text" value = "<%= paid_amt %>" class="form-control1" id="applicationNo" placeholder="Application No" name="paid_amt" disabled="disabled">
										</div>
										<div class="col-sm-2">
											<input type = "checkbox" name = "paidamt" style = "height:30px;width:30px;">
										</div>
										
									</div>
								<%
									//maturity amount = no_of_instalment / 2
									double res = 0.0;
									Statement st2 = cn.createStatement();
									ResultSet rs4 = st2.executeQuery("select * from add_new_policy where Form_no="+custId);
									
									while(rs4.next())
									{
										System.out.println("month :: "+rs4.getString("month"));
										System.out.println("plan type :: "+rs4.getString("planType"));
										System.out.println("paymentMode :: "+rs4.getString("paymentMode"));
										
										if(rs4.getString("planType").equals("RD"))
										{
											System.out.println("Insite If");
											if(rs4.getString("paymentMode").equals('Y'))
											{
												System.out.println("Insite If");
												res = 12 * 0.3;
												
											}
											else if(rs4.getString("paymentMode").equals("H"))
											{
												// month = 36
														System.out.println("Insite else");
												res = 6 * 0.3;
													
												System.out.println("res "+res);
												
											}
											else if(rs4.getString("paymentMode").equals('Q'))
											{
												 res = 3 * 0.3;
															
											}
											else if(rs4.getString("paymentMode").equals('M'))
											{
												 res = 1 * 0.3;
															
											}
										}
										System.out.println("res :: "+ res );			
									
									double interest = res * Integer.parseInt(inst_amt);
								%>
								<div class="col-md-6">
									<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Maturity Amount</label>
										<div class="col-sm-6">
											<input type="text" class="form-control1" id="custId" value = "<%= interest %>" placeholder="Card No" name="m_amt" disabled="disabled">
										</div>
										<div class="col-sm-2">
											<input type = "checkbox" name = "matamount" style = "height:30px;width:30px;">
										</div>
									</div>
								</div>
								
								<div class="form-group">
									<div class="col-md-6">
									<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Payable Amount</label>
										<div class="col-sm-6">
											<input type="text" class="form-control1" id="applicationNo" value = "<%= cnt * Integer.parseInt(inst_amt) %>" placeholder="Application No" name="pay_amt" disabled="disabled">
										</div>
										<div class="col-sm-2">
											<input type = "checkbox" name = "payamt" style = "height:30px;width:30px;">
										</div>
										
									</div>
									<%} %>	
								<%	
				  
			  
			    }
				catch(Exception ex)
				{
		
				}
			%>
									<div class="col-md-6">
									<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Section Amount</label>
										<div class="col-sm-6">
											<input type="text" class="form-control1" id="samt" placeholder="Section Amount" name="sec_amt" >
										</div>
									</div>
								</div>
								
								<div class="form-group">
									<div class="col-md-6">
									<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Payable Method</label>
										<div class="col-sm-6">
											<select name = "payMethod">
												<option value = "Cash" selected>Cash</option>
												<option value = "Cheque">Cheque</option>
												<option value = "Credit">Credit</option>
											</select>
										</div>
										
									</div>
									<div class="col-md-6">
									<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;"></label>
										<div class="col-sm-8">
											<button style="float:right" class="btn-primary btn">Confirm & Print</button>
										</div>
									</div>
																		
								</div>
								
</body>
</html>