package com.bohui.frames;


import javax.swing.*;
import javax.swing.border.Border;
import javax.swing.border.EtchedBorder;
import java.awt.*;
import java.util.HashMap;
import java.util.Map;

/**
 * plugin frame
 * User: LiYangLi
 * Date: 13-9-6
 * Time: 上午11:35
 */
public class PluginMainFrame extends javax.swing.JFrame {
    public final static Map<Integer,JLabel> leftLables = new HashMap<Integer, JLabel>();
    public final static Map<Integer,RightPanel> rightPanels = new HashMap<Integer, RightPanel>();
    private JPanel leftPanel = new LeftPanel();

    public void setRightPanel(RightPanel rightPanel) {
        this.rightPanel = rightPanel;
    }

    public RightPanel getRightPanel() {
        return rightPanel;
    }

    private RightPanel rightPanel = new SummaryPanel();
    private JPanel bottom = new BootomPanel();

   public PluginMainFrame(){
       setSize(600, 550);
       this.setTitle("安装包");
       setIconImage(Toolkit.getDefaultToolkit().getImage(FixPackFrame.class.getClass().getResource("/").getPath() + "wallpaper1.jpg"));
       getContentPane().setLayout(null);
       add(leftPanel);

       this.add(rightPanel);
       this.add(bottom);
       init(); // init right Panels

   }

   private void init(){
       rightPanels.put(1,new SummaryPanel());
       rightPanels.put(2,new LicensePanel());
       rightPanels.put(3,new InstalPathPanel());
//       rightPanels.put(4,new TempPathPanel());
//       rightPanels.put(5,new DBModelPanel());
//       rightPanels.put(6,new DBConfigPanel());
//       rightPanels.put(7,new PlanInstalPanel());
//       rightPanels.put(8,new InstallingPanel());
//       rightPanels.put(9,new CompletePanel());
       rightPanels.put(4,new DBModelPanel());
       rightPanels.put(5,new DBConfigPanel());
       rightPanels.put(6,new PlanInstalPanel());
       rightPanels.put(7,new InstallingPanel());
       rightPanels.put(8,new CompletePanel());
   }
    public static void main(String[] args){
        PluginMainFrame jframe = new PluginMainFrame();
        jframe.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        jframe.setVisible(true);
        jframe.setResizable(false);
        int windowWidth = jframe.getWidth(); // 获得窗口宽
        int windowHeight = jframe.getHeight(); // 获得窗口高
        Toolkit kit = Toolkit.getDefaultToolkit(); // 定义工具包
        Dimension screenSize = kit.getScreenSize(); // 获取屏幕的尺寸
        int screenWidth = screenSize.width; // 获取屏幕的宽
        int screenHeight = screenSize.height; // 获取屏幕的高
        jframe.setLocation(screenWidth / 2 - windowWidth / 2, screenHeight / 2 - windowHeight / 2);// 设置窗口居中显示
    }


}
/**
 * left panel show run
 */
class LeftPanel extends JPanel{
    private JLabel title = new JLabel("安装包，安装过程");
    private JLabel summary = new JLabel("简介");
    private JLabel license= new JLabel("许可声明");
    private JLabel instalPath = new JLabel("安装路径");
//    private JLabel tempPath = new JLabel("备份路径");
    private JLabel dbModel = new JLabel("数据库更新模式");
    private JLabel dbConfig = new JLabel("配置数据库");
    private JLabel planInstal = new JLabel("预案装摘要");
    private JLabel installing = new JLabel("安装完成");
//    private JLabel complete = new JLabel("安装完成");

    public LeftPanel(){
        Border border2 = BorderFactory.createEtchedBorder(EtchedBorder.RAISED);
        setBorder(border2);
        setBounds(0,0,200,400);
        //   this.setBorder(new BorderLayout(1,1));
        //setBackground(Color.green);
        title.setBounds(10,10,200,20);
        setLayout(null);
        add(title);
        summary.setBounds(30, 60, 200, 20);
        Font font = new Font("Dialog",Font.BOLD,13);
        ImageIcon image =new ImageIcon(FixPackFrame.class.getClass().getResource("/").getPath() +"run.jpg");
        summary.setIcon(image);
        summary.setFont(font);

        add(summary);
        license.setBounds(30,90,200,20);
        add(license);
        instalPath.setBounds(30,120,200,20);
        add(instalPath);
//        tempPath.setBounds(30,150,200,20);
//        add(tempPath);
        dbModel.setBounds(30,150,200,20);
        add(dbModel);
        dbConfig.setBounds(30,180,200,20);
        add(dbConfig);
        planInstal.setBounds(30,210,200,20);
        add(planInstal);
        installing.setBounds(30,240,200,20);
        add(installing);
//        complete.setBounds(30,270,200,20);
//        add(complete);

        PluginMainFrame.leftLables.put(1,summary);
        PluginMainFrame.leftLables.put(2,license);
        PluginMainFrame.leftLables.put(3,instalPath);
//        PluginMainFrame.leftLables.put(4,tempPath);
        PluginMainFrame.leftLables.put(4,dbModel);
        PluginMainFrame.leftLables.put(5,dbConfig);
        PluginMainFrame.leftLables.put(6,planInstal);
        PluginMainFrame.leftLables.put(7,installing);
//        PluginMainFrame.leftLables.put(8,complete);
    }

//    JLabel getComplete() {
//        return complete;
//    }
//
//    void setComplete(JLabel complete) {
//        this.complete = complete;
//    }

    JLabel getDbConfig() {
        return dbConfig;
    }

    void setDbConfig(JLabel dbConfig) {
        this.dbConfig = dbConfig;
    }

    JLabel getDbModel() {
        return dbModel;
    }

    void setDbModel(JLabel dbModel) {
        this.dbModel = dbModel;
    }

    JLabel getInstalling() {
        return installing;
    }

    void setInstalling(JLabel installing) {
        this.installing = installing;
    }

    JLabel getInstalPath() {
        return instalPath;
    }

    void setInstalPath(JLabel instalPath) {
        this.instalPath = instalPath;
    }

    JLabel getLicense() {
        return license;
    }

    void setLicense(JLabel license) {
        this.license = license;
    }

    JLabel getPlanInstal() {
        return planInstal;
    }

    void setPlanInstal(JLabel planInstal) {
        this.planInstal = planInstal;
    }

    JLabel getSummary() {
        return summary;
    }

    void setSummary(JLabel summary) {
        this.summary = summary;
    }

//    JLabel getTempPath() {
//        return tempPath;
//    }
//
//    void setTempPath(JLabel tempPath) {
//        this.tempPath = tempPath;
//    }

    JLabel getTitle() {
        return title;
    }

    void setTitle(JLabel title) {
        this.title = title;
    }
}
