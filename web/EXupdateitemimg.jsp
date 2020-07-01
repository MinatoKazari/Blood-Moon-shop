<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="org.bloodmoon.utils.DbUtil" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/4/11
  Time: 16:30
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
    String sql = "update shopinformation set sImage1='"+request.getAttribute("realFileName")+"',sDisplay='待审核' where sid='"+sid+"'";
    Connection conn=null;
    Statement stmt=null;
    DbUtil db=new DbUtil();
    conn=db.getCon();
    try{
        //创建语句对象Statement
        stmt=conn.createStatement();
        stmt.executeUpdate(sql);
        System.out.println("更新商品图片成功");
        session.setAttribute("msg", "更新商品图片成功！");
        response.sendRedirect("useriteminfo.jsp?sid="+sid);
%>
<%
    }catch(SQLException e){
        out.println("提交失败"+e);
        out.println(e);
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
%>
</body>
</html>
