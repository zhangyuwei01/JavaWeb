package com.zyw.util;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.commons.dbcp.BasicDataSourceFactory;

public class DbConnection {
	private static BasicDataSource dataSource=null;
	/**
     * 初始化数据库连接池
     */
	public static void init(){
		if (dataSource != null)
        {
            try
            {
                dataSource.close();
            } catch (Exception e)
            {
                e.printStackTrace();
            }
            dataSource = null;
        }
        //使用Properties对象定义数据库连接池信息
        try {
            Properties p = new Properties();
            p.setProperty("driverClassName", "com.mysql.jdbc.Driver");
            p.setProperty("url", "jdbc:mysql://localhost:3306/usersdb?useUnicode=true&characterEncoding=UTF-8");
            p.setProperty("username", "root");
            p.setProperty("password", "123456");
            p.setProperty("maxActive", "200");
            p.setProperty("maxIdle", "200");
            p.setProperty("maxWait", "5000");
           //以指定信息创建数据源
            dataSource = (BasicDataSource) BasicDataSourceFactory.createDataSource(p);
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	/**
     * 从连接池中获取连接
     * @return
     * @throws SQLException
     */
    public static synchronized Connection getConnection() throws  SQLException {
        if (dataSource == null) {
            init();
        }
        Connection conn = null;
        if (dataSource != null) {
            conn = dataSource.getConnection();
        }
        return conn;
    }
}
