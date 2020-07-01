<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="org.bloodmoon.utils.DbUtil" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/3/18
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Connection conn=null;
    Statement sql=null;
    ResultSet rs=null;
    DbUtil db=new DbUtil();
    conn=db.getCon();
    sql=conn.createStatement();//实例化Statement对象
    rs = sql.executeQuery("SELECT * FROM userinformation where username ='"+session.getAttribute("Username")+"'");
    try{
%>
<% while (rs.next()) {
 String a = rs.getString(3);
%>
<script language="javascript">
    function on_submit() {
        if (form1.password.value == "") {
            alert("密码不能为空")
            form1.password.focus();
            return false
        }
        if(form1.password.value !="<%=a%>"){
            alert("密码输入错误")
            form1.password.focus();
            return false;
        }
    }
</script>
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
<html>
<head>
    <link type="text/css" rel="styleSheet"  href="css/user.css" />
    <title>用户密码更改</title>
    <style>
        #pwdupdate{
            width: 1300px;
            height: 500px;
            background: ghostwhite;
            position: absolute;
            top: 200px;
            left: 290px;
            margin: 20px;
        }

        #pwdpdate form{
            margin: 20px;
            text-align: center;
        }

        #pwdupdate form dd{
            margin: 15px;
            font-size: 20px;
            text-align: center;
            position: relative;
            top: 140px;
            left: -40px;
        }

        input{
            width: 250px;
            border: 1px solid #ccc;
            padding: 7px 0px;
            border-radius: 3px;
            padding-left:5px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s
        }
        input:focus{
            border-color: #66afe9;
            outline: 0;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)
        }

        #btn{
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
            top: 40%;
            left: 42%;
        }
    </style>
</head>
<body>
<div id="index-header" >
    <div id="logo"><a href="index.jsp">BLOOD MOON</a></div>
    <div id="uname"><a>用户:<%=session.getAttribute("Username") %></a></div>
    <div id="mya"><a href="user.jsp">MyAccount</a> </div>
    <div id="out"><a href="exit.jsp">注销</a> </div>
</div>
<div id="navigation">
    <div id="user-nav">
        <ul>
            <li><a title="个人信息" href="userinfo.jsp">个人信息</a></li>
            <li><a title="修改密码" href="UpdateUserpwd.jsp">修改密码</a></li>
            <li><a title="发布商品" href="userArticleAdd.jsp">发布商品</a></li>
            <li><a title="个人收藏" href="userfavor.jsp">个人收藏</a></li>
            <li><a title="待发货" href="userDelivergoods.jsp">待发货</a></li>
            <li><a title="待收货" href="userReceivinggoods.jsp">待收货</a></li>
            <li><a title="购买记录" href="userorderlist.jsp">购买记录</a></li>
            <li><a title="卖出记录" href="usersellorderlist.jsp">卖出记录</a></li>
            <li><a title="意见反馈" href="useropinion.jsp">意见反馈</a></li>
        </ul>
    </div>
</div>

<div id="pwdupdate">
    <form name="form1" action="UpdateUserpwd2.jsp" method="post" onSubmit="return on_submit()">
       <dd>旧密码：<input type="password" name="password" id="password" maxlength="12" placeholder="密码"></dd>
        <input type="submit" value="提交" id="btn">
    </form>
</div>
</body>
</html>
