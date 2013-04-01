package com.bohui.db.exec;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import com.bohui.db.ConnectionFactory;
import com.bohui.db.DBConnection;

public  class DBExec {

	private DBConnection dbConn;
	public DBExec(){
		dbConn = ConnectionFactory.newInstance();
	}
	/**
	 * 执行具体sql语句
	 * @param sql
	 */
	public void execute(List<String> sqlList){
		Connection conn = null;
		Statement stat = null;
		try {
			conn = dbConn.getConnection();
			stat = conn.createStatement();
			for (String dllsql : sqlList) {
				stat.execute(dllsql);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				if(stat != null)
					stat.close();
				if(conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	
}
