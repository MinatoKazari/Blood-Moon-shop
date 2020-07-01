package org.bloodmoon.dao;

import org.bloodmoon.model.Opinion;
import org.bloodmoon.utils.DbUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class OpinionDao {
    //获取全部商品
    public ArrayList<Opinion> getAllOpinion(){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Opinion> list = new ArrayList<>();

        try {
            DbUtil db=new DbUtil();
            conn=db.getCon();
            String sql = "select * from useropinion order by modified desc";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()){
                Opinion opinion = new Opinion();

                opinion.setId(rs.getInt("id"));
                opinion.setUid(rs.getInt("uid"));
                opinion.setName(rs.getString("name"));
                opinion.setContext(rs.getString("context"));
                opinion.setTime(rs.getString("modified"));

                list.add(opinion);
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
