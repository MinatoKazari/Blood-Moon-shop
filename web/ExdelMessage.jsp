<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="org.bloodmoon.utils.DbUtil" %>

<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/4/13
  Time: 17:50
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
        String smid = request.getParameter("smid");
        request.setCharacterEncoding("utf-8");
        String sql = "delete from shopmessage where smid='"+smid+"'";
        Connection conn=null;
        Statement stmt=null;
        try {
            DbUtil db=new DbUtil();
            conn=db.getCon();
            //创建语句对象Statement
            stmt = conn.createStatement();
            stmt.executeUpdate(sql);
            System.out.println("移除留言成功！");
            session.setAttribute("msg","移除留言成功！");
            response.sendRedirect("user.jsp");
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
    %>
</body>
</html>
