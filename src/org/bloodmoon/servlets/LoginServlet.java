package org.bloodmoon.servlets;

import org.bloodmoon.dao.UserDao;
import org.bloodmoon.model.User;
import org.bloodmoon.utils.DbUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;

import static java.lang.System.out;

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        out.println("doPost");
        //1 请求数据 request
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String username=request.getParameter("username");
        String password=request.getParameter("password");

        //2 逻辑处理
        try {
            DbUtil db=new DbUtil();
            Connection con=db.getCon();
            UserDao dao=new UserDao();
            User user=dao.Login(con, new User(username,password));

            if(user!=null) {//登录成功
                out.println("登录成功");
                request.setCharacterEncoding("utf-8");
                response.setContentType("text/html;charset=utf-8");
                HttpSession session=request.getSession();
                session.setAttribute("Username",username);
                response.sendRedirect("index.jsp");
                //3 结果响应 response
                db.closeCon(con);
            }else {//登录失败
                out.println("登录失败");
                //3 结果响应 response
                response.sendRedirect("login.jsp?error=yes");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
