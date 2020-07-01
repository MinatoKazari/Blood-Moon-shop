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
import java.sql.Statement;

import static java.lang.System.out;

@WebServlet(name = "UpdateAdminpwdServlet")
public class UpdateAdminpwdServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        out.println("doPost");
        Connection conn=null;
        Statement stmt=null;
        String password = req.getParameter("password");
        HttpSession session = req.getSession();
        try{
            DbUtil db=new DbUtil();
            conn= db.getCon();
            String sql = "update rootinformation set rootpsw='"+password+"' where rootID='"+session.getAttribute("RootID")+"'";
            stmt=conn.createStatement();
            stmt.executeUpdate(sql);
            out.println("修改密码成功！");
            session.setAttribute("msg", "密码已更改！");
            resp.sendRedirect("root.jsp");
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
