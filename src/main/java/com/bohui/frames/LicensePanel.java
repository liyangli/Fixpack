package com.bohui.frames;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

/**
 * Object desc
 * User: LiYangLi
 * Date: 13-9-9
 * Time: 下午1:31
 */
public class LicensePanel extends RightPanel {

    public LicensePanel(){
        super();
    }
    @Override
    protected String topText() {
        return "许可声明";
    }

    @Override
    protected JPanel bootomPanel() {
        JPanel bootom = new JPanel();
        bootom.setLayout(null);
        bootom.setBounds(10,10,400,400);
        JTextArea textArea = new JTextArea();
        textArea.setText("请遵循相关服务和监听，收到非法处理时，本人该不负责");
        textArea.setEditable(false);
        textArea.setBounds(10,40,400,300);
        bootom.add(textArea);

        JCheckBox checkBox = new JCheckBox();
        checkBox.setText("同意");
        checkBox.setSelected(true);
        checkBox.setBounds(200,350,20,20);

        JLabel label = new JLabel("同意");
        label.setBounds(220,350,80,20);
        bootom.add(label);
        checkBox.addActionListener(new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent e) {
                JCheckBox checkBox = (JCheckBox)e.getSource();
                Container container = checkBox.getParent().getParent().getParent();
                Component[] components = container.getComponents();
                BootomPanel bottomPanel = null;
                for (Component component:components){
                    if(component instanceof BootomPanel){
                        bottomPanel = (BootomPanel)component;
                        break;
                    }
                }

                //不同意不允许点击下一步
                if(checkBox.isSelected() == false){
                    bottomPanel.getNextBtn().setEnabled(false);
                } else{
                    bottomPanel.getNextBtn().setEnabled(true);
                }
            }
        });

        bootom.add(checkBox);
        return bootom;
    }

}
