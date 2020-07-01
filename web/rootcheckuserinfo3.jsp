<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/12/31
  Time: 0:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.bloodmoon.utils.DbUtil" %>
<%
    String username = request.getParameter("username");
    Connection conn=null;
    Statement sql=null;
    ResultSet rs=null;
    DbUtil db=new DbUtil();
    conn=db.getCon();
    sql=conn.createStatement();//实例化Statement对象
    rs = sql.executeQuery("SELECT * FROM userinformation where username ='"+username+"'");
    try {
%>
<html>
<head>
    <link type="text/css" rel="styleSheet"  href="css/user.css" />
    <title>查看用户信息</title>
    <style>
        #userinfo{
            width: 1300px;
            height: auto;
            background: ghostwhite;
            position: absolute;
            top: 200px;
            left: 290px;
            margin: 20px;
        }
        #userinfo dd{
            margin: 10px;
            font-size: 20px;
        }
        .btn{
            width: 160px;
            height: 40px;
            border: 1px solid #fff;
            border-radius: 3rem;
            background: linear-gradient(90deg,rgba(0, 0, 0, 1),#000000 );
            box-shadow: 0 0 8px rgb(243, 240, 254);
            cursor: pointer;
            font-size: 22px;
            color: #fff;
            margin-top: 25px;
            font-family: "neo";
            transition: .25s;
            position: absolute;
            top: 720px;
            left: 45%;
        }
    </style>
</head>
<body>

<div id="index-header" >
    <div id="logo"><a href="GLYindex.jsp">BLOOD MOON</a></div>
    <div id="uname"><a>用户:<%=session.getAttribute("RootID") %></a></div>
    <div id="mya"><a href="root.jsp">MyAccount</a> </div>
    <div id="out"><a href="exit.jsp">注销</a> </div>
</div>
<div id="navigation">
    <div id="user-nav">
        <ul>
            <li><a title="个人信息" href="rootinfo.jsp">个人信息</a></li>
            <li><a title="更改密码" href="UpdateAdminpwd.jsp">更改密码</a></li>
            <li><a title="查询用户信息" href="rootcheckuserinfo.jsp">查询用户信息</a></li>
            <li><a title="商品审核" href="root.jsp">商品审核</a></li>
            <li><a title="查看反馈意见" href="rootlookopinion.jsp">查看意见反馈</a></li>
        </ul>
    </div>
</div>

<div id="userinfo">
    <dl>
        <dt><a>
    <% while (rs.next()) { %>
        <dd><img src="img/userimg/<%=rs.getString(9)%>" width="150" height="150"></dd></a></dt>
        <dd>用户id：<%out.print(rs.getString(1));%><br></dd>
        <dd>用户名：<%out.print(rs.getString(2));%><br></dd>
        <dd>密码：<%out.print(rs.getString(3));%><br></dd>
        <dd>真名：<%out.print(rs.getString(4));%><br></dd>
        <dd>年龄：<%out.print(rs.getString(5));%><br></dd>
        <dd>性别：<%out.print(rs.getString(6));%><br></dd>
        <dd>联系电话：<%out.print(rs.getString(7));%><br></dd>
        <dd>电子邮件：<%out.print(rs.getString(8));%><br></dd>
        <dd>收货地址：<%out.print(rs.getString(13));%><%out.print(rs.getString(14));%><%out.print(rs.getString(15));%><%out.print(rs.getString(16));%><br></dd>
        <dd>创建帐号时间：<%out.print(rs.getString(10));%><br></dd>
        <dd>最后一次更新时间：<%out.print(rs.getString(11));%><br></dd>
    <% } %>
    <%
        rs.close();
        sql.close();
        conn.close();
        }catch (Exception ex){
        ex.printStackTrace();
        }finally {
            if(rs!=null){
                try{
                    rs.close();
                    rs=null;
                }catch (Exception e){
                    e.printStackTrace();
                }
            }
            if(sql!=null){
                try{
                    sql.close();
                    sql=null;
                }catch (Exception e){
                    e.printStackTrace();
                }
            }
            if(conn!=null){
                try{
                    conn.close();
                    conn=null;
                }catch (Exception e){
                    e.printStackTrace();
                }
            }
        }
    %>
    </dl>
</div>
</body>
</html>
