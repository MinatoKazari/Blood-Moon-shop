<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="org.bloodmoon.utils.DbUtil" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/4/12
  Time: 23:51
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
    String ufid = request.getParameter("ufid");
    request.setCharacterEncoding("utf-8");
    String sql = "delete from userfavourite where ufid='"+ufid+"'";
    Connection conn=null;
    Statement stmt=null;
    try {
        DbUtil db=new DbUtil();
        conn=db.getCon();
        //创建语句对象Statement
        stmt = conn.createStatement();
        stmt.executeUpdate(sql);
        System.out.println("移除收藏成功！");
        session.setAttribute("msg","移除收藏成功");
        response.sendRedirect("userfavor.jsp");
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
