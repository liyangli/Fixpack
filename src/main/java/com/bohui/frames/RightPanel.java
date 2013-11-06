package com.bohui.frames;

import javax.swing.*;
import javax.swing.border.Border;
import javax.swing.border.EtchedBorder;
import java.awt.*;

/**
 * Object desc
 * User: LiYangLi
 * Date: 13-9-9
 * Time: 下午1:28
 */
public abstract class RightPanel extends JPanel{


    public RightPanel(){
        setLayout(null);
        setBounds(200,0,400,400);
        add(topPanel());
        add(bootomPanel());
    }

     protected JPanel topPanel(){
         JPanel topPanel = new JPanel();
         JLabel topLabel = new JLabel();
         topLabel.setText(topText());
//         Border border2 = BorderFactory.createEtchedBorder(EtchedBorder.RAISED);
//         topLabel.setBorder(border2);
         topPanel.setBounds(150, 10, 90, 40);
         topPanel.add(topLabel);
         //set font
//         Font font = new Font("Dialog",Font.BOLD,16);
//         topLabel.setFont(font);
         return topPanel;
     }
    abstract protected String topText();
    abstract protected JPanel bootomPanel();

    /**
     * click next btn right panel config info
     * eg:
     * DbInstallConfig
     */
    public  void doFireConfig(){};

    public boolean validateField(){
        return false;
    }
}
