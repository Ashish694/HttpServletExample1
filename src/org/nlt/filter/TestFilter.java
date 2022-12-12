package org.nlt.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class TestFilter implements Filter {
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException 
	{
		String name= req.getParameter("name");
		String age= req.getParameter("age");
		String phone= req.getParameter("phone");
		if(name.isEmpty()||age.isEmpty()||phone.isEmpty())
		{
			res.getWriter().println("<h1>Invalid Entry</h1>");
		}
		else
		{
			System.out.println("Before Filter");
			chain.doFilter(req, res);
			System.out.println("After Filter");
		}
	}
	
}
