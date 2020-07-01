<%@ page import="org.bloodmoon.dao.OpinionDao" %>
<%@ page import="org.bloodmoon.model.Opinion" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/4/14
  Time: 19:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link type="text/css" rel="styleSheet"  href="css/user.css" />
    <title>后台管理系统</title>
    <style>
        #tabs1{
            width: 100%;
            height: auto;
            background: white;
            position: absolute;
            top: 256px;
        }
        .getreview{
            width: 1440px;
            height:auto;
            position: relative;
            top: 35px;
        }
        .comment{
            height: 80px;
            margin: 45px;
        }
        #bottom {
            width: 100%;
            height: 446px;
            background: #1f2024;
            position: absolute;
            margin-top: 125px;
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

<div id="tabs1">
    <div class="getreview"></div>
    <a style="position: absolute;top: -50px;left: 355px;font-size: 30px;">意见收集箱：</a>
    <center>
        <table style="width:1160px; height:60px; cellpadding:0; cellspacing:0; border:0;">
        <tr>
            <td>
                <%
                    OpinionDao opinionDao = new OpinionDao();
                    ArrayList<Opinion> list = opinionDao.getAllOpinion();
                    if(list != null&&list.size()>0){
                        for(int i=0;i<list.size();i++){
                            Opinion opinion = list.get(i);
                %>
                <div class="comment">
                    <dl><dd style="position: relative;font-size: 17px;">ID:<%=opinion.getUid()%></dd>
                        <dd style="position: relative;font-size: 20px;font-weight: 600;"><%=opinion.getName()%></dd>
                        <dd style="position: relative;font-size: 20px; top: 6px;"><%=opinion.getContext()%></dd>
                        <dd style="position: relative;font-size: 17px;top: 15px;">时间:<%=opinion.getTime()%></dd>
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
