<%@ page import="org.bloodmoon.dao.ItemDao" %>
<%@ page import="org.bloodmoon.model.Item" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.bloodmoon.utils.DbUtil" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/12/31
  Time: 0:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link type="text/css" rel="styleSheet"  href="css/user.css" />
    <%
        Object message = session.getAttribute("msg");
        if(message!=null&&!"".equals(message)){
    %>
    <script type="text/javascript">
        alert("<%=message%>")
    </script>
    <%session.setAttribute("msg","");
    }%>
    <title>用户中心</title>
    <style>
        #tabs1{
            width: 100%;
            height: auto;
            background: white;
            position: absolute;
            top: 256px;
        }
        #item {
            float: left;
            margin: 18px;
            background: lightgray;
        }
        #dd_name {
            color: #fa6d1d;
            font-size: 18px;
            max-width: 200px;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            white-space: nowrap;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
        }
        #dd_level {
            font-size: 16px;
            color: black;
        }
        #dd_price {
            font-size: 16px;
            color: black;
        }
        #bottom {
            width: 100%;
            height: 446px;
            background: #1f2024;
            position: absolute;
            margin-top: 300px;
        }
        #bottomimg {
            width: 100%;
            height: 446px;
            text-align: center;
            margin-top: -1px;
        }
    </style>
</head>
<body>
<script type="text/javascript" language="javascript">
    var sUname = <%=session.getAttribute("Username")%>
        if (sUname==null)
        {
            alert("您还没有登录，请登录...");
            window.document.location.href = "login.jsp";
        }
</script>

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
<%
    Connection conn = null;
    Statement sql = null;
    ResultSet rs =null;
    try {
        DbUtil db=new DbUtil();
        conn=db.getCon();
        sql = conn.createStatement();//实例化Statement对象
        rs = sql.executeQuery("SELECT * FROM userinformation where username ='" + session.getAttribute("Username") + "'");
        while (rs.next()) {
            String u = rs.getString(1);
            session.setAttribute("uid", u);
        }
        rs.close();
        sql.close();
        conn.close();
    }catch (SQLException e){
        e.printStackTrace();
    }finally {
        if(conn!=null){
            conn.close();
            conn=null;
        }
        if(sql!=null){
            sql.close();
            sql=null;
        }
        if(rs!=null){
            rs.close();
            rs=null;
        }
    }

%>
<div id="tabs1">
    <a style="position: absolute;top: -50px;left: 355px;font-size: 30px;">用户已发布的商品</a>
    <center>
        <table width="1220" height="60" cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td>
                    <%
                        ItemDao itemDao = new ItemDao();
                        ArrayList<Item> list = itemDao.getUserItem(String.valueOf(session.getAttribute("Username")));
                        if(list != null&&list.size()>0){
                            for(int i=0;i<list.size();i++){
                                Item item = list.get(i);
                    %>
                    <div id="item">
                        <dl>
                            <dt>
                                <a target = "_blank" href="useriteminfo.jsp?sid=<%=item.getSid()%>"><img src="img/shopimage/<%=item.getSImage1()%>" width="200" height="200"></a>
                            </dt>
                            <dd id="dd_name" ><%=item.getSName()%></dd>
                            <dd id="dd_level">新旧程度：<%=item.getSLevel()%></dd>
                            <dd id="dd_price">售价：<%=item.getSPrices()%></dd>
                        </dl>
                    </div>
                    <%
                            }
                        }
                    %>
                </td>
            </tr>
        </table>
    </center>
    <div id="bottom">
        <div id="bottomimg">
            <img src="img/bottompic.png" height="446" width="1202"/>
        </div>
    </div>
</div>

</body>
</html>
