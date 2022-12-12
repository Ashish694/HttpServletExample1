package org.nlt.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PersonController extends HttpServlet 
{
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		service(req, resp);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		service(req, resp);
	}
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name= req.getParameter("name");
		String age= req.getParameter("age");
		String phone= req.getParameter("phone");
		
		PrintWriter out = resp.getWriter();
		
		out.println("Name:"+name);
		out.println("Age:"+age);
		out.println("Phone:"+phone);
		
	}
}
