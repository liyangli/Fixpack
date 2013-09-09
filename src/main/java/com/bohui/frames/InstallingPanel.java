package com.bohui.frames;

import javax.swing.*;

/**
 * Object desc
 * User: LiYangLi
 * Date: 13-9-9
 * Time: 下午1:31
 */
public class InstallingPanel extends RightPanel {

    public InstallingPanel(){
        super();
    }
    @Override
    protected String topText() {
        return "安装中……";
    }

    @Override
    protected JPanel bootomPanel() {
        JPanel bootom = new JPanel();

        return bootom;
    }

}
