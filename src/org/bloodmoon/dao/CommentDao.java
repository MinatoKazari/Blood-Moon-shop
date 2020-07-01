package org.bloodmoon.dao;

import org.bloodmoon.model.Comment;
import org.bloodmoon.utils.DbUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CommentDao {
    //根据商品ID获取商品详情下的评论
    public ArrayList<Comment> getItemComment(int sid){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Comment> list = new ArrayList<>();

        try {
            DbUtil db=new DbUtil();
            conn=db.getCon();
            String sql = "SELECT * FROM shopmessage where smSid=? order by modified desc";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,sid);
            rs = stmt.executeQuery();
            while (rs.next()){
                Comment comment = new Comment();
                comment.setSmid(rs.getInt("smid"));
                comment.setSmUid(rs.getInt("smUid"));
                comment.setSmSid(rs.getInt("smSid"));
                comment.setSmUname(rs.getString("smUname"));
                comment.setSmContext(rs.getString("smContext"));
                comment.setModified(rs.getString("modified"));
                list.add(comment);
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
