<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="org.bloodmoon.utils.DbUtil" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/3/18
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        Connection conn=null;
        Statement stmt=null;
        request.setCharacterEncoding("utf-8");
        String password = request.getParameter("password");
        request.setCharacterEncoding("utf-8");
        String sql = "update userinformation set password='"+password+"' where username='"+session.getAttribute("Username")+"'";
        DbUtil db=new DbUtil();
        conn=db.getCon();
        try{
            //创建语句对象Statement
            stmt=conn.createStatement();
            stmt.executeUpdate(sql);
            out.println("提交成功");
    %>
    <script type="text/javascript" language="javascript">
        alert("密码已修改");
        window.document.location.href = "user.jsp";
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
