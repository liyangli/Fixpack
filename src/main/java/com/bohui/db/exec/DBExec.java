package com.bohui.db.exec;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bohui.db.ConnectionFactory;
import com.bohui.db.DBConnection;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;

public  class DBExec {

    private Connection conn;
	public DBExec(){
        DBConnection dbConn = ConnectionFactory.newInstance();
        try {
            conn = dbConn.getConnection();
        } catch (Exception e) {
            System.out.println("连接失败");
        }
    }
	/**
	 * 执行具体sql语句
	 * @param sqlList
	 */
	public void execute(List<String> sqlList){
		Connection conn = null;
		Statement stat = null;
		try {
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

    public  void webXml(String fromFile, String toFile) throws Exception {
        FileUtils.copyFile(new File(fromFile), new File(toFile));
    }


//	public static void changeDbCharset(String dbHost, String dbPort,
//			String dbName, String dbUser, String dbPassword) throws Exception {
//		Connection conn = getConn(dbHost, dbPort, dbName, dbUser, dbPassword);
//		Statement stat = conn.createStatement();
//		String sql = "ALTER DATABASE " + dbName + " CHARACTER SET UTF8";
//		stat.execute(sql);
//		stat.close();
//		conn.close();
//	}

    /**
     * 创建表
     * @param sqlList
     * @throws Exception
     */
    public  void createTable( List<String> sqlList)
            throws Exception {
        Statement stat = conn.createStatement();
        for (String dllsql : sqlList) {
            System.out.println(dllsql);
            stat.execute(dllsql);
        }
        stat.close();
        conn.close();
    }


    /**
     * 读取sql语句。“/*”开头为注释，“;”为sql结束。
     *
     * @param fileName
     *            sql文件地址
     * @return list of sql
     * @throws Exception
     */
    public  List<String> readSql(String fileName) throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(
                new FileInputStream(fileName), "GBK"));
        List<String> sqlList = new ArrayList<String>();
        StringBuilder sqlSb = new StringBuilder();
        String s = null;
        while ((s = br.readLine()) != null) {
            if (s.startsWith("/*") || s.startsWith("#") || s.startsWith("--")
                    || StringUtils.isBlank(s)) {
                continue;
            }
            if (s.endsWith(";")) {
                sqlSb.append(s);
                sqlSb.setLength(sqlSb.length() - 1);
                sqlList.add(sqlSb.toString());
                sqlSb.setLength(0);
            } else {
                sqlSb.append(s);
            }
        }
        br.close();
        return sqlList;
    }
	
	
}
