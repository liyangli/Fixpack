package com.bohui.frames;

import com.bohui.db.ConnectionFactory;
import com.bohui.db.DBConnection;
import com.bohui.resource.PropertiesResource;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;

/**
 * Object desc
 * User: LiYangLi
 * Date: 13-9-9
 * Time: 下午1:31
 */
public class DBConfigPanel extends RightPanel {

    public DBConfigPanel(){
        super();
    }
    @Override
    protected String topText() {
        return "配置数据库";
    }


    private JComboBox selected;
    private JTextField filePaths;
    private JTextField tableField;
    private JTextField initField;
    private JTextField userField;
    private JTextField pwField;
    @Override
    protected JPanel bootomPanel() {
        JPanel bootom = new JPanel();
        bootom.setLayout(null);
        bootom.setBounds(10,10,400,400);

        JLabel showLabel = new JLabel("数据库类型：");
        showLabel.setBounds(10,50,100,25);
        bootom.add(showLabel);

        selected = new JComboBox();
        selected.addItem("Oracle");
        selected.addItem("Mysql");
        selected.setBounds(90,50,185,25);
        bootom.add(selected);

        JLabel label = new JLabel("ip地址：");
        label.setBounds(10,100,100,25);
        bootom.add(label);

        PropertiesResource resource = PropertiesResource.newInstance("config.properties");

         filePaths = new JTextField();
        filePaths.setBounds(90,100,185,25);
        filePaths.setText(resource.getProValue("dbIp"));
        //filePaths.setEditable(false);
        bootom.add(filePaths);

        JLabel tableCreate = new JLabel("端口：");
        tableCreate.setBounds(10,150,100,25);
        bootom.add(tableCreate);

        tableField = new JTextField();
        tableField.setBounds(90,150,185,25);
        tableField.setText(resource.getProValue("dbPort"));
        //filePaths.setEditable(false);
        bootom.add(tableField);

        JLabel initDate = new JLabel("数据库名称：");
        initDate.setBounds(10,200,100,25);
        bootom.add(initDate);

        initField = new JTextField();
        initField.setBounds(90,200,185,25);
        initField.setText(resource.getProValue("dbName"));
        bootom.add(initField);

        JLabel userName = new JLabel("用户名称：");
        userName.setBounds(10,250,100,25);
        bootom.add(userName);

        userField = new JTextField();
        userField.setBounds(90,250,185,25);
        userField.setText(resource.getProValue("dbUser"));
        bootom.add(userField);

        JLabel password = new JLabel("密码：");
        password.setBounds(10,300,100,25);
        bootom.add(password);

         pwField = new JTextField();
        pwField.setBounds(90,300,185,25);
        pwField.setText(resource.getProValue("dbPassword"));
        bootom.add(pwField);




        JButton handBtn = new JButton("连接测试");
        handBtn.setBounds(180,350,100,25);
        bootom.add(handBtn);
        handBtn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                //连接测试
                Object dbType = selected.getSelectedItem();
                if("Oracle".equals(dbType)){
                    DBConnection dbConnection = ConnectionFactory.newInstance();
                    try {
                        String ip = filePaths.getText();
                        String port = tableField.getText();
                        String dbName = initField.getText();
                        String userName = userField.getText();
                        String password = pwField.getText();
                        Connection conn = dbConnection.getConnection(ip,port,dbName,userName,password);
                        if(conn == null){
                            //连接失败
                            JOptionPane.showMessageDialog(null, "Oracle 连接失败", "oracle连接", JOptionPane.ERROR_MESSAGE);
                        }else{
                            //连接成功
                            JOptionPane.showMessageDialog(null, "Oracle 连接成功", "oracle连接", JOptionPane.OK_OPTION);
                        }
                    } catch (Exception e1) {
                        JOptionPane.showMessageDialog(null, "Oracle 连接失败", "oracle连接", JOptionPane.ERROR_MESSAGE);
                    }
                }
            }
        });

        return bootom;
    }

    @Override
    public void doFireConfig() {
        PropertiesResource resource = PropertiesResource.newInstance("config.properties");
        String ip = filePaths.getText();
        String port = tableField.getText();
        String dbName = initField.getText();
        String userName = userField.getText();
        String password = pwField.getText();

        resource.setProValue("dbIp",ip);
        resource.setProValue("dbPort",port);
        resource.setProValue("dbName",dbName);
        resource.setProValue("dbUser",userName);
        resource.setProValue("dbPassword",password);
    }
}
