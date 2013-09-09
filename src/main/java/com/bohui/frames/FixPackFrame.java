package com.bohui.frames;

import java.awt.Dimension;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.LayoutStyle.ComponentPlacement;
import javax.swing.ListSelectionModel;
import javax.swing.SwingUtilities;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.JTableHeader;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.bohui.service.FixPackService;

public class FixPackFrame extends JFrame {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public FixPackFrame() {
		
		
		setIconImage(Toolkit.getDefaultToolkit().getImage(FixPackFrame.class.getClass().getResource("/").getPath()+"wallpaper1.jpg"));
		setTitle("补丁安装");
		setSize(470, 400);
		getContentPane().setLayout(new GridLayout());
		
		JPanel panel = new JPanel();
		panel.setToolTipText("");
		getContentPane().add(panel);
		
		JLabel label = new JLabel("项目路径：");
		
		textField = new JTextField();
		textField.setColumns(10);
		textField.setEditable(false);
		
		JButton button = new JButton("选择文件");
		button.addActionListener(new SearchFileActionListener());
		
		init();
		
		JButton install = new JButton("安装");
		install.addActionListener(new InstallActionListener());
		
		JButton reset = new JButton("取消");
		
		reset.addActionListener(new ResetActionListener());
		
		
		
		
		GroupLayout gl_panel = new GroupLayout(panel);
		gl_panel.setHorizontalGroup(
			gl_panel.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_panel.createSequentialGroup()
					.addGap(44)
					.addGroup(gl_panel.createParallelGroup(Alignment.LEADING)
						.addComponent(scrollPane, GroupLayout.PREFERRED_SIZE, 338, GroupLayout.PREFERRED_SIZE)
						.addGroup(gl_panel.createSequentialGroup()
							.addComponent(label)
							.addPreferredGap(ComponentPlacement.RELATED)
							.addGroup(gl_panel.createParallelGroup(Alignment.LEADING)
								.addGroup(gl_panel.createSequentialGroup()
									.addGap(10)
									.addComponent(install)
									.addGap(34)
									.addComponent(reset))
								.addGroup(gl_panel.createSequentialGroup()
									.addGap(4)
									.addComponent(textField, GroupLayout.PREFERRED_SIZE, 176, GroupLayout.PREFERRED_SIZE)
									.addGap(6)
									.addComponent(button)))))
					.addContainerGap(80, Short.MAX_VALUE))
		);
		gl_panel.setVerticalGroup(
			gl_panel.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_panel.createSequentialGroup()
					.addContainerGap()
					.addComponent(scrollPane, GroupLayout.PREFERRED_SIZE, 217, GroupLayout.PREFERRED_SIZE)
					.addGap(27)
					.addGroup(gl_panel.createParallelGroup(Alignment.BASELINE)
						.addComponent(label)
						.addComponent(textField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
						.addComponent(button))
					.addPreferredGap(ComponentPlacement.RELATED, 28, Short.MAX_VALUE)
					.addGroup(gl_panel.createParallelGroup(Alignment.BASELINE)
						.addComponent(reset)
						.addComponent(install))
					.addGap(38))
		);
		
		scrollPane.setViewportView(table);
		panel.setLayout(gl_panel);
		
		//调用初始化方法
	}
	
	/**
	 * 进行初始化页面内容
	 */
	private void init(){
		
		table = new JTable();
		table.setSelectionMode(ListSelectionModel.MULTIPLE_INTERVAL_SELECTION);
		
		DefaultTableModel model = new DefaultTableModel();
		model.setColumnIdentifiers(new Object[] {"版本号", "安装时间", "操作"}); 
		
		model.addRow(new Object[]{"dutyManager1.0","2013-04-01","卸载"});
		
		table.setModel(model);
		table.setRowHeight(20);
		table.setFont(new Font("微软雅黑", Font.PLAIN, 14));
		table.setEnabled(false);
		
		
		JTableHeader header = table.getTableHeader();
		header.setFont(new Font("微软雅黑", Font.PLAIN, 14));         //设置表头的高度      
		header.setPreferredSize(new Dimension(header.getWidth(), 20));         //显示表   
		
		//居中显示
		DefaultTableCellRenderer  render = (DefaultTableCellRenderer)table.getDefaultRenderer(Object.class);
		render.setHorizontalAlignment(SwingUtilities.CENTER);
		
	}
	
	private JTextField textField;
	private JTable table;
	private JScrollPane scrollPane = new JScrollPane();
	private JFileChooser fileChooser ;
	private static final Logger log = LoggerFactory.getLogger(FixPackFrame.class);
	
	/**
	 * 取消监听器
	 * @author liyangli
	 *
	 */
	private class ResetActionListener implements ActionListener{

		@Override
		public void actionPerformed(ActionEvent e) {
			//进行关闭程序
			System.exit(1);
		}
		
	}
	
	private class InstallActionListener implements ActionListener{

		@Override
		public void actionPerformed(ActionEvent e) {
			//进行开始进行安装
			//1、判定是否已经选择对应补丁路径
//			JButton button = (JButton)e.getSource();
			String path = textField.getText();
			if(path == null || path.isEmpty())
			{
				JOptionPane.showMessageDialog(null, "必须选择项目路径", "错误", JOptionPane.ERROR_MESSAGE);
				return;
			}
			log.info("选择补丁目录：{}",path);
			//进行执行安装操作
			FixPackService service = new FixPackService();
			try {
				service.fixPack(path);
			} catch (Exception e1) {
				//出现错误，进行提示
				JOptionPane.showMessageDialog(null, "在进行安装过程出现错误，请确定项目路径正确", "错误", JOptionPane.ERROR_MESSAGE);
				return;
			}
			 JOptionPane.showMessageDialog(null, "恭喜补丁安装成功了", "成功", JOptionPane.INFORMATION_MESSAGE);
		}
		
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
			//打开新的选择文件
			String selectPath = textField.getText();
			String filePath = "";
			if(selectPath != null && !selectPath.isEmpty())
			{
				filePath = selectPath;
			}else{
				filePath = System.getProperty("user.dir");
			}
			fileChooser = new JFileChooser(filePath);
			fileChooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
			fileChooser.setDialogTitle("请选择目录");
			int result = fileChooser.showOpenDialog(SearchFileActionListener.this);
			if (result == JFileChooser.APPROVE_OPTION) {
				String path = fileChooser.getSelectedFile().getAbsolutePath();
				textField.setText(path);
			}
			if(result==JFileChooser.CANCEL_OPTION)
			{
				fileChooser.setVisible(false);
			}
		}
	}
}
