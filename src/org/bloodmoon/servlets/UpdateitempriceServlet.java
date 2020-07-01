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

@WebServlet(name="UpdateitempriceServlet")
public class UpdateitempriceServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        out.println("doPost");
        String prices = req.getParameter("sprices");
        String sid = req.getParameter("sid");
        req.setCharacterEncoding("utf-8");
        String sql = "update shopinformation set sPrices='" + prices + "' where sid='" + sid + "'";
        Connection conn=null;
        Statement stmt=null;
        try {
            DbUtil db=new DbUtil();
            conn= db.getCon();
            //创建语句对象Statement
            stmt = conn.createStatement();
            stmt.executeUpdate(sql);
            out.println("修改商品价格成功");
            HttpSession session=req.getSession();
            session.setAttribute("msg", "修改价格成功！");
            resp.sendRedirect("useriteminfo.jsp?sid="+sid);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if(conn!=null){
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
