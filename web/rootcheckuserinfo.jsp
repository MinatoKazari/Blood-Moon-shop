<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/12/31
  Time: 0:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script  language="javascript">
    function on_search() {
        if(formsearch.uid.value == ""){
            alert("请输入用户ID！");
            formsearch.uid.focus();
            return false;
        }
    }
</script>

<script  language="javascript">
    function on_search2() {
        if (formsearch2.username.value == "") {
            alert("请输入用户名！");
            formsearch2.username.focus();
            return false;
        }
        var str=formsearch2.username.value;
        if(str.length<4){
            alert("用户名长度太短！");
            formsearch2.username.focus();
            return false;
        }
    }
</script>
<html>
<head>
    <link type="text/css" rel="styleSheet"  href="css/user.css" />
    <title>后台管理系统</title>
    <style>
        .search {
            width: 420px;
            height: 40px;
            border-radius: 18px;
            outline: none;
            border: 1px solid #ccc;
            padding-left: 20px;
            position: relative;
        }
        .btn {
            height: 40px;
            width: 65px;
            position: relative;
            left: 10px;
            padding: 4px 15px;
            font-size: 15px;
            color: #fff;
            border-radius: 4px;
            text-align: center;
            min-width: 60px;
            vertical-align: top;
            cursor: pointer;
            background-color: #00a1d6;
            border: 1px solid #00a1d6;
            transition: .1s;
            user-select: none;
            outline: none;
        }
        .win1{
            width: 100%;
            height: auto;
            background: white;
            position: absolute;
            top: 256px;
        }
        .win2{
            width: 1440px;
            height: 200px;
            position: relative;
            top: 35px;
        }
        .win3{
            width: 1440px;
            height: 200px;
            position: relative;
            top: -74px;
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
<div class="win1">
    <center>
        <div class="win2">
            <form id="formsearch" action="rootcheckuserinfo2.jsp" method="post" class="parent" onsubmit="return on_search()">
                <input type="text" class="search" name="uid" id="uid" minlength="1" maxlength="12" placeholder="根据ID查看用户信息" onkeyup="value=value.replace(/[^0-9]/g,'')" onpaste="value=value(/[^0-9]/g,'')" oncontextmenu = "value=value.replace(/[^0-9]/g,'')">
                <button type="submit" class="btn">搜索</button>
            </form>
        </div>
        <div class="win3">
            <form id="formsearch2" action="rootcheckuserinfo3.jsp" method="post" class="parent" onsubmit="return on_search2()">
                <input type="text" class="search" name="username" id="username" minlength="4" maxlength="20" placeholder="根据用户名查看用户信息"onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')" onpaste="value=value(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')" oncontextmenu = "value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')">
                <button type="submit" class="btn">搜索</button>
            </form>
        </div>
    </center>
    <div id="bottom">
        <div id="bottomimg">
            <img src="img/bottompic.png" height="446" width="1202"/>
        </div>
    </div>
</div>
</body>
</html>
