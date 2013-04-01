package com.bohui.resource;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 解析属性值
 * @author liyangli
 * @date 2013-3-1 
 */
public class PropertiesResource {

	private static Logger log = LoggerFactory.getLogger(PropertiesResource.class);
	private static PropertiesResource propertiesUtil = null;
	private Properties properties = null;
	private static String filePath = "jdbc.properties";
	
	private PropertiesResource(String path)
	{
		properties = new Properties();
		try {
			log.info("propertiesUtil path is {}",path);
			properties.load(new FileInputStream(path));
		} catch (FileNotFoundException e) {
			log.error("文件没有发现",e);
		} catch (IOException e) {
			log.error("文件解析出现错误",e);
		}
	}
	
	public synchronized static PropertiesResource newInstance(){
		if(propertiesUtil == null)
		{
			propertiesUtil =  new PropertiesResource(PropertiesResource.class.getResource("/").getPath()+filePath);
		}
		return propertiesUtil;
	}
	
	public synchronized static PropertiesResource newInstance(String filePath){
		if(propertiesUtil == null){
			propertiesUtil =  new PropertiesResource(filePath);
		}else{
			if(!PropertiesResource.filePath.equals(filePath)){
				propertiesUtil =  new PropertiesResource(filePath);
			} 
		}
		return propertiesUtil;
	}
	
	
	/**
	 * 根据对应键获取对应值
	 * @param key
	 * @param defaultValue
	 * @return
	 */
	public String getProValue(String key,String defaultValue)
	{
		String value = (String)properties.get(key);
		if(value == null)
		{
			value = defaultValue;
		}
		return value;
	}
	public String getProValue(String key){
		return getProValue(key, null);
	}
}
