package com.bohui.frames;

import com.bohui.resource.PropertiesResource;
import com.bohui.service.ProjectService;

import javax.swing.*;

/**
 * Object desc
 * User: LiYangLi
 * Date: 13-9-9
 * Time: 下午1:31
 */
public class PlanInstalPanel extends RightPanel {

    public PlanInstalPanel(){
        super();
    }
    @Override
    protected String topText() {
        return "安装预览";
    }

    private JLabel ipLabel;
    private JLabel nameLabel;
    private JLabel userLabel;
    private JLabel passLabel;

    private JLabel spaceLabel;
    private JLabel indexLabel;
    private JLabel tableLabel;
    private JLabel initLabel;
    private JLabel modelLabel;
    @Override
    protected JPanel bootomPanel() {
        JPanel bootom = new JPanel();
        bootom.setLayout(null);
        bootom.setBounds(10,10,400,400);

        ipLabel = new JLabel();
        ipLabel.setBounds(10,50,150,25);
        bootom.add(ipLabel);

        nameLabel = new JLabel();
        nameLabel.setBounds(10,80,150,25);
        bootom.add(nameLabel);

        userLabel = new JLabel();
        userLabel.setBounds(10,110,150,25);
        bootom.add(userLabel);

        passLabel = new JLabel();
        passLabel.setBounds(10,140,150,25);
        bootom.add(passLabel);

        spaceLabel = new JLabel();
        spaceLabel.setBounds(10,170,150,25);
        bootom.add(spaceLabel);

        indexLabel = new JLabel();
        indexLabel.setBounds(10,200,150,25);
        bootom.add(indexLabel);

        tableLabel = new JLabel();
        tableLabel.setBounds(10,240,150,25);
        bootom.add(tableLabel);

        initLabel = new JLabel();
        initLabel.setBounds(10,270,150,25);
        bootom.add(initLabel);

        modelLabel = new JLabel();
        modelLabel.setBounds(10,300,150,25);
        bootom.add(modelLabel);

        return bootom;
    }

    @Override
    public void doFireConfig() {
        //预安装
        //1、判断执行sql文件
        ProjectService.execSQL();
        //2、更改jdbc文件
        ProjectService.jdbcFileReplace();
        //3、拷贝文件到指定目录
        ProjectService.copyProject();
        //4、启动tomcat
        ProjectService.startTomcat();
    }

    @Override
    public void doInit() {
        //页面显示数据
        PropertiesResource resource = PropertiesResource.newInstance("config.properties");
        String ip = resource.getProValue("dbIp");
        String port = resource.getProValue("dbPort");
        String dbName = resource.getProValue("dbName");
        String userName = resource.getProValue("dbUser");
        String password = resource.getProValue("dbPassword");
        String tableSpace = resource.getProValue("dbTableSpace");
        String dbIndex = resource.getProValue("dbIndex");
        String dbTable = resource.getProValue("dbTable");
        String dbInit = resource.getProValue("dbInit");

        String dbMode = resource.getProValue("dbMode");

        ipLabel.setText("IP地址："+ip+":"+port);
        nameLabel.setText("数据库名称："+dbName);
        userLabel.setText("用户名："+userName);
        passLabel.setText("密码："+password);

        String flag = "是";
        if("1".equals(tableSpace)){
            flag = "是";
        }else{
            flag = "否";
        }
        spaceLabel.setText("表空间："+flag);

        if("1".equals(dbIndex)){
            flag = "是";
        }else{
            flag = "否";
        }
        indexLabel.setText("表索引："+flag);

        if("1".equals(dbTable)){
            flag = "是";
        }else{
            flag = "否";
        }
        tableLabel.setText("表名称："+flag);

        if("1".equals(dbInit)){
            flag = "是";
        }else{
            flag = "否";
        }
        initLabel.setText("表初始化："+flag);

        if("1".equals(dbMode)){
           flag = "手动";
        }else{
            flag = "自动";
        }
        modelLabel.setText("初始化方式："+flag);

    }
}
