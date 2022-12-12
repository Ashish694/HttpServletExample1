package org.nlt.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DemoController extends HttpServlet{
	private ServletConfig config;
	
	public void init(ServletConfig config) throws ServletException {
		this.config=config;
		String fname= config.getInitParameter("fname");
		System.out.println(fname);
		String lname= config.getInitParameter("lname");
		System.out.println(lname);
	}
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out= resp.getWriter();
		out.println(config.getInitParameter("fname"));
		out.println(config.getInitParameter("lname"));
		
		ServletContext context= req.getServletContext();
		out.println(context.getInitParameter("company"));
	}
}
