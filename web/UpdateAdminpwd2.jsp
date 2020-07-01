<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/3/18
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script language="javascript">
    function on_submit()
    {
        if (form1.password.value == "")
        {
            alert("新密码不能为空，请输入密码！");
            form1.password.focus();
            return false;
        }
        if (form1.password2.value == "")
        {
            alert("确认密码不能为空，请输入密码！");
            form1.password2.focus();
            return false;
        }
        if (form1.password.value != form1.password2.value)
        {
            alert("密码不一致");
            form1.password.focus();
            return false;
        }
    }
</script>
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
            top: 46%;
            left: 43%;
        }
    </style>
</head>
<body>
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

<div id="pwdupdate">
    <form name="form1" action="UpdateAdminpwdServlet" method="post" onSubmit="return on_submit()">
        <dd><input type="password" name="password" id="password" minlength="6" maxlength="12" placeholder="新密码"></dd>
        <dd><input type="password" name="password2" id="password2" placeholder="确认密码"></dd>
        <input type="submit" value="提交" id="btn">
    </form>
</div>

</body>
</html>
