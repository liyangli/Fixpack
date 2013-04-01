package com.bohui.db;
/**
 * 连接工厂类  创建具体连接
 * @author liyangli
 *
 */
public class ConnectionFactory {

	/**
	 * 通过工厂创建具体连接
	 * @param typeEnum
	 * @return
	 */
	public static DBConnection newInstance(DataTypeEnum typeEnum)
	{
		if(typeEnum == DataTypeEnum.MYSQL)
		{
//			return new OracleConnection();
		}
		return new OracleConnection();
	}
	
	public static DBConnection newInstance()
	{
		return newInstance(null);
	}
}
