<%@ page import="java.sql.*" %>
<%@ page import="static java.lang.System.out" %>
<%@ page import="org.bloodmoon.utils.DbUtil" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/12/31
  Time: 0:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        request.setCharacterEncoding("utf-8");
        String username = request.getParameter("username");
        String code = request.getParameter("code");
        request.setCharacterEncoding("utf-8");
    %>
    <%
        Connection conn=null;
        Statement sql=null;
        ResultSet rs=null;
        DbUtil db=new DbUtil();
        conn=db.getCon();
        sql=conn.createStatement();//实例化Statement对象
        rs = sql.executeQuery("select count(*) from userinformation where username = '"+username+"'");
        try {
            while (rs.next()) {
                int count = rs.getInt(1);
                if (count == 0) {
                    System.out.println("该用户名不存在");
                    response.sendRedirect("foundpwd.jsp?error=f1");
                }
            }
            rs.close();
            sql.close();
            conn.close();
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
            if(sql!=null){
                try {
                    sql.close();
                    sql=null;
                }catch (Exception ex){
                    ex.printStackTrace();
                }
            }
            if(rs!=null){
                try {
                    rs.close();
                    rs=null;
                }catch (Exception ex){
                    ex.printStackTrace();
                }
            }
        }
    %>
    <%
        Connection conn2=null;
        Statement sql2=null;
        ResultSet rs2=null;
        conn2=db.getCon();
        sql2=conn2.createStatement();//实例化Statement对象
        rs2 = sql2.executeQuery("select fpwdcode,password from userinformation where username = '"+username+"'");
        try {
            while (rs2.next()) {
                String fcode = rs2.getString(1);
                String pwd = rs2.getString(2);
                if (code.equals(fcode)) {
                    System.out.println(pwd);
                    request.setAttribute("pwd", pwd);
                    request.getRequestDispatcher("foundpwd.jsp?error=f3").forward(request, response);
                } else {
                    System.out.println("安全码错误！");
                    response.sendRedirect("foundpwd.jsp?error=f2");
                }
            }
            rs2.close();
            sql2.close();
            conn2.close();
        }catch (Exception ex){
            ex.printStackTrace();
        }finally {
            if (conn2!=null){
                try {
                    conn2.close();
                    conn2=null;
                }catch (Exception ex){
                    ex.printStackTrace();
                }
            }
            if(sql2!=null){
                try {
                    sql2.close();
                    sql2=null;
                }catch (Exception ex){
                    ex.printStackTrace();
                }
            }
            if(rs2!=null){
                try {
                    rs2.close();
                    rs2=null;
                }catch (Exception ex){
                    ex.printStackTrace();
                }
            }
        }
    %>
</body>
</html>
