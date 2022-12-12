package org.nlt.listener;

import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;

public class TestListener3 implements ServletRequestListener 
{
	public void requestInitialized(ServletRequestEvent sre) {
		System.out.println("Request Created");
	}
	
	public void requestDestroyed(ServletRequestEvent sre) {
		System.out.println("Request Destroyed");
	}
}
