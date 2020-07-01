package org.bloodmoon.dao;

import org.bloodmoon.model.Favor;
import org.bloodmoon.model.Order;
import org.bloodmoon.utils.DbUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class FavorDao {
    //获取用户收藏夹信息
    public ArrayList<Favor> getUserFavor(int uid){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Favor> list = new ArrayList<>();

        try {
            DbUtil db=new DbUtil();
            conn=db.getCon();
            String sql = "SELECT * FROM userfavourite where ufUid=? order by modified desc";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,uid);
            rs = stmt.executeQuery();
            while (rs.next()){
                Favor favor = new Favor();

                favor.setUfid(rs.getInt("ufid"));
                favor.setUfSid(rs.getInt("ufSid"));
                favor.setUfSimg(rs.getString("ufSimg"));
                favor.setUfSname(rs.getString("ufSname"));
                favor.setUfSlevel(rs.getInt("ufSlevel"));
                favor.setUfSprice(rs.getInt("ufSprice"));
                favor.setUfUid(rs.getInt("ufUid"));
                favor.setModified(rs.getString("modified"));
                list.add(favor);
            }
            return list;

        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
        finally {
            if(conn!=null){
                try{
                    conn.close();
                    conn = null;
                }catch (Exception ex){
                    ex.printStackTrace();
                }
            }
            if(rs!=null){
                try{
                    rs.close();
                    rs = null;
                }catch (Exception ex){
                    ex.printStackTrace();
                }
            }
            if(stmt!=null){
                try{
                    stmt.close();
                    stmt=null;
                }catch (Exception ex){
                    ex.printStackTrace();
                }
            }
        }
    }
}
