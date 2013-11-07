package com.bohui.frames;

import javax.swing.*;

/**
 * Object desc
 * User: LiYangLi
 * Date: 13-9-9
 * Time: 下午1:31
 */
public class CompletePanel extends RightPanel {

    public CompletePanel(){
        super();
    }
    @Override
    protected String topText() {
        return "安装完成";
    }

    @Override
    protected JPanel bootomPanel() {
        JPanel bootom = new JPanel();
        bootom.setLayout(null);
        bootom.setBounds(10,10,400,400);

       JLabel label = new JLabel();
        label.setText("安装完成");
        label.setBounds(10,50,100,25);
        bootom.add(label);

        return bootom;
    }

}
