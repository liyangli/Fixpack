package com.bohui.service;

import com.bohui.db.exec.DBExec;
import com.bohui.resource.PropertiesResource;
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * 项目处理类
 * User: LiYangLi
 * Date: 13-11-7
 * Time: 下午4:48
 */
public class ProjectService {

    private static PropertiesResource resource = PropertiesResource.newInstance("config.properties");
    /**
     * 执行sql文件
     */
    public static void execSQL(){
        String model = resource.getProValue("dbMode");
        if("1".equals(model)){
            return ;
        }
        String space = resource.getProValue("dbTableSpace");
        String index = resource.getProValue("dbIndex");
        String table = resource.getProValue("dbTable");
        String init = resource.getProValue("dbInit");

        String path = ProjectService.class.getResource("/").getPath();
        if("1".equals(space)){
            String spaceSql = path+resource.getProValue("spaceSql");
            DBExec exec = new DBExec();
            try {
                List<String> sqls = exec.readSql(spaceSql);
                exec.execute(sqls);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if("1".equals(index)){
            String spaceSql = path+resource.getProValue("indexSql");
            DBExec exec = new DBExec();
            try {
                List<String> sqls = exec.readSql(spaceSql);
                exec.execute(sqls);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if("1".equals(table)){
            String spaceSql = path+resource.getProValue("tableSql");
            DBExec exec = new DBExec();
            try {
                List<String> sqls = exec.readSql(spaceSql);
                exec.execute(sqls);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if("1".equals(init)){
            String spaceSql = path+resource.getProValue("initSql");
            DBExec exec = new DBExec();
            try {
                List<String> sqls = exec.readSql(spaceSql);
                exec.execute(sqls);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }

    /**
     * jdbc文件修改
     */
    public static void jdbcFileReplace(){
        String jdbcFile = resource.getProValue("jdbcFile");
        PropertiesResource prs = PropertiesResource.newInstance(jdbcFile);

        String ip = resource.getProValue("dbIp");
        String port = resource.getProValue("dbPort");
        String dbName = resource.getProValue("dbName");
        String url = "jdbc:oracle:thin:@"+ip+":"+port+":"+dbName;
        prs.setProValue("jdbc.url",url);
        prs.setProValue("jdbc.username",resource.getProValue("dbUser"));
        prs.setProValue("jdbc.password",resource.getProValue("dbPassword"));
    }

    /**
     * 文件拷贝
     */
    public static void copyProject(){
        String path = ProjectService.class.getResource("/").getPath();
        String dirPath = resource.getProValue("webPath");
        File file = new File(path);
        try {
            FileUtils.copyDirectory(file.getParentFile(),new File(dirPath));  //文件进行拷贝
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 启动tomcat
     */
    public static void startTomcat(){
        String dirPath = resource.getProValue("webPath");
        File file = new File(dirPath);
        File[] sunFiles = file.listFiles();
        for(File sunFile : sunFiles){

        }

    }
}
