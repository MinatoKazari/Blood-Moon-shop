package org.bloodmoon.dao;

import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.bloodmoon.model.User;
import org.bloodmoon.utils.C3P0Utils;
import java.sql.*;
import org.apache.commons.dbutils.QueryRunner;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
    /**
     * 账号登录处理函数
     *
     * @param con
     * @param user
     * @return
     * @throws Exception
     */
    public User Login(Connection con, User user) throws Exception {
        User resultUser = null;
        //查询数据库
        String sql = "select * from userinformation where username=? and password=?";
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setString(1,user.getUsername());
        pstmt.setString(2,user.getPassword());

        ResultSet rs = pstmt.executeQuery();

        if(rs.next()) {
            resultUser = new User();
            resultUser.setUid(rs.getInt("uid"));
            resultUser.setUsername(rs.getString("username"));
            resultUser.setPassword(rs.getString("password"));
            resultUser.setRealname(rs.getString("realname"));
            resultUser.setAge(rs.getString("age"));
            resultUser.setSex(rs.getString("sex"));
            resultUser.setEmail(rs.getString("email"));
            resultUser.setPhone(rs.getString("phone"));
            resultUser.setTime(rs.getString("modified"));
        }
        return resultUser;
    }

    /*public Long checkUsername(String username) throws SQLException {
        QueryRunner runner = new QueryRunner(C3P0Utils.getDataSource());
        String sql = "select count(*) from userinformation where username = ?";
        Long query = (Long) runner.query(sql, new ScalarHandler(),username);
        return query;
    }*/
}
