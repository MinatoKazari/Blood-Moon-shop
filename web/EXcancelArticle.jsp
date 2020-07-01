<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="org.bloodmoon.utils.DbUtil" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/4/21
  Time: 14:26
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
    String sid = request.getParameter("sid");
    request.setCharacterEncoding("utf-8");
    String sql = "update shopinformation set sDisplay='待上架' where sid='"+sid+"'";
    Connection conn=null;
    Statement stmt=null;
    try {
        DbUtil db=new DbUtil();
        conn=db.getCon();
        //创建语句对象Statement
        stmt = conn.createStatement();
        stmt.executeUpdate(sql);
        System.out.println("已经取消商品展示！");
        session.setAttribute("msg","已经取消商品展示！");
        response.sendRedirect("useriteminfo.jsp?sid="+sid);
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
