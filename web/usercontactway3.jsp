<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="org.bloodmoon.utils.DbUtil" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/4/12
  Time: 15:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String uid = request.getParameter("uid");
    Connection conn=null;
    Statement sql=null;
    ResultSet rs=null;
    DbUtil db=new DbUtil();
    conn=db.getCon();
    sql=conn.createStatement();//实例化Statement对象
    rs = sql.executeQuery("SELECT * FROM userinformation where uid ='"+uid+"'");
    try{
%>
<html>
<head>
    <title>买家联系方式</title>
    <style>
        .userinfo{
            width: 1000px;
            height: auto;
            background: #94d8b2;
            position: absolute;
            left: 25%;
            top: 17%;
        }
        .userinfo dd{
            margin: 12px;
            font-size: 20px;
        }
        .btn{
            width: 145px;
            height: 45px;
            border: 1px solid #fff;
            border-radius: 3rem;
            background: cadetblue;
            box-shadow: 0 0 8px rgb(243, 240, 254);
            cursor: pointer;
            font-size: 22px;
            color: #fff;
            margin-top: 25px;
            font-family: "neo";
            transition: .25s;
            position: relative;
            top: 14px;
            left: 41%;
        }
    </style>
</head>
<body>
<div class="userinfo">
    <dl>
        <dt><a>
                <% while (rs.next()) { %>
        <dd><img src="img/userimg/<%=rs.getString(9)%>" width="150" height="150"></dd></a></dt>
        <dd>用户ID：<%out.print(rs.getString(1));%><br></dd>
        <dd>用户名：<%out.print(rs.getString(2));%><br></dd>
        <dd>真名：<%out.print(rs.getString(4));%><br></dd>
        <dd>性别：<%out.print(rs.getString(6));%><br></dd>
        <dd>联系电话：<%out.print(rs.getString(7));%><br></dd>
        <dd>电子邮件：<%out.print(rs.getString(8));%><br></dd>
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
