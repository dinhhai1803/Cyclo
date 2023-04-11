/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author win
 */
public class DBContext {
    	private final String serverName = "LAPTOP-6S3OMCAI\\SQLEXPRESS";
	private final String dbName = "CYKLO";
	private final String portNumber = "1433";
	private final String user = "sa";
	private final String password = "dinhhai";
	private final String instance = "";
	
	public Connection getConnection() throws Exception{
	      String url = "jdbc:sqlserver://"+serverName+":"+portNumber + "\\" + instance +";databaseName="+dbName;
	      if(instance == null || instance.trim().isEmpty())
	      url = "jdbc:sqlserver://"+serverName+":"+portNumber +";databaseName="+dbName;
	      Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	      return DriverManager.getConnection(url, user, password);
	}
	
	public static void main(String[] args) throws Exception {
		DBContext dbContext = new DBContext();
		System.out.println(dbContext.getConnection());
	}
}

