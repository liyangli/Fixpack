package com.bohui.frames;

import javax.swing.*;

/**
 * Object desc
 * User: LiYangLi
 * Date: 13-9-9
 * Time: 下午1:31
 */
public class DBModelPanel extends RightPanel {

    public DBModelPanel(){
        super();
    }
    @Override
    protected String topText() {
        return "数据库更新模式";
    }

    @Override
    protected JPanel bootomPanel() {
        JPanel bootom = new JPanel();
        bootom.setLayout(null);
        bootom.setBounds(10,10,400,400);


        JLabel showLabel = new JLabel("创建表分区：");
        showLabel.setBounds(10,50,100,25);
        bootom.add(showLabel);
        JComboBox box1 = new JComboBox();
        box1.addItem("是");
        box1.addItem("否");
        box1.setBounds(90,50,100,25);
        bootom.add(box1);

        JLabel label = new JLabel("创建索引：");
        label.setBounds(10,100,100,25);
        bootom.add(label);

        JComboBox box2 = new JComboBox();
        box2.addItem("是");
        box2.addItem("否");
        box2.setBounds(90,100,100,25);
        //filePaths.setEditable(false);
        bootom.add(box2);

        JLabel tableCreate = new JLabel("创建表结构：");
        tableCreate.setBounds(10,150,100,25);
        bootom.add(tableCreate);

        JComboBox box3 = new JComboBox();
        box3.addItem("是");
        box3.addItem("否");
        box3.setBounds(90,150,100,25);
        //filePaths.setEditable(false);
        bootom.add(box3);

        JLabel initDate = new JLabel("初始化数据：");
        initDate.setBounds(10,200,100,25);
        bootom.add(initDate);

        JComboBox box4 = new JComboBox();
        box4.addItem("是");
        box4.addItem("否");
        box4.setBounds(90,200,100,25);
        bootom.add(box4);

        JButton  autoBtn = new JButton("自动");
        autoBtn.setBounds(60,250,100,25);
        autoBtn.setEnabled(false);
        bootom.add(autoBtn);

        JButton handBtn = new JButton("手动");
        handBtn.setBounds(180,250,100,25);
        bootom.add(handBtn);



        return bootom;
    }

}
