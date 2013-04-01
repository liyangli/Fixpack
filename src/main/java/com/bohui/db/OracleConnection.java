package com.bohui.db;

import java.sql.Connection;
import java.sql.DriverManager;

import com.bohui.resource.PropertiesResource;

public class OracleConnection implements DBConnection {

	public Connection getConnection() throws Exception{
		PropertiesResource pr = PropertiesResource.newInstance();
		Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
		Connection conn = DriverManager.getConnection(pr.getProValue("jdbc.url"),
				pr.getProValue("jdbc.username"),pr.getProValue("jdbc.password"));
		return conn;
	}

}
