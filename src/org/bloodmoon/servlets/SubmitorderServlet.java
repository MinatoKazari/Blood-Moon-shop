package org.bloodmoon.servlets;

import org.bloodmoon.utils.DbUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import static java.lang.System.out;

@WebServlet(name = "SubmitorderServlet")
public class SubmitorderServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        out.println("doPost");
        HttpSession session = req.getSession();
        Integer sid = (Integer)session.getAttribute("sid");
        String uidb = req.getParameter("uidb");
        String uids = req.getParameter("uids");
        String sName = req.getParameter("sName");
        String sPrice = req.getParameter("sPrice");
        String address = req.getParameter("address");
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式W
        String createtime = df.format(new java.util.Date());
        req.setCharacterEncoding("utf-8");
        String sql = "insert into usergoodorder(ugosid,ugoUidb,ugoUids,ugoSname,ugoPrices,ugoAddress,ugodealinfo,ugoState,createtime) " +
                "VALUES ('"+sid+"','"+uidb+"','"+uids+"','"+sName+"','"+sPrice+"','"+address+"','(请卖家填写物流信息)','付款完成','"+createtime+"')";
        Connection conn=null;
        Statement stmt=null;
        try{
            DbUtil db=new DbUtil();
            conn= db.getCon();
            //创建语句对象Statement
            stmt = conn.createStatement();
            stmt.executeUpdate(sql);
            out.println("提交购物订单成功");
            //HttpSession session=req.getSession();
            //session.setAttribute("msg", "付款成功！");
            //resp.sendRedirect("userorderlist.jsp");
            conn.close();
            stmt.close();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if (conn!=null){
                try {
                    conn.close();
                }catch (Exception ex){
                    ex.printStackTrace();
                }
            }
            if(stmt!=null){
                try {
                    conn.close();
                }catch (Exception ex){
                    ex.printStackTrace();
                }
            }
        }

        String sql2 = "update shopinformation set sDisplay='已出售' where sid='"+sid+"'";
        try{
            DbUtil db=new DbUtil();
            conn= db.getCon();
            //创建语句对象Statement
            stmt = conn.createStatement();
            stmt.executeUpdate(sql2);
            out.println("商品状态修改为：已出售");
            session.setAttribute("msg", "付款成功！");
            resp.sendRedirect("userorderlist.jsp");
            conn.close();
            stmt.close();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if (conn!=null){
                try {
                    conn.close();
                    conn=null;
                }catch (Exception ex){
                    ex.printStackTrace();
                }
            }
            if(stmt!=null){
                try {
                    stmt.close();
                    stmt=null;
                }catch (Exception ex){
                    ex.printStackTrace();
                }
            }
        }
    }
}
