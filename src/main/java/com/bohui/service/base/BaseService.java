package com.bohui.service.base;

import com.bohui.resource.PropertiesResource;
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;

/**
 * 基础处理数据
 * 1、jdbc文件复制
 * 2、复制项目
 * 3、执行sql(a、win  b、linux)两种方式
 * User: LiYangLi
 * Date: 13-11-8
 * Time: 上午10:13
 */
public class BaseService {
    protected   PropertiesResource resource = PropertiesResource.newInstance("config.properties");

    /**
     * jdbc文件拷贝覆盖
     */
    public void jdbcCopyReplace(){
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
     * 项目进行覆盖
     */
    public void sysReplace(){
        String path = BaseService.class.getResource("/").getPath();
        String dirPath = resource.getProValue("webPath");
        File file = new File(path);
        try {
            FileUtils.copyDirectory(file.getParentFile(), new File(dirPath));  //文件进行拷贝
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 系统配置
     */
    public void sysConfig(){

    }

    /**
     * 初始化入口
     */
    public void init(){
        jdbcCopyReplace();
        sysReplace();
        sysConfig();
    }
}
