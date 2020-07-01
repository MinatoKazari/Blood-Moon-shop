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
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import static java.lang.System.out;

@WebServlet(name = "ReceivinggoodsServlet")
public class ReceivinggoodsServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        out.println("doPost");
        String ugoid = req.getParameter("ugoid");
        req.setCharacterEncoding("utf-8");
        String sql = "update usergoodorder set ugoState='交易完成' where ugoid='" + ugoid + "'";
        Connection conn =null;
        Statement stmt=null;
        try {
            DbUtil db=new DbUtil();
            conn=db.getCon();
            //创建语句对象Statement
            stmt = conn.createStatement();
            stmt.executeUpdate(sql);
            out.println("收货成功");
            HttpSession session=req.getSession();
            session.setAttribute("msg", "收货成功！");
            resp.sendRedirect("userReceivinggoods.jsp");
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
