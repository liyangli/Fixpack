package com.bohui.frames;

import java.io.File;

import javax.swing.JFileChooser;
import javax.swing.filechooser.FileFilter;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
/**
 * 文件选择器
 * @author liyangli
 *
 */
public class FileChooser extends JFileChooser {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3335241661143907694L;

	@Override
	public void setCurrentDirectory(File dir) {
		// TODO Auto-generated method stub
		super.setCurrentDirectory(new File(System.getProperty("user.dir")));
	}

	@Override
	public void addChoosableFileFilter(FileFilter filter) {
		// TODO Auto-generated method stub
		super.addChoosableFileFilter(new FileFilter(){

			@Override
			public boolean accept(File f) {
				return f.isDirectory();
			}

			@Override
			public String getDescription() {
				return "只能选择目录";
			}
			
		});
	}



	
}
