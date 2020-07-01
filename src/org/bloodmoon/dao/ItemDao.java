package org.bloodmoon.dao;

import org.bloodmoon.model.Item;
import org.bloodmoon.utils.DbUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ItemDao {
    //获取全部商品
    public ArrayList<Item> getAllItem(){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Item> list = new ArrayList<>();

        try {
            DbUtil db=new DbUtil();
            conn=db.getCon();
            String sql = "select * from shopinformation where sDisplay='通过' order by modified desc";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()){
                Item item = new Item();

                item.setSid(rs.getInt("sid"));
                item.setSName(rs.getString("sName"));
                item.setSLevel(rs.getInt("sLevel"));
                item.setSRemark(rs.getString("sRemark"));
                item.setSPrices(rs.getInt("sPrices"));
                item.setSSort1(rs.getString("sSort1"));
                item.setSLocationF(rs.getString("sLocationF"));
                item.setSLocationS(rs.getString("sLocationS"));
                item.setSLocationT(rs.getString("sLocationT"));
                item.setSDisplay(rs.getString("sDisplay"));
                item.setSTransaction(rs.getString("sTransaction"));
                item.setSUid(rs.getInt("sUid"));
                item.setSUname(rs.getString("sUname"));
                item.setSImage1(rs.getString("sImage1"));
                item.setModified(rs.getString("modified"));
                item.setCreatime(rs.getString("createtime"));

                list.add(item);
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

    //根据商品分类获取商品
    public ArrayList<Item> getSortItem(String sSort1){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Item> list = new ArrayList<>();

        try {
            DbUtil db=new DbUtil();
            conn=db.getCon();
            String sql = "select * from shopinformation where sSort1=? AND sDisplay='通过'order by modified desc";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1,sSort1);
            rs = stmt.executeQuery();
            while (rs.next()){
                Item item = new Item();

                item.setSid(rs.getInt("sid"));
                item.setSName(rs.getString("sName"));
                item.setSLevel(rs.getInt("sLevel"));
                item.setSRemark(rs.getString("sRemark"));
                item.setSPrices(rs.getInt("sPrices"));
                item.setSSort1(rs.getString("sSort1"));
                item.setSLocationF(rs.getString("sLocationF"));
                item.setSLocationS(rs.getString("sLocationS"));
                item.setSLocationT(rs.getString("sLocationT"));
                item.setSDisplay(rs.getString("sDisplay"));
                item.setSTransaction(rs.getString("sTransaction"));
                item.setSUid(rs.getInt("sUid"));
                item.setSUname(rs.getString("sUname"));
                item.setSImage1(rs.getString("sImage1"));
                item.setModified(rs.getString("modified"));
                item.setCreatime(rs.getString("createtime"));

                list.add(item);
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

    //根据商品分类获取商品（价格从低到高展示）
    public ArrayList<Item> getSortItemPricesUp(String sSort1){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Item> list = new ArrayList<>();

        try {
            DbUtil db=new DbUtil();
            conn=db.getCon();
            String sql = "select * from shopinformation where sSort1=? AND sDisplay='通过'order by sPrices";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1,sSort1);
            rs = stmt.executeQuery();
            while (rs.next()){
                Item item = new Item();

                item.setSid(rs.getInt("sid"));
                item.setSName(rs.getString("sName"));
                item.setSLevel(rs.getInt("sLevel"));
                item.setSRemark(rs.getString("sRemark"));
                item.setSPrices(rs.getInt("sPrices"));
                item.setSSort1(rs.getString("sSort1"));
                item.setSLocationF(rs.getString("sLocationF"));
                item.setSLocationS(rs.getString("sLocationS"));
                item.setSLocationT(rs.getString("sLocationT"));
                item.setSDisplay(rs.getString("sDisplay"));
                item.setSTransaction(rs.getString("sTransaction"));
                item.setSUid(rs.getInt("sUid"));
                item.setSUname(rs.getString("sUname"));
                item.setSImage1(rs.getString("sImage1"));
                item.setModified(rs.getString("modified"));
                item.setCreatime(rs.getString("createtime"));

                list.add(item);
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

    //根据商品分类获取商品（价格从高到低展示）
    public ArrayList<Item> getSortItemPricesDown(String sSort1){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Item> list = new ArrayList<>();

        try {
            DbUtil db=new DbUtil();
            conn=db.getCon();
            String sql = "select * from shopinformation where sSort1=? AND sDisplay='通过'order by sPrices desc";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1,sSort1);
            rs = stmt.executeQuery();
            while (rs.next()){
                Item item = new Item();

                item.setSid(rs.getInt("sid"));
                item.setSName(rs.getString("sName"));
                item.setSLevel(rs.getInt("sLevel"));
                item.setSRemark(rs.getString("sRemark"));
                item.setSPrices(rs.getInt("sPrices"));
                item.setSSort1(rs.getString("sSort1"));
                item.setSLocationF(rs.getString("sLocationF"));
                item.setSLocationS(rs.getString("sLocationS"));
                item.setSLocationT(rs.getString("sLocationT"));
                item.setSDisplay(rs.getString("sDisplay"));
                item.setSTransaction(rs.getString("sTransaction"));
                item.setSUid(rs.getInt("sUid"));
                item.setSUname(rs.getString("sUname"));
                item.setSImage1(rs.getString("sImage1"));
                item.setModified(rs.getString("modified"));
                item.setCreatime(rs.getString("createtime"));

                list.add(item);
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

    //根据商品搜索关键词获取商品信息
    public ArrayList<Item> getSearchItem(String keyword){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Item> list = new ArrayList<>();

        try {
            DbUtil db=new DbUtil();
            conn=db.getCon();
            String sql = "select * from shopinformation where sName LIKE ? AND sDisplay='通过'order by modified desc" ;
            stmt = conn.prepareStatement(sql);
            stmt.setString(1,"%"+keyword+"%");
            rs = stmt.executeQuery();
            while (rs.next()){
                Item item = new Item();

                item.setSid(rs.getInt("sid"));
                item.setSName(rs.getString("sName"));
                item.setSLevel(rs.getInt("sLevel"));
                item.setSRemark(rs.getString("sRemark"));
                item.setSPrices(rs.getInt("sPrices"));
                item.setSSort1(rs.getString("sSort1"));
                item.setSLocationF(rs.getString("sLocationF"));
                item.setSLocationS(rs.getString("sLocationS"));
                item.setSLocationT(rs.getString("sLocationT"));
                item.setSDisplay(rs.getString("sDisplay"));
                item.setSTransaction(rs.getString("sTransaction"));
                item.setSUid(rs.getInt("sUid"));
                item.setSUname(rs.getString("sUname"));
                item.setSImage1(rs.getString("sImage1"));
                item.setModified(rs.getString("modified"));
                item.setCreatime(rs.getString("createtime"));

                list.add(item);
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

    //根据商品搜索关键词获取商品信息(价格从低到高排序)
    public ArrayList<Item> getSearchItemPricesUp(String keyword){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Item> list = new ArrayList<>();

        try {
            DbUtil db=new DbUtil();
            conn=db.getCon();
            String sql = "select * from shopinformation where sName LIKE ? AND sDisplay='通过'order by sPrices" ;
            stmt = conn.prepareStatement(sql);
            stmt.setString(1,"%"+keyword+"%");
            rs = stmt.executeQuery();
            while (rs.next()){
                Item item = new Item();

                item.setSid(rs.getInt("sid"));
                item.setSName(rs.getString("sName"));
                item.setSLevel(rs.getInt("sLevel"));
                item.setSRemark(rs.getString("sRemark"));
                item.setSPrices(rs.getInt("sPrices"));
                item.setSSort1(rs.getString("sSort1"));
                item.setSLocationF(rs.getString("sLocationF"));
                item.setSLocationS(rs.getString("sLocationS"));
                item.setSLocationT(rs.getString("sLocationT"));
                item.setSDisplay(rs.getString("sDisplay"));
                item.setSTransaction(rs.getString("sTransaction"));
                item.setSUid(rs.getInt("sUid"));
                item.setSUname(rs.getString("sUname"));
                item.setSImage1(rs.getString("sImage1"));
                item.setModified(rs.getString("modified"));
                item.setCreatime(rs.getString("createtime"));

                list.add(item);
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

    //根据商品搜索关键词获取商品信息(价格从高到低排序)
    public ArrayList<Item> getSearchItemPricesDown(String keyword){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Item> list = new ArrayList<>();

        try {
            DbUtil db=new DbUtil();
            conn=db.getCon();
            String sql = "select * from shopinformation where sName LIKE ? AND sDisplay='通过'order by sPrices desc" ;
            stmt = conn.prepareStatement(sql);
            stmt.setString(1,"%"+keyword+"%");
            rs = stmt.executeQuery();
            while (rs.next()){
                Item item = new Item();

                item.setSid(rs.getInt("sid"));
                item.setSName(rs.getString("sName"));
                item.setSLevel(rs.getInt("sLevel"));
                item.setSRemark(rs.getString("sRemark"));
                item.setSPrices(rs.getInt("sPrices"));
                item.setSSort1(rs.getString("sSort1"));
                item.setSLocationF(rs.getString("sLocationF"));
                item.setSLocationS(rs.getString("sLocationS"));
                item.setSLocationT(rs.getString("sLocationT"));
                item.setSDisplay(rs.getString("sDisplay"));
                item.setSTransaction(rs.getString("sTransaction"));
                item.setSUid(rs.getInt("sUid"));
                item.setSUname(rs.getString("sUname"));
                item.setSImage1(rs.getString("sImage1"));
                item.setModified(rs.getString("modified"));
                item.setCreatime(rs.getString("createtime"));

                list.add(item);
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

    //根据用户名获取商品资料
    public ArrayList<Item> getUserItem(String sUname){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Item> list = new ArrayList<>();

        try {
            DbUtil db=new DbUtil();
            conn=db.getCon();
            String sql = "SELECT * FROM shopinformation where sUname=? order by modified desc";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1,sUname);
            rs = stmt.executeQuery();
            while (rs.next()){
                Item item = new Item();

                item.setSid(rs.getInt("sid"));
                item.setSName(rs.getString("sName"));
                item.setSLevel(rs.getInt("sLevel"));
                item.setSRemark(rs.getString("sRemark"));
                item.setSPrices(rs.getInt("sPrices"));
                item.setSSort1(rs.getString("sSort1"));
                item.setSLocationF(rs.getString("sLocationF"));
                item.setSLocationS(rs.getString("sLocationS"));
                item.setSLocationT(rs.getString("sLocationT"));
                item.setSDisplay(rs.getString("sDisplay"));
                item.setSTransaction(rs.getString("sTransaction"));
                item.setSUid(rs.getInt("sUid"));
                item.setSUname(rs.getString("sUname"));
                item.setSImage1(rs.getString("sImage1"));
                item.setModified(rs.getString("modified"));
                item.setCreatime(rs.getString("createtime"));

                list.add(item);
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

    //根据商品编号获取商品资料
    public Item getItemBySid(int sid){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try{
            DbUtil db=new DbUtil();
            conn=db.getCon();
            String sql = "select * from shopinformation where sid=? ";  //sql语句
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,sid);
            rs = stmt.executeQuery();
            if(rs.next()){
                Item item = new Item();

                item.setSid(rs.getInt("sid"));
                item.setSName(rs.getString("sName"));
                item.setSLevel(rs.getInt("sLevel"));
                item.setSRemark(rs.getString("sRemark"));
                item.setSPrices(rs.getInt("sPrices"));
                item.setSSort1(rs.getString("sSort1"));
                item.setSLocationF(rs.getString("sLocationF"));
                item.setSLocationS(rs.getString("sLocationS"));
                item.setSLocationT(rs.getString("sLocationT"));
                item.setSDisplay(rs.getString("sDisplay"));
                item.setSTransaction(rs.getString("sTransaction"));
                item.setSUid(rs.getInt("sUid"));
                item.setSUname(rs.getString("sUname"));
                item.setSImage1(rs.getString("sImage1"));
                item.setModified(rs.getString("modified"));
                item.setCreatime(rs.getString("createtime"));

                return item;
            }else{
                return null;
            }

        }catch(Exception ex){
            ex.printStackTrace();
            return null;
        }finally{
            //释放数据集对象
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
                }catch(Exception ex){
                    ex.printStackTrace();
                }
            }
            //释放语句对象
            if(stmt!=null){
                try{
                    stmt.close();
                    stmt=null;
                }catch(Exception ex){
                    ex.printStackTrace();
                }
            }
        }
    }

    //获取最近浏览的前五条商品信息
    public ArrayList<Item> getViewList(String list)
    {
        System.out.println("商品ID浏览记录list:"+list);//输出list内容
        ArrayList<Item> itemlist = new ArrayList<Item>();
        int iCount=5; //每次返回前五条记录
        if(list!=null&&list.length()>0)
        {
            String[] arr = list.split("#");
             System.out.println("arr.length="+arr.length);//输出已记录数量
            //如果商品记录大于等于5条
            if(arr.length>=5)
            {
                for(int i=arr.length-2;i>=arr.length-iCount-1;i--)
                {
                    //System.out.println("商品id："+Integer.parseInt(arr[i]));
                    itemlist.add(getItemBySid(Integer.parseInt(arr[i])));
                }
            }
            else
            {
                for(int i=arr.length-2;i>=0;i--)
                {
                    //System.out.println("商品id："+Integer.parseInt(arr[i]));
                    itemlist.add(getItemBySid(Integer.parseInt(arr[i])));
                }
            }
            return itemlist;
        }
        else
        {
            return null;
        }

    }


    //获取全部待审核状态的商品
    public ArrayList<Item> getAllneedpassItem(){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Item> list = new ArrayList<>();

        try {
            DbUtil db=new DbUtil();
            conn=db.getCon();
            String sql = "select * from shopinformation where sDisplay='待审核'";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()){
                Item item = new Item();

                item.setSid(rs.getInt("sid"));
                item.setSName(rs.getString("sName"));
                item.setSLevel(rs.getInt("sLevel"));
                item.setSRemark(rs.getString("sRemark"));
                item.setSPrices(rs.getInt("sPrices"));
                item.setSSort1(rs.getString("sSort1"));
                item.setSLocationF(rs.getString("sLocationF"));
                item.setSLocationS(rs.getString("sLocationS"));
                item.setSLocationT(rs.getString("sLocationT"));
                item.setSDisplay(rs.getString("sDisplay"));
                item.setSTransaction(rs.getString("sTransaction"));
                item.setSUid(rs.getInt("sUid"));
                item.setSUname(rs.getString("sUname"));
                item.setSImage1(rs.getString("sImage1"));
                item.setModified(rs.getString("modified"));
                item.setCreatime(rs.getString("createtime"));

                list.add(item);
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
