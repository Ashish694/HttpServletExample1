package org.nlt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.nlt.include.DatabaseConnection;


public class AadharController extends HttpServlet
{
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		service(req, resp);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		service(req, resp);
	}
	
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		resp.setContentType("text/html");
		HttpSession ses = req.getSession();
		ses.setMaxInactiveInterval(60);//session will be active for 60 seconds
		PrintWriter out = resp.getWriter();
		
		String pageName = req.getParameter("page");
		if(pageName.equals("logoutpage"))
		{
			ses.invalidate();
			RequestDispatcher rd= req.getRequestDispatcher("login.jsp");
			rd.include(req, resp);
		}
		else if(pageName.equals("loginpage"))
		{
			String uname=req.getParameter("username");
			String pword=req.getParameter("password");
		
		try {
				Connection con = DatabaseConnection.getDatabaseConnection();
				Statement smt = con.createStatement();
				ResultSet rs = smt.executeQuery("select * from users where username='"+uname+"' and password='"+pword+"' and status=1");
				if(rs.next())
				{
					String name=rs.getString("name");
					ses.setAttribute("loginAttr", name);
					rs.close();
					smt.close();
					RequestDispatcher rd= req.getRequestDispatcher("index.jsp");
					rd.include(req, resp);
				}
				else//invalid username or password
				{
					rs.close();
					smt.close();
					RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
					out.println("<h2>Invalid Username or Password</h2>");
					rd.include(req, resp);
				}
			
			}
			catch (Exception e) 
			{
				RequestDispatcher rd= req.getRequestDispatcher("index.jsp");
				out.println("<h2>"+e+"</h2>");
				rd.include(req, resp);
			}
		}
			
		else if(pageName.equals("personaldetails"))
		{
			String n= req.getParameter("name");
			String a= req.getParameter("age");
			String g= req.getParameter("gender");
			
			if(n.isEmpty()||a.isEmpty())
			{
				RequestDispatcher rd= req.getRequestDispatcher("personaldetail.jsp");
				out.println("<h2>Invalid Entry</h2>");
				rd.include(req, resp);
			}
			else
			{
			ses.setAttribute("nameAttr", n);
			ses.setAttribute("ageAttr", a);
			ses.setAttribute("genderAttr", g);
			ses.setAttribute("page1", "Personal Details Ok");
			
			//System.out.println("You Are From PD");
			RequestDispatcher rd= req.getRequestDispatcher("contactdetail.jsp");
			rd.include(req, resp);
			}
		}
		else if(pageName.equals("contactdetails"))
		{
			//System.out.println("You Are From CD");
			String p= req.getParameter("phone");
			String e= req.getParameter("email");
			String ad= req.getParameter("address");
			
			ses.setAttribute("phoneAttr", p);
			ses.setAttribute("emailAttr", e);
			ses.setAttribute("addressAttr", ad);
			ses.setAttribute("page2", "Contact Details Ok");
			
			RequestDispatcher rd = req.getRequestDispatcher("educationdetail.jsp");
			rd.include(req, resp);
		}
		
		else if(pageName.equals("educationaldetails"))
		{
			String lang= req.getParameter("languages");
			String edu= req.getParameter("education");
			
			String name= ses.getAttribute("nameAttr").toString();
			String age= ses.getAttribute("ageAttr").toString();
			String gender= ses.getAttribute("genderAttr").toString();
			String phone= ses.getAttribute("phoneAttr").toString();
			String email= ses.getAttribute("emailAttr").toString();
			String address= ses.getAttribute("addressAttr").toString();
		
			try {
				Connection con = DatabaseConnection.getDatabaseConnection();
				Statement smt = con.createStatement();
				smt.execute("insert into aadhars(name,age,gender,phone,email,address,languages,education,status) values('"+name+"',"+age+",'"+gender+"','"+phone+"','"+email+"','"+address+"','"+lang+"','"+edu+"',1)");
				smt.close();
				
				RequestDispatcher rd= req.getRequestDispatcher("index.jsp");
				
				out.println("<h2>Aadhar Details Submitted Successfully</h2>");
				rd.include(req, resp);
				}
		catch (Exception ex) 
		{
			RequestDispatcher rd= req.getRequestDispatcher("index.jsp");
			
			out.println("<h2>"+ex+"</h2>");
			rd.include(req, resp);
		}
		
		}
		
		else if(pageName.equalsIgnoreCase("editaadhar"))
		{			
				String pid= req.getParameter("pid");
				String n= req.getParameter("name");
				String a= req.getParameter("age");
				String g= req.getParameter("gender");
				String p= req.getParameter("phone");
				String e= req.getParameter("email");
				String ad= req.getParameter("address");
				String lang= req.getParameter("languages");
				String edu= req.getParameter("education");
				
		try {
				Connection con = DatabaseConnection.getDatabaseConnection();
				Statement smt = con.createStatement();
				smt.execute("update aadhars set name='"+n+"',age="+a+",gender='"+g+"',phone='"+p+"',email='"+e+"',address='"+ad+"',languages='"+lang+"',education='"+edu+"' where id=" +pid);
				smt.close();
				
				RequestDispatcher rd= req.getRequestDispatcher("index.jsp");
				
				out.println("<h2>Aadhar Updated Successfully</h2>");
				rd.include(req, resp);
			}
		catch (Exception ex) 
		{ 
			RequestDispatcher rd= req.getRequestDispatcher("index.jsp");
			
			out.println("<h2>"+ex+"</h2>");
			rd.include(req, resp);
		}
		
		}
		
		else if(pageName.equalsIgnoreCase("deleteaadhar"))
		{		
			String pid= req.getParameter("pid");
		
			try {
				Connection con = DatabaseConnection.getDatabaseConnection();
				Statement smt = con.createStatement();
				smt.execute("update aadhars set status=0 where id=" + pid);
				smt.close();
				
				RequestDispatcher rd= req.getRequestDispatcher("index.jsp");
				
				out.println("<h2>Aadhar Deleted Successfully</h2>");
				rd.include(req, resp);
				}
		catch (Exception ex) 
		{ 
			RequestDispatcher rd= req.getRequestDispatcher("index.jsp");
			
			out.println("<h2>"+ex+"</h2>");
			rd.include(req, resp);
		}
		
		}//else if
	}
}
