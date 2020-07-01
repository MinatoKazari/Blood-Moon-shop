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

@WebServlet(name = "NotpassitemServlet")
public class NotpassitemServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        out.println("doPost");
        String sid = req.getParameter("sid");
        String context = req.getParameter("context");
        String context2 = "审核不通过原因："+context;
        req.setCharacterEncoding("utf-8");
        String sql = "update shopinformation set sDisplay = '不通过',sRemark='"+context2+"'where sid='" + sid + "'";
        Connection conn=null;
        Statement stmt=null;
        try {
            DbUtil db=new DbUtil();
            conn= db.getCon();
            //创建语句对象Statement
            stmt = conn.createStatement();
            stmt.executeUpdate(sql);
            out.println("取消展示成功");
            HttpSession session=req.getSession();
            session.setAttribute("msg", "修改商品信息成功！");
            resp.sendRedirect("GLYindex.jsp");
        }catch (Exception ex){
            ex.printStackTrace();
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
