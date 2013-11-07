package com.bohui.db;

import java.sql.Connection;
import java.sql.DriverManager;

import com.bohui.resource.PropertiesResource;

public class OracleConnection implements DBConnection {

	public Connection getConnection() throws Exception{
//        jdbc.driverClassName=oracle.jdbc.driver.OracleDriver
//        jdbc.url=jdbc:oracle:thin:@127.0.0.1:1521:xe
//        jdbc.username=duty
//        jdbc.password=duty
		PropertiesResource pr = PropertiesResource.newInstance("config.properties");
		Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
        String url = "jdbc:oracle:thin:@"+pr.getProValue("dbIp")+":"+pr.getProValue("dbPort")+":"+pr.getProValue("dbName");
		Connection conn = DriverManager.getConnection(url,
				pr.getProValue("dbUser"),pr.getProValue("dbPassword"));
		return conn;
	}

    @Override
    public Connection getConnection(String ip, String port, String dbName, String userName, String password) throws Exception{
        String url = "jdbc:oracle:thin:@"+ip+":"+port+":"+dbName;
        Connection conn = DriverManager.getConnection(url,
                userName,password);
        return conn;
    }
}
