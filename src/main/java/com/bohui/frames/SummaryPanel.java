package com.bohui.frames;

import javax.swing.*;
import java.awt.*;

/**
 * Object desc
 * User: LiYangLi
 * Date: 13-9-9
 * Time: 下午1:31
 */
public class SummaryPanel extends RightPanel {

    public SummaryPanel(){
        super();
    }
    @Override
    protected String topText() {
        return "简介";
    }

    @Override
    protected JPanel bootomPanel() {
        JPanel bootom = new JPanel();
        bootom.setLayout(null);
        bootom.setBounds(50,3,400,400);
        //显示对应下面数据
        JLabel label = new JLabel("本向导将指引你完成项目的升级工作");
        label.setBounds(10,50,300,100);
        bootom.add(label);

        JLabel label2 = new JLabel("建议你在安装请，停止所有应用程序");
        label2.setBounds(10,100,300,100);
        bootom.add(label2);

        String msg = "<html><body>请单击下一步按钮，进行转向下个页面操作<br/>，点击上一步，就信息回退到上个操作，<br/>在安装过程中随时点击取消进行停止安装</body></html>";
        JLabel label3 = new JLabel();
      //  String str = findLongStr(msg,label3);
        label3.setText(msg);

        label3.setBounds(10,150,300,100);
//        JTextArea textarea = new JTextArea();
//        textarea.setEditable(false);
//        textarea.setLineWrap(true);
//        textarea.setWrapStyleWord(true);
//        textarea.setText(msg);
//        textarea.setBounds(10,150,100,100);
        bootom.add(label3);


        return bootom;
    }

//    private String findLongStr(String longString,JLabel jLabel1){
//        StringBuilder builder = new StringBuilder("<html>");
//        char[] chars = longString.toCharArray();
//        FontMetrics fontMetrics = jLabel1.getFontMetrics(jLabel1.getFont());
//        for (int beginIndex = 0, limit = 1;; limit++) {
//            System.out.println(beginIndex + " " + limit + " " + (beginIndex + limit));
//            if (fontMetrics.charsWidth(chars, beginIndex, limit) < jLabel1.getWidth()) {
//                if (beginIndex + limit < chars.length) {
//                    continue;
//                }
//                builder.append(chars, beginIndex, limit);
//                break;
//            }
//            builder.append(chars, beginIndex, limit - 1).append("<br/>");
//           // beginIndex <span style="color: #FF0000;">+=</span> limit - 1;
//            limit = 1;
//        }
//        builder.append("</html>");
//        return builder.toString();
//    }

}
