package org.nlt.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class TestListener1 implements ServletContextListener 
{
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("Context Initialized");
	}
	
	public void contextDestroyed(ServletContextEvent sce) {
		System.out.println("Context Destroyed");
	}
}
