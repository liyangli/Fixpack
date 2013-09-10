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

        return bootom;
    }

}
