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

@WebServlet(name = "UpdateiteminfoServlet")
public class UpdateiteminfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        out.println("doPost");
        String sid = req.getParameter("sid");
        String sname = req.getParameter("sname");
        String slevel = req.getParameter("slevel");
        String sremark = req.getParameter("sremark");
        String sort1 = req.getParameter("sort1");
        String slocationf = req.getParameter("slocationf");
        String slocations = req.getParameter("slocations");
        String slocationt = req.getParameter("slocationt");
        String type = req.getParameter("type");
        req.setCharacterEncoding("utf-8");
        String sql = "update shopinformation set sName='" + sname + "',sLevel='"+slevel+"',sRemark='"+sremark+"'," +
                "sSort1='"+sort1+"',sLocationF='"+slocationf+"',sLocationS='"+slocations+"',sLocationT='"+slocationt+"',sTransaction='"+type+"',sDisplay='待审核' where sid='" + sid + "'";
        Connection conn=null;
        Statement stmt=null;
        try {
            DbUtil db=new DbUtil();
            conn=db.getCon();
            //创建语句对象Statement
            stmt = conn.createStatement();
            stmt.executeUpdate(sql);
            out.println("修改商品信息成功");
            HttpSession session=req.getSession();
            session.setAttribute("msg", "修改商品信息成功！");
            resp.sendRedirect("useriteminfo.jsp?sid="+sid);
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

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
