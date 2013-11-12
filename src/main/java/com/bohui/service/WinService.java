package com.bohui.service;

import com.bohui.resource.PropertiesResource;
import com.bohui.service.base.BaseService;

import java.io.*;

/**
 * Object desc
 * User: LiYangLi
 * Date: 13-11-8
 * Time: 上午10:21
 */
public class WinService extends BaseService {
    @Override
    public void sysConfig() {
         //java 调用cmd,传入sql文件、启动tomcat,增加驱动
        String dbMode = resource.getProValue("dbMode");
        try {
            if("0".equals(dbMode)){
                runCmd();
            }
            tomcatRun();
            //执行驱动
            driver();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * 驱动加载
     */
    private void driver() throws  Exception{
        String filePath = resource.getProValue("webPath");
        String driverExe = resource.getProValue("driverExe");
        if(driverExe != null && !driverExe.isEmpty() ) {
            String driver =  filePath + "/driver/driver.exe";
            cmdExe(driver);
        }
    }

    /**
     * tomcat 运行
     */
    private void tomcatRun() throws Exception{
        String filePath = resource.getProValue("webPath");
        String tomcatPath = filePath + "/tomcat/bin";
        String cmdRun = tomcatPath+"/service.bat install tomcat7";
        cmdExe(cmdRun);

        String runTomcat = "net start tomcat7";
        cmdExe(runTomcat);
    }

    private void cmdExe(String cmd) throws  Exception{
        Runtime rt = Runtime.getRuntime();
        Process pr = rt.exec(cmd); // cmd /c calc

        BufferedReader input = new BufferedReader(new InputStreamReader(pr.getInputStream(), "GBK"));

        String line = null;

        while ((line = input.readLine()) != null) {
            System.out.println(line);
        }

        int exitVal = pr.waitFor();
    }

    /**
     * 运行sql文件
     * @throws Exception
     */
    private  void runCmd() throws Exception{
        String netSID = resource.getProValue("netSID");
        String userName = resource.getProValue("dbUser");
        String password = resource.getProValue("dbPassword");
        String filePath = resource.getProValue("webPath");

//      获得对应sql文件路径
        String dbTableSpace = resource.getProValue("dbTableSpace");
        String dbIndex = resource.getProValue("dbIndex");
        String dbTable = resource.getProValue("dbTable");
        String dbInit = resource.getProValue("dbInit");

        StringBuilder builder = new StringBuilder();
        builder.append("cmd /c sqlplus ");
        builder.append(userName);
        builder.append("/").append(password);
        builder.append("@").append(netSID);

        StringBuilder sqlBuilder = new StringBuilder();
        if("1".equals(dbTableSpace)){
            String tableSpace = resource.getProValue("spaceSql");
            sqlBuilder.append("@").append(filePath+tableSpace);
        }
        if("1".equals(dbIndex)){
            String index = resource.getProValue("indexSql");
            sqlBuilder.append("@").append(filePath+index);
        }
        if("1".equals(dbTable)){
            String tableSql = resource.getProValue("tableSql");
            sqlBuilder.append("@").append(filePath+tableSql);
        }
        if("1".equals(dbInit)){
            String initSql = resource.getProValue("initSql");
            sqlBuilder.append("@").append(filePath+initSql);
        }

        builder.append(sqlBuilder);

        String cmdRun = builder.toString();
        cmdExe(cmdRun);

    }

}
