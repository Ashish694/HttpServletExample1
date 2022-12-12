package org.nlt.include;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;

public class DatabaseConnection 
{
	private static Connection con=null;
	private DatabaseConnection()
	{

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/genericservlet","root","");
			Statement smt = con.createStatement();
			System.out.println("Ctor Executed & connection ready");
		}
	catch (Exception ex) 
	{
		System.out.println(ex);
	}
	
	}
	
	public static Connection getDatabaseConnection()
	{
		if(con==null)
		{
			new DatabaseConnection();
		}
		return con;
	}
	
	public static void closeDatabaseConnection() 
	{
		try
		{
			if(con!=null)
			{
				con.close();
			}
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
	}
}
