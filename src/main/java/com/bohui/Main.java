package com.bohui;

import java.awt.Dimension;
import java.awt.Toolkit;

import javax.swing.JFrame;
import javax.swing.SwingUtilities;

import com.bohui.frames.FixPackFrame;

/**
 * 补丁包程序入口
 * @author liyangli
 *
 */
public class Main {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		SwingUtilities.invokeLater(new Runnable() {
			@Override
			public void run() {
				FixPackFrame jframe = new FixPackFrame();
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
		});
	}

}
