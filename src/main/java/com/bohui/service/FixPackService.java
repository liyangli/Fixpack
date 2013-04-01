package com.bohui.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.bohui.db.exec.DBExec;
import com.bohui.resource.PropertiesResource;

/**
 * 补丁包软件实际工作类
 * @author liyangli
 *
 */
public class FixPackService {

	private static final Logger log = LoggerFactory.getLogger(FixPackService.class);
	
	private PropertiesResource resource ;
	private String projectPath = "";
	
	public FixPackService() {
		projectPath = FixPackService.class.getResource("/").getPath();
		resource = PropertiesResource.newInstance(projectPath+"db.properties");
	}
	/**
	 * 进行安装补丁包的核心类
	 * @param packPath 安装路径
	 */
	public void fixPack(String packPath) throws Exception{
		copyFile(packPath);
		execSQL();
	}
	//执行文件拷贝
	private void copyFile(String packPath) throws Exception{
		try {
			log.debug("--------------------开始拷贝对应文件--------------------");
			FileUtils.copyDirectory(new File(projectPath+resource.getProValue("srcDir")), new File(packPath));
			log.debug("-------------------文件拷贝成功-------------------------");
		} catch (IOException e) {
			log.error("出现错误了{}",e);
			throw e;
		}
	}
	//执行对应sql
	private void execSQL() throws Exception{
		//DBExec
		log.debug("----------------------开始执行execSQL------------------------");
		List<String> sqlList = new ArrayList<String>();
		try {
			String sqlPath = resource.getProValue("sqlPath");
			if(sqlPath == null || sqlPath.isEmpty())
			{
				log.info("--------------------没有需要执行的sql-------------------");
				return;
			}
			String[] sqlpaths = sqlPath.split(",");
			for(String sql :sqlpaths)
			{
				if(sql.trim().isEmpty())
				{
					continue;
				}
				sql = projectPath+sql;
				sqlList.addAll(readSql(sql));
			}
		} catch (Exception e) {
			log.error("在进行获取sql脚本时出现错误了{}",e);
			throw e;
		}
		
		DBExec exec = new DBExec();
		exec.execute(sqlList);//开始执行文件
		log.debug("----------------------进行执行sql成功-------------------------");
	}
	
	/**
	 * 读取sql语句。“/*”开头为注释，“;”为sql结束。
	 * 
	 * @param fileName
	 *            sql文件地址
	 * @return list of sql
	 * @throws Exception
	 */
	private  List<String> readSql(String fileName) throws Exception {
		BufferedReader br = new BufferedReader(new InputStreamReader(
				new FileInputStream(fileName), "GBK"));
		List<String> sqlList = new ArrayList<String>();
		StringBuilder sqlSb = new StringBuilder();
		String s = null;
		while ((s = br.readLine()) != null) {
			if (s.startsWith("/*") || s.startsWith("#")
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
