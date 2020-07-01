package org.bloodmoon.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * 数据库连接工具类
 *
 * @author Jatn
 * @version 1.0
 */
public class DbUtil {

    /**
     * JDBC 驱动名
     */
    private String JDBC_DRIVER = "com.mysql.jdbc.Driver";

    /**
     * 数据库 URL
     */
    private String DB_URL = "jdbc:mysql://localhost:3306/2nds";

    /**
     * 数据库用户名
     */
    private String USER = "root";

    /**
     * 数据库密码
     */
    private String PASS = "mysql";

    /**
     * 连接数据库函数
     *
     * @return
     * @throws Exception
     */
    public Connection getCon() throws Exception {
        //注册JDBC驱动(加载驱动程序)
        Class.forName(JDBC_DRIVER);
        //连接数据库
        Connection con = DriverManager.getConnection(DB_URL, USER, PASS);
        return con;
    }

    /**
     * 关闭数据库连接函数
     *
     * @param con
     * @throws Exception
     */
    public void closeCon(Connection con) throws Exception {
        if(con!=null) {
            con.close();
        }
    }

}
