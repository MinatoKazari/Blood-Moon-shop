package org.bloodmoon.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

import static java.lang.System.out;

@WebServlet(name = "GLYLoginServlet")
public class GLYLoginServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        out.println("doPost");
        String id = req.getParameter("rootID");
        String password = req.getParameter("password");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/2nds", "root", "mysql");
            Statement stmt=conn.createStatement();//实例化Statement对象
            String queryNumberSQL="SELECT * from rootinformation where rootID='"+id+"' and rootpsw='"+password+"'";
            ResultSet rs=stmt.executeQuery(queryNumberSQL);//执行数据库查询操作并获取结果集
            boolean flag=false;//初始化flag
            if(rs.next()){//判断结果
                flag=true;
                HttpSession session=req.getSession();
                session.setAttribute("RootID",id);
            }else{
                flag=false;
            }
            if(flag){
                out.println("管理员登录成功");
                resp.sendRedirect("GLYindex.jsp");
            }else {
                out.println("管理员登录失败");
                resp.sendRedirect("loginGLY.jsp?error=yes");

            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
