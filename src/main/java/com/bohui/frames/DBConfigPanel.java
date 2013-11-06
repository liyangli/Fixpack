package com.bohui.frames;

import javax.swing.*;

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

    @Override
    protected JPanel bootomPanel() {
        JPanel bootom = new JPanel();
        bootom.setLayout(null);
        bootom.setBounds(10,10,400,400);

        JLabel showLabel = new JLabel("数据库类型：");
        showLabel.setBounds(10,50,100,25);
        bootom.add(showLabel);

        JComboBox selected = new JComboBox();
        selected.addItem("Oracle");
        selected.addItem("Mysql");
        selected.setBounds(90,50,185,25);
        bootom.add(selected);

        JLabel label = new JLabel("ip地址：");
        label.setBounds(10,100,100,25);
        bootom.add(label);

        JTextField filePaths = new JTextField();
        filePaths.setBounds(90,100,185,25);
        //filePaths.setEditable(false);
        bootom.add(filePaths);

        JLabel tableCreate = new JLabel("端口：");
        tableCreate.setBounds(10,150,100,25);
        bootom.add(tableCreate);

        JTextField tableField = new JTextField();
        tableField.setBounds(90,150,185,25);
        //filePaths.setEditable(false);
        bootom.add(tableField);

        JLabel initDate = new JLabel("数据库名称：");
        initDate.setBounds(10,200,100,25);
        bootom.add(initDate);

        JTextField initField = new JTextField();
        initField.setBounds(90,200,185,25);
        bootom.add(initField);


        JButton handBtn = new JButton("连接测试");
        handBtn.setBounds(180,250,100,25);
        bootom.add(handBtn);

        return bootom;
    }

}
