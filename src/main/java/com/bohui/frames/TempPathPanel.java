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
public class TempPathPanel extends RightPanel {
    private   JTextField filePaths;
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

        JLabel showLabel = new JLabel("为了避免升级给你带来的不便，升级工具会自动备份你的服务端，以便升级失败时回滚你的系统。请选择备份路径，升级成功后可以手动删除该目录");
        showLabel.setBounds(10,40,400,200);
        bootom.add(showLabel);

        JLabel label = new JLabel("备份路径：");
        label.setBounds(10,270,100,25);
        bootom.add(label);

        filePaths = new JTextField();
        filePaths.setBounds(90,270,185,25);
        //filePaths.setEditable(false);
        bootom.add(filePaths);

        JButton fileBtn = new JButton("选择");
        fileBtn.setBounds(280,270,80,25);
        fileBtn.addActionListener(new SearchFileActionListener());
        bootom.add(fileBtn);
        return bootom;
    }

    @Override
    public void doFireConfig() {
        //deal save webPath
        String webPath = filePaths.getText();
        PropertiesResource resource = PropertiesResource.newInstance("config.properties");
        resource.setProValue("tempPath",webPath);
    }

    /**
     * 进行选择文件
     * @author liyangli
     *
     */
    private class SearchFileActionListener extends JFrame implements ActionListener
    {
        private static final long serialVersionUID = 1L;

        public void actionPerformed(ActionEvent e) {
            //choose file
            //打开新的选择文件
            String selectPath = filePaths.getText();
            String filePath = "";
            if(selectPath != null && !selectPath.isEmpty())
            {
                filePath = selectPath;
            }else{
                filePath = System.getProperty("user.dir");
            }
            JFileChooser fileChooser = new JFileChooser(filePath);
            fileChooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
            fileChooser.setDialogTitle("请选择目录");
            int result = fileChooser.showOpenDialog(SearchFileActionListener.this);
            if (result == JFileChooser.APPROVE_OPTION) {
                String path = fileChooser.getSelectedFile().getAbsolutePath();
                filePaths.setText(path);
            }
            if(result==JFileChooser.CANCEL_OPTION)
            {
                fileChooser.setVisible(false);
            }
        }
    }

}
