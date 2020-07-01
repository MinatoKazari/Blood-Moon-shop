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
import java.sql.Statement;

import static java.lang.System.out;

@WebServlet(name = "SubmitopinionServlet")
public class SubmitopinionServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        out.println("doPost");
        HttpSession session = req.getSession();
        String uid = (String) session.getAttribute("uid");
        String name = (String)session.getAttribute("Username");
        String context = req.getParameter("context");
        req.setCharacterEncoding("utf-8");
        String sql ="Insert into useropinion(uid,name,context) VALUES ('"+uid+"','"+name+"','"+context+"')";
        Connection conn=null;
        Statement stmt=null;
        try{
            DbUtil db=new DbUtil();
            conn=db.getCon();
            //创建语句对象Statement
            stmt = conn.createStatement();
            stmt.executeUpdate(sql);
            out.println("反馈意见成功");
            session.setAttribute("msg", "反馈意见成功！");
            resp.sendRedirect("user.jsp");
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
