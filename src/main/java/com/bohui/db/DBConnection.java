package com.bohui.db;

import java.sql.Connection;

/**
 * 连接接口
 * @author liyangli
 *
 */
public interface DBConnection {

	Connection getConnection() throws Exception;
}
