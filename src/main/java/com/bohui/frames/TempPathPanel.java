package com.bohui.frames;

import javax.swing.*;

/**
 * Object desc
 * User: LiYangLi
 * Date: 13-9-9
 * Time: 下午1:31
 */
public class TempPathPanel extends RightPanel {

    public TempPathPanel(){
        super();
    }
    @Override
    protected String topText() {
        return "备份路径";
    }

    @Override
    protected JPanel bootomPanel() {
        JPanel bootom = new JPanel();
        bootom.setLayout(null);
        bootom.setBounds(10,10,400,400);

        return bootom;
    }


}
