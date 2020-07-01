<%@ page import="org.bloodmoon.dao.ItemDao" %>
<%@ page import="org.bloodmoon.model.Item" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.bloodmoon.dao.FavorDao" %>
<%@ page import="org.bloodmoon.model.Favor" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.bloodmoon.utils.DbUtil" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/12/31
  Time: 0:10
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
    <title>用户收藏夹</title>

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
            margin: 22px;
            background: cadetblue;
            border: 1px solid #ffffff;
            border-radius: 1rem;
            padding: 10px;
        }
        #dd_name {
            color: black;
            font-size: 20px;
            font-weight: 600;
            max-width: 250px;
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
        #time{
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
        .btn{
            border: 1px solid #fff;
            border-radius: 3rem;
            background: repeating-radial-gradient(black, transparent 100px);
            box-shadow: 0 0 8px rgb(243, 240, 254);
            cursor: pointer;
            font-size: 22px;
            color: #fff;
            margin-top: 25px;
            font-family: "neo";
            transition: .25s;
            width: 89px;
            position: relative;
            top: -4px;
            left: 157px;
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
<div id="tabs1">
    <a style="position: absolute;top: -50px;left: 355px;font-size: 30px;">用户收藏</a>
    <center>
        <table width="1280" height="60" cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td>
                    <%
                        FavorDao favorDao = new FavorDao();
                        ArrayList<Favor> list = favorDao.getUserFavor(Integer.parseInt(session.getAttribute("uid").toString()));
                        if(list != null&&list.size()>0){
                            for(int i=0;i<list.size();i++){
                                Favor favor = list.get(i);
                    %>
                    <div id="item">
                        <dl>
                            <dt>
                                <a target = "_blank" href="iteminfo.jsp?sid=<%=favor.getUfSid()%>"><img src="img/shopimage/<%=favor.getUfSimg()%>" width="250" height="250"></a>
                            </dt>
                            <dd id="dd_name" ><%=favor.getUfSname()%></dd>
                            <dd id="dd_level">新旧程度：<%=favor.getUfSlevel()%></dd>
                            <dd id="dd_price">售价：<%=favor.getUfSprice()%></dd>
                            <dd id="time">添加时间：<%=favor.getModified()%></dd>
                            <dd><a href="ExdelFavour.jsp?ufid=<%=favor.getUfid()%>"><input type="button" class="btn" value="移除"></a></dd>
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
