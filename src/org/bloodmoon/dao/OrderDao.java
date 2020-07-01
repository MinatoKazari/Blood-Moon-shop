package org.bloodmoon.dao;

import org.bloodmoon.model.Order;
import org.bloodmoon.utils.DbUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class OrderDao {
    //获取用户的购买记录信息
    public ArrayList<Order> getUserOrder(int uid){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Order> list = new ArrayList<>();

        try {
            DbUtil db=new DbUtil();
            conn=db.getCon();
            String sql = "SELECT * FROM usergoodorder where ugoUidb=? order by modified desc";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,uid);
            rs = stmt.executeQuery();
            while (rs.next()){
                Order order = new Order();

                order.setUgoid(rs.getInt("ugoid"));
                order.setUgosid(rs.getInt("ugosid"));
                order.setUgoUidb(rs.getInt("ugoUidb"));
                order.setUgoUids(rs.getInt("ugoUids"));
                order.setUgoSname(rs.getString("ugoSname"));
                order.setUgoPrices(rs.getInt("ugoPrices"));
                order.setUgoAddress(rs.getString("ugoAddress"));
                order.setUgodealinfo(rs.getString("ugodealinfo"));
                order.setUgoState(rs.getString("ugoState"));
                order.setCreatetime(rs.getString("createtime"));
                order.setModified(rs.getString("modified"));
                list.add(order);
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

    //获取用户的卖出记录信息
    public ArrayList<Order> getUsersellOrder(int uid){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Order> list = new ArrayList<>();

        try {
            DbUtil db=new DbUtil();
            conn=db.getCon();
            String sql = "SELECT * FROM usergoodorder where ugoUids=? order by modified desc";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,uid);
            rs = stmt.executeQuery();
            while (rs.next()){
                Order order = new Order();

                order.setUgoid(rs.getInt("ugoid"));
                order.setUgosid(rs.getInt("ugosid"));
                order.setUgoUidb(rs.getInt("ugoUidb"));
                order.setUgoUids(rs.getInt("ugoUids"));
                order.setUgoSname(rs.getString("ugoSname"));
                order.setUgoPrices(rs.getInt("ugoPrices"));
                order.setUgoAddress(rs.getString("ugoAddress"));
                order.setUgodealinfo(rs.getString("ugodealinfo"));
                order.setUgoState(rs.getString("ugoState"));
                order.setCreatetime(rs.getString("createtime"));
                order.setModified(rs.getString("modified"));
                list.add(order);
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

    //获取用户的待发货订单信息
    public ArrayList<Order> getUserDelivergoodOrder(int uid){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Order> list = new ArrayList<>();

        try {
            DbUtil db=new DbUtil();
            conn=db.getCon();
            String sql = "SELECT * FROM usergoodorder where ugoUids=? AND ugoState=? order by modified desc";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,uid);
            stmt.setString(2,"付款完成");
            rs = stmt.executeQuery();
            while (rs.next()){
                Order order = new Order();

                order.setUgoid(rs.getInt("ugoid"));
                order.setUgosid(rs.getInt("ugosid"));
                order.setUgoUidb(rs.getInt("ugoUidb"));
                order.setUgoUids(rs.getInt("ugoUids"));
                order.setUgoSname(rs.getString("ugoSname"));
                order.setUgoPrices(rs.getInt("ugoPrices"));
                order.setUgoAddress(rs.getString("ugoAddress"));
                order.setUgodealinfo(rs.getString("ugodealinfo"));
                order.setUgoState(rs.getString("ugoState"));
                order.setCreatetime(rs.getString("createtime"));
                order.setModified(rs.getString("modified"));
                list.add(order);
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

    //获取用户的待发货订单信息
    public ArrayList<Order> getUserReceivingOrder(int uid){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Order> list = new ArrayList<>();

        try {
            DbUtil db=new DbUtil();
            conn=db.getCon();
            String sql = "SELECT * FROM usergoodorder where ugoUidb=? AND ugoState=? order by modified desc";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,uid);
            stmt.setString(2,"已发货");
            rs = stmt.executeQuery();
            while (rs.next()){
                Order order = new Order();

                order.setUgoid(rs.getInt("ugoid"));
                order.setUgosid(rs.getInt("ugosid"));
                order.setUgoUidb(rs.getInt("ugoUidb"));
                order.setUgoUids(rs.getInt("ugoUids"));
                order.setUgoSname(rs.getString("ugoSname"));
                order.setUgoPrices(rs.getInt("ugoPrices"));
                order.setUgoAddress(rs.getString("ugoAddress"));
                order.setUgodealinfo(rs.getString("ugodealinfo"));
                order.setUgoState(rs.getString("ugoState"));
                order.setCreatetime(rs.getString("createtime"));
                order.setModified(rs.getString("modified"));
                list.add(order);
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
