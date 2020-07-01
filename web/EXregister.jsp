<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="org.bloodmoon.utils.DbUtil" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/3/17
  Time: 16:17
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
    String username = request.getParameter("name");
    String password = request.getParameter("password");
    String repassword = request.getParameter("replypasswd");
    String realname = request.getParameter("realname");
    String age = request.getParameter("age");
    String sex = request.getParameter("sex");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
    String createtime = df.format(new java.util.Date());
    String question = request.getParameter("question");
    request.setCharacterEncoding("utf-8");
%>
<!--检测用户名是否已被注册使用-->
<%
    Connection conn2=null;
    Statement sql2=null;
    ResultSet rs2=null;
    DbUtil db=new DbUtil();
    conn2=db.getCon();
    sql2=conn2.createStatement();//实例化Statement对象
    rs2 = sql2.executeQuery("select count(*) from userinformation where username = '"+username+"'");
    try {
        while (rs2.next()) {
            int count = rs2.getInt(1);
            if (count >= 1) {
                System.out.println("该用户名已存在");
                response.sendRedirect("register.jsp?error=yes");
                return;
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

<%
    Connection conn=null;
    Statement stmt=null;
    String sql = "insert into userinformation(username,password,realname,age,sex,phone,email,createtime,fpwdcode,avatar,LocationA,LocationB,LocationC,LocationD) VALUES ('"+username+"','"+password+"','"+realname+"','"+age+"','"+sex+"','"+phone+"','"+email+"','"+createtime+"','"+question+"','static.jpg','','','','(未填写)')";
    conn=db.getCon();
    try{
    //创建语句对象Statement
    stmt=conn.createStatement();
    stmt.executeUpdate(sql);
    } catch(SQLException e){
    e.printStackTrace();
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
<script type="text/javascript" language="javascript">
    alert("注册成功");
    window.document.location.href = "login.jsp";
</script>
</body>
</html>
