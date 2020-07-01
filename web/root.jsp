<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="org.bloodmoon.dao.ItemDao" %>
<%@ page import="org.bloodmoon.model.Item" %>
<%@ page import="java.util.ArrayList" %>

<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/12/31
  Time: 0:11
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
    <title>后台管理系统</title>
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
    var sUname = <%=session.getAttribute("RootID")%>
    if (sUname==null)
    {
        alert("您还没有登录，请登录...");
        window.document.location.href = "loginGLY.jsp";
    }
</script>
<div id="index-header" >
    <div id="logo"><a href="GLYindex.jsp">BLOOD MOON</a></div>
    <div id="uname"><a>管理员:<%=session.getAttribute("RootID") %></a></div>
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
<%
    String userName = request.getParameter("name");    //数据库账户名
    String userPasswd = request.getParameter("password");    //数据库密码
    String schemaName = "2nds";    //数据库名
    Class.forName("com.mysql.jdbc.Driver");//加载mysql驱动
    Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/2nds", "root", "mysql");//localhost是本机地址，3306是端口号，最后是用户名和密码
    Statement sql=conn.createStatement();//实例化Statement对象
    ResultSet rs = sql.executeQuery("SELECT * FROM userinformation where username ='"+session.getAttribute("Username")+"'");
    while (rs.next()){
        String u = rs.getString(1);
        session.setAttribute("uid",u);
    }
    rs.close();
    sql.close();
    conn.close();
%>
<div id="tabs1">
    <a style="position: absolute;top: -50px;left: 355px;font-size: 30px;">待审核的商品：</a>
    <center>
        <table width="1220" height="60" cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td>
                    <%
                        ItemDao itemDao = new ItemDao();
                        ArrayList<Item> list = itemDao.getAllneedpassItem();
                        if(list != null&&list.size()>0){
                            for(int i=0;i<list.size();i++){
                                Item item = list.get(i);
                    %>
                    <div id="item">
                        <dl>
                            <dt>
                                <a href="GLYcheckiteminfo.jsp?sid=<%=item.getSid()%>"><img src="img/shopimage/<%=item.getSImage1()%>" width="200" height="200"></a>
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
