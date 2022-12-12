package org.nlt.listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class TestListener2 implements HttpSessionListener 
{
	public void sessionCreated(HttpSessionEvent se) {
		System.out.println("Session Created");
	}
	
	public void sessionDestroyed(HttpSessionEvent se) {
		System.out.println("Session Destroyed");
	}
}
