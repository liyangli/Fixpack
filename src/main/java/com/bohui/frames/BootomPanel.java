package com.bohui.frames;

import javax.swing.*;
import javax.swing.border.Border;
import javax.swing.border.EtchedBorder;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

/**
 * Object desc
 * User: LiYangLi
 * Date: 13-9-9
 * Time: 下午2:56
 */
public class BootomPanel extends JPanel {
    public JButton getNextBtn() {
        return nextBtn;
    }

    public void setNextBtn(JButton nextBtn) {
        this.nextBtn = nextBtn;
    }

    public JButton getPreBtn() {
        return preBtn;
    }

    public void setPreBtn(JButton preBtn) {
        this.preBtn = preBtn;
    }

    private JButton nextBtn = new JButton("下一步");
    private JButton preBtn = new JButton("上一步");
    private JButton resetBtn = new JButton("取消");
    public BootomPanel() {
        setLayout(null);
        Border border2 = BorderFactory.createEtchedBorder(EtchedBorder.RAISED);
        setBorder(border2);
        setBounds(0, 400, 590, 100);

        preBtn.setBounds(300, 0, 90, 30);
        nextBtn.setBounds(390, 0, 90, 30);
        resetBtn.setBounds(480,0,90,30);
        add(nextBtn);
        add(preBtn);
        add(resetBtn);

        preBtn.setVisible(false);

        nextBtn.addActionListener(new NextListener());
        resetBtn.addActionListener(new ResetListener());
    }

}

/**
 * nextBtn listner
 */
class NextListener implements ActionListener{

    private Integer flag = 1;
    @Override
    public void actionPerformed(ActionEvent e) {
        //set preBtn  netBtn and leftPanel and rightPanel change
        JButton nextBtn = (JButton)e.getSource();
        BootomPanel bootom = (BootomPanel)nextBtn.getParent();
        flag += 1;
        //opeator left
        setLeftPanelByNext(bootom);
        //opeator right
        RightPanel rightPanel = PluginMainFrame.rightPanels.get(flag);
        PluginMainFrame frame = (PluginMainFrame)bootom.getParent().getParent().getParent().getParent();
        RightPanel panel = frame.getRightPanel();
        panel.doFireConfig();
        //panel.removeAll();

        //panel.remove(1);
       // frame.add(rightPanel);
    }

    /**
     * base nextBtn
     * @param bootom bootom Panel
     */
    private void setLeftPanelByNext(BootomPanel bootom) {
        if(flag == 1){
            JLabel firstLabel = PluginMainFrame.leftLables.get(flag);
            ImageIcon image =new ImageIcon(FixPackFrame.class.getClass().getResource("/").getPath() +"success.jpg");
            firstLabel.setIcon(image);
            bootom.getPreBtn().setVisible(false);
        }else{
            bootom.getPreBtn().setVisible(true);
            JLabel label = PluginMainFrame.leftLables.get(flag);
            ImageIcon image =new ImageIcon(FixPackFrame.class.getClass().getResource("/").getPath() +"run.jpg");
            label.setIcon(image);

            JLabel preLabel =  PluginMainFrame.leftLables.get(flag-1);
            ImageIcon runImage =new ImageIcon(FixPackFrame.class.getClass().getResource("/").getPath() +"success.jpg");
            preLabel.setIcon(runImage);

            if(flag == 9){
                bootom.getPreBtn().setBounds(390, 0, 90, 30);
                bootom.getNextBtn().setVisible(false);
            }else{
                bootom.getPreBtn().setBounds(300, 0, 90, 30);
            }

        }
    }
}

/**
 * reset btn listener
 */
class ResetListener implements ActionListener {
    @Override
    public void actionPerformed(ActionEvent e) {
        //show close this window
        System.exit(-1);
    }
}