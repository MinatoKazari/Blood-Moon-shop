<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/12/30
  Time: 20:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>

<script language="javascript">
    function on_submit()
    {
        if (form1.name.value == "")
        {
            alert("用户名不能为空，请输入用户名！");
            form1.name.focus();
            return false;
        }
        var uname=form1.name.value;
        if (uname.length<4)
        {
            alert("用户名长度至少为4！");
            form1.name.focus();
            return false;
        }
        if (form1.password.value == "")
        {
            alert("用户密码不能为空，请输入密码！");
            form1.password.focus();
            return false;
        }
        if (form1.replypasswd.value == "")
        {
            alert("用户确认密码不能为空，请输入密码！");
            form1.replypasswd.focus();
            return false;
        }
        if (form1.password.value != form1.replypasswd.value)
        {
            alert("密码与确认密码不同");
            form1.password.focus();
            return false;
        }
        var realname=form1.realname.value;
        if(form1.realname.value!==""){
            if (realname.length<2)
            {
                alert("姓名长度至少为2！");
                form1.realname.focus();
                return false;
            }
        }
        if(form1.sex.value !=="")
        {
            if(form1.sex.value !="男")
            {
                if(form1.sex.value !="女") {
                    alert("性别填写有误，请填 男 女");
                    form1.sex.focus();
                    return false;
                }
            }
        }
        if(form1.phone.value == ""){
            alert("电话不能为空")
            form1.phone.focus();
            return false
        }

        if(form1.phone.value.length !=11){
            alert("电话号码输入有误")
            form1.phone.focus();
            return false
        }

        var phone = document.getElementById('phone').value;
        if(!(/^1[3456789]\d{9}$/.test(phone))) {
            alert('请填写正确电话号码!!');
            form1.phone.focus();
            return false;
        }

        if(form1.email.value == ""){
            alert("邮件不能为空")
            form1.email.focus();
            return false
        }
        if(form1.question.value == ""){
            alert("安全码不能为空")
            form1.question.focus();
            return false
        }
        if(confirm('注册后不能更改用户名了！确认要注册吗？')){
            return true;
        }else {
            return false;
        }
    }
</script>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/x-icon" href="#" />
    <link type="text/css" rel="styleSheet"  href="css/register.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户注册</title>
    <style>
    #bg{
    background: linear-gradient(45deg, rgba(0, 255, 255, 0.94), #000099);
    height: 100%;
    }
    </style>
</head>

<body>
<div id="bg">
            <div id="register">
                <div id="status"><b><i>欢迎新用户注册！</i></b></div>
                <div id="check"><span id = "usernameInfo"></span></div>
                <span>
                        <form name="form1" action="EXregister.jsp" method="post"onSubmit="return on_submit()">
                        <p class="form"><input type="text" name="name" id="name" minlength="4" maxlength="12" placeholder="用户名" onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')" onpaste="value=value(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')" oncontextmenu = "value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')"></p>
                        <p class="form"><input type="password" name="password" id="password" minlength="6" maxlength="12" placeholder="密码"></p>
                        <p class="form confirm"><input type="password" name="replypasswd" id="replaypasswd" placeholder="再次确认密码"></p>
                        <p class="form"><input type="text" name="realname" id="realname" minlength="2" maxlength="15" placeholder="真实姓名" onkeyup="value=value.replace(/[^\a-\z\A-\Z\u4E00-\u9FA5]/g,'')" onpaste="value=value(/[^\a-\z\A-\Z\u4E00-\u9FA5]/g,'')" oncontextmenu = "value=value.replace(/[^\a-\z\A-\Z\u4E00-\u9FA5]/g,'')"></p>
                        <p class="form"><input type="number" name="age" id="age" min="16" value="16" max="100" placeholder="年龄"></p>
                        <p class="form"><input type="text" maxlength="1" name="sex" id="sex" placeholder="性别(男、女)" onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,'')" onpaste="value=value(/[^9\u4E00-\u9FA5]/g,'')" oncontextmenu = "value=value.replace(/[^\u4E00-\u9FA5]/g,'')"></p>
                        <p class="form"><input type="tel" maxlength="11" name="phone" id="phone" placeholder="电话号码"onkeyup="value=value.replace(/[^0-9]/g,'')" onpaste="value=value(/[^0-9]/g,'')" oncontextmenu = "value=value.replace(/[^0-9]/g,'')"></p>
                        <p class="form"><input type="email" name="email" id="email" maxlength="25" placeholder="电子邮箱"onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9@.]/g,'')" onpaste="value=value(/[^\a-\z\A-\Z0-9@.]/g,'')" oncontextmenu = "value=value.replace(/[^\a-\z\A-\Z0-9@.]/g,'')"></p>
                        <p class="form"><input type="text" name="question" id="question" maxlength="8" placeholder="找回密码安全码"onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9]/g,'')" onpaste="value=value(/[^\a-\z\A-\Z0-95]/g,'')" oncontextmenu = "value=value.replace(/[^\a-\z\A-\Z0-9]/g,'')"></p>
                        <input type="submit" value="注册" class="btn" id="btn">
                        </form>
                </span>
            </div>
        </div>
    </body>
<script>

    //取出传回来的参数error并与yes比较
    var errori ='<%=request.getParameter("error")%>';
    if(errori=='yes'){
        alert("该用户名已被注册!");
    }
</script>
</html>
