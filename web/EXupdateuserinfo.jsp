<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/3/18
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="static java.awt.SystemColor.window" %>
<%@ page import="org.bloodmoon.utils.DbUtil" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String realname=request.getParameter("realname");
    String age=request.getParameter("age");
    String sex=request.getParameter("sex");
    String phone=request.getParameter("phone");
    String email=request.getParameter("email");
    String locationA=request.getParameter("locationA");
    String locationB=request.getParameter("locationB");
    String locationC=request.getParameter("locationC");
    String locationD=request.getParameter("locationD");
    request.setCharacterEncoding("utf-8");
    String sql = "update userinformation set realname='"+realname+"',age='"+age+"',sex='"+sex+"',phone='"+phone+"',email='"+email+"',LocationA='"+locationA+"',LocationB='"+locationB+"',LocationC='"+locationC+"',LocationD='"+locationD+"' where username='"+session.getAttribute("Username")+"'";
    Connection conn=null;
    Statement stmt=null;
    DbUtil db=new DbUtil();
    conn=db.getCon();
    try{
        //创建语句对象Statement
        stmt=conn.createStatement();
        stmt.executeUpdate(sql);
        out.println("提交成功");
%>
        <script type="text/javascript" language="javascript">
                alert("用户信息已修改");
        window.document.location.href = "userinfo.jsp";
        </script>
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
