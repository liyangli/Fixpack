package com.bohui.resource;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 解析属性值
 * @author liyangli
 * @date 2013-3-1 
 */
public class PropertiesResource {

    private static final Map<String,PropertiesResource> resources = new HashMap<String, PropertiesResource>();


	private static Logger log = LoggerFactory.getLogger(PropertiesResource.class);
	private static PropertiesResource propertiesUtil = null;
	private static Properties properties = null;
	private static String fileName = "jdbc.properties";
	
	private PropertiesResource(String fileName)
	{
		properties = new Properties();
		try {

			properties.load(new FileInputStream(PropertiesResource.class.getResource("/").getPath()+fileName));
		} catch (FileNotFoundException e) {
			log.error("文件没有发现",e);
		} catch (IOException e) {
			log.error("文件解析出现错误",e);
		}
        resources.put(fileName,this);
	}
	
	public synchronized static PropertiesResource newInstance(){
		return newInstance(fileName);
	}
	
	public synchronized static PropertiesResource newInstance(String fileName){
        PropertiesResource resource = resources.get(fileName);
        if(resource == null){
            return new PropertiesResource(fileName);
        }
		return resource;
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

    /**
     * 设定对应属性值
     * @param key
     * @param value
     */
    public void setProValue(String key,String value){
        properties.setProperty(key,value);
    }
}
