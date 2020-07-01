<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/12/31
  Time: 0:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script language="javascript">
    function on_submit()
    {
        if (form1.username.value == "")
        {
            alert("用户名不能为空！");
            form1.username.focus();
            return false;
        }
        if (form1.code.value == "")
        {
            alert("请输入安全码！");
            form1.code.focus();
            return false;
        }
    }
</script>
<html>
<head>
    <title>忘记密码</title>
    <style>
        #window{
            width: 931px;
            height: 250px;
            position: absolute;
            top: 200px;
            left: 480px;
            margin: 20px;
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
        #btn1{
            width: 100px;
            height: 40px;
            border: 1px solid #fff;
            border-radius: 1rem;
            background: #5aa1a1;
            box-shadow: 0 0 8px rgb(243, 240, 254);
            cursor: pointer;
            font-size: 22px;
            color: #fff;
            margin-top: 25px;
            font-family: "neo";
            transition: .25s;
            position: absolute;
            top: 45%;
            left: 55%;
        }
        #btn2{
            width: 100px;
            height: 40px;
            border: 1px solid #fff;
            border-radius: 1rem;
            background: #5aa1a1;
            box-shadow: 0 0 8px rgb(243, 240, 254);
            cursor: pointer;
            font-size: 22px;
            color: #fff;
            margin-top: 25px;
            font-family: "neo";
            transition: .25s;
            position: absolute;
            top: 45%;
            left: 39%;
        }
        #form1 dd{
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div id="window">
    <a style="font-size: 35px;position: absolute;top: -52px;left: 38%;">找回密码:</a>
    <form id="form1" action="foundpwd2.jsp" method="post" onSubmit="return on_submit()">
        <center>
        <dd><input type="text" name="username" id="username" placeholder="请输入用户名"onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')" onpaste="value=value(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')" oncontextmenu = "value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')"></dd>
        <dd><input type="text" name="code" id="code" placeholder="请输入安全码"onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9]/g,'')" onpaste="value=value(/[^\a-\z\A-\Z0-95]/g,'')" oncontextmenu = "value=value.replace(/[^\a-\z\A-\Z0-9]/g,'')"></dd>
        <input type="submit" value="提交" id="btn1"><input type="button" value="返回" id="btn2" onclick="back()">
        </center>
    </form>
</div>
</body>
<script>
    function back() {
        window.location.href='login.jsp';
    }
</script>
<script>

    //取出传回来的参数error并与yes比较
    var errori ='<%=request.getParameter("error")%>';
    if(errori=='f1'){
        alert("用户名不存在!");
    }
    if(errori=='f2'){
        alert("安全码错误!");
    }
    if(errori=='f3'){
        var pwd=<%=request.getAttribute("pwd")%>
        alert("密码是："+pwd);
    }
</script>
</html>
