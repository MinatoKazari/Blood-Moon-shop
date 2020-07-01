<%@ page import="org.bloodmoon.dao.OrderDao" %>
<%@ page import="org.bloodmoon.model.Order" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="org.bloodmoon.utils.DbUtil" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/4/12
  Time: 13:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        Object message = session.getAttribute("msg");
        if(message!=null&&!"".equals(message)){
    %>
    <script type="text/javascript">
        alert("<%=message%>")
    </script>
    <%session.setAttribute("msg","");
    }%>
    <link type="text/css" rel="styleSheet"  href="css/user.css" />
    <title>查看卖出记录</title>
    <style>
        #tabs1{
            width: 100%;
            height: auto;
            background: white;
            position: absolute;
            top: 256px;
        }
        #order{
            height: 250px;
            margin: 20px;
            background: #f1f4fb;
        }
        #bottom {
            width: 100%;
            height: 446px;
            background: #1f2024;
            position: absolute;
            margin-top: 215px;
        }
        #bottomimg {
            width: 100%;
            height: 446px;
            text-align: center;
            margin-top: -1px;
        }
        .btn{
            width: 222px;
            height: 55px;
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
            top: -82px;
            left: 80%;
        }
        .btn2{
            width: 130px;
            height: 55px;
            border: 1px solid #fff;
            border-radius: 3rem;
            background: #5aa1a1;
            box-shadow: 0 0 8px rgb(243, 240, 254);
            cursor: pointer;
            font-size: 22px;
            color: #fff;
            margin-top: 25px;
            font-family: "neo";
            transition: .25s;
            position: relative;
            top: -162px;
            left: 66%;
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

<div id="tabs1">
    <%
        Statement sql=null;
        Connection conn=null;
        ResultSet rs=null;
        try {
            DbUtil db=new DbUtil();
            conn=db.getCon();
            sql = conn.createStatement();//实例化Statement对象
            rs = sql.executeQuery("select COUNT(ugoUids),SUM(ugoPrices) from usergoodorder where ugoUids='" + session.getAttribute("uid") + "' AND ugoState='交易完成'");
            while (rs.next()){ %>

    <a style="position: relative;top: -50px;left: 355px;font-size: 30px;font-weight: 600;color: dodgerblue;">我卖出的 <%out.print(rs.getString(1));%></a><br>
    <%
      if(rs.getString(2)!=null){
    %>
    <a style="position: relative;top: -30px;left: 355px;font-size: 30px;color: grey;">我赚到了 <%out.print(rs.getString(2));%>元</a>
    <%}%>
    <%
            }
            conn.close();
            sql.close();
            rs.close();
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
    <center>
        <table width="1220" height="60" cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td>
                    <%
                        OrderDao orderDao = new OrderDao();
                        ArrayList<Order> list = orderDao.getUsersellOrder(Integer.parseInt(session.getAttribute("uid").toString()));
                        if(list != null&&list.size()>0){
                            for(int i=0;i<list.size();i++){
                                Order order = list.get(i);
                    %>
                    <div id="order">
                        <dl>
                            <dd style="position: relative;font-size: 23px;font-weight: 600;">订单编号：<%=order.getUgoid()%></dd>
                            <dd style="position: relative;font-size: 19px;font-weight: 600;">买家ID：<%=order.getUgoUidb()%></dd>
                            <dd style="position: relative;font-size: 19px;font-weight: 600;">商品名：<%=order.getUgoSname()%></dd>
                            <dd style="position: relative;font-size: 19px;font-weight: 600;">成交价格：<%=order.getUgoPrices()%></dd>
                            <dd style="color: green;font-size: 20px;font-weight: 600;position: relative;">订单状态：<%=order.getUgoState()%></dd>
                            <dd style="position: relative;">购买时间：<%=order.getCreatetime()%></dd>
                            <dd style="position: relative;">更新时间：<%=order.getModified()%></dd>
                            <dd style="position: relative;font-size:22px;font-weight: 400;max-width: 900px;white-space: nowrap;overflow: auto;">收货地址：<%=order.getUgoAddress()%></dd>
                            <dd style="position: relative;font-size:22px;font-weight: 400;max-width: 765px;white-space: nowrap;overflow: auto;">物流信息：<%=order.getUgodealinfo()%></dd>
                            <dd><a target = "_blank" href="usercontactway3.jsp?uid=<%=order.getUgoUidb()%>"><input type="button" class="btn" value="查看买家联系方式"></a></dd>
                            <dd><a target = "_blank" href="checkiteminfo.jsp?sid=<%=order.getUgosid()%>"><input type="button" class="btn2" value="查看商品"></a></dd>
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
