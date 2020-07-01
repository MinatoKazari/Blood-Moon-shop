<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/4/11
  Time: 16:54
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
    String sql = "delete from shopinformation where sid='"+sid+"'";
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=null;
    Statement stmt=null;
    try {
        conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/2nds","root","mysql");
        //创建语句对象Statement
        stmt = conn.createStatement();
        stmt.executeUpdate(sql);
        System.out.println("删除商品成功！");
        session.setAttribute("msg","下架商品成功");
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
