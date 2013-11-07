package com.bohui.frames;

import com.bohui.resource.PropertiesResource;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

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

    private JComboBox box1 ;
    private JComboBox box2 ;
    private JComboBox box3 ;
    private JComboBox box4 ;

    @Override
    protected JPanel bootomPanel() {

        box1 = new JComboBox();
        box2 = new JComboBox();
        box3 = new JComboBox();
        box4 = new JComboBox();

        JPanel bootom = new JPanel();
        bootom.setLayout(null);
        bootom.setBounds(10,10,400,400);


        JLabel showLabel = new JLabel("创建表分区：");
        showLabel.setBounds(10,50,100,25);
        bootom.add(showLabel);

        box1.addItem("是");
        box1.addItem("否");
        box1.setBounds(90,50,100,25);
        bootom.add(box1);

        JLabel label = new JLabel("创建索引：");
        label.setBounds(10,100,100,25);
        bootom.add(label);

        box2.addItem("是");
        box2.addItem("否");
        box2.setBounds(90,100,100,25);
        //filePaths.setEditable(false);
        bootom.add(box2);

        JLabel tableCreate = new JLabel("创建表结构：");
        tableCreate.setBounds(10,150,100,25);
        bootom.add(tableCreate);

        box3.addItem("是");
        box3.addItem("否");
        box3.setBounds(90,150,100,25);
        //filePaths.setEditable(false);
        bootom.add(box3);

        JLabel initDate = new JLabel("初始化数据：");
        initDate.setBounds(10,200,100,25);
        bootom.add(initDate);

        box4.addItem("是");
        box4.addItem("否");
        box4.setBounds(90,200,100,25);
        bootom.add(box4);

        final PropertiesResource resource = PropertiesResource.newInstance("config.properties");

        final JButton  autoBtn = new JButton("自动");
        autoBtn.setBounds(60,250,100,25);
        autoBtn.setEnabled(false);
        bootom.add(autoBtn);


        final JButton handBtn = new JButton("手动");
        handBtn.setBounds(180,250,100,25);
        bootom.add(handBtn);
        handBtn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                autoBtn.setEnabled(true);
                handBtn.setEnabled(false);
                resource.setProValue("dbMode","1");
            }
        });

        autoBtn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                autoBtn.setEnabled(false);
                handBtn.setEnabled(true);
                resource.setProValue("dbMode","0");
            }
        });

        return bootom;
    }

    @Override
    public void doFireConfig() {
        //进行数据保存到配置文件中
        Object obj1 = box1.getSelectedItem();
        Object obj2 = box2.getSelectedItem();
        Object obj3 = box3.getSelectedItem();
        Object obj4 = box4.getSelectedItem();

        final PropertiesResource resource = PropertiesResource.newInstance("config.properties");
        if("是".equals(obj1)){
            resource.setProValue("dbTableSpace","1");
        }else{
            resource.setProValue("dbTableSpace","0");
        }

        if("是".equals(obj2)){
            resource.setProValue("dbIndex","1");
        }else{
            resource.setProValue("dbIndex","0");
        }
        if("是".equals(obj3)){
            resource.setProValue("dbTable","1");
        }else{
            resource.setProValue("dbTable","0");
        }
        if("是".equals(obj4)){
            resource.setProValue("dbInit","1");
        }else{
            resource.setProValue("dbInit","0");
        }

    }
}
