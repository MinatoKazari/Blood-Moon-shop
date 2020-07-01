<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/4/9
  Time: 21:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    function on_submit() {
        if(form1.rootID.value==""){
            alert("请输入管理员ID！");
            form1.rootID.focus();
            return false;
        }
        if(form1.password.value==""){
            alert("请输入密码！");
            form1.password.focus();
            return false;
        }
    }
</script>
<html>
<head>
    <title>后台登录</title>
    <link type="text/css" rel="styleSheet"  href="css/login.css" />
    <style>
        #loginwin{
            width: 980px;
            min-height: 500px;
            border-radius: 10px;
            font-family: "neo";
            overflow: hidden;
            box-shadow: 0px 0px 120px rgba(0, 0, 0, 0.25);
            position: fixed;
            top: 50%;
            right: 50%;
            margin-top: -250px;
            margin-right: -490px;
        }
        #login{
            width: 50%;
            height: 100%;
            min-height: 500px;
            background: linear-gradient(45deg, #d20f26, #1d32ca);
            position: relative;
            float: right;
        }
        #login span{
            text-align: center;
            position: absolute;
            left: 50%;
            margin-left: -150px;
            top: 52%;
            margin-top: -140px;
        }
        @font-face {
            font-family: 'neo';
            src: url("css/font/NEOTERICc.ttf");
        }
        input:focus{
            outline: none;
        }
        .form input{
            width: 300px;
            height: 30px;
            font-size: 18px;
            background: none;
            border: none;
            border-bottom: 1px solid #fff;
            color: #fff;
            margin-bottom: 20px;
        }
        .form input::placeholder{
            color: rgba(255,255,255,0.8);
            font-size: 18px;
            font-family: "neo";
        }
        .btn{
            width:140px;
            height: 40px;
            border: 1px solid #fff;
            background: none;
            font-size:20px;
            color: #fff;
            cursor: pointer;
            margin-top: 25px;
            font-family: "neo";
            transition: .25s;
        }
        .btn:hover{
            background: rgba(255,255,255,.25);
        }
        #bg{
            background: linear-gradient(45deg, #fffcfd, #f76ba6);
            height: 100%;
        }
        /*绘图*/
        #login_img{
            width: 50%;
            min-height: 500px;
            background: linear-gradient(45deg,#ffffff, #f969a5);
            float: left;
            position: relative;
        }

        #login_img span{
            position: absolute;
            display: block;
        }
        #login_img .circle{
            width: 200px;
            height: 200px;
            border-radius: 50%;
            background: linear-gradient(45deg, #df5555, #ef907a);
            top: 70px;
            left: 50%;
            margin-left: -100px;
            overflow: hidden;
        }
        #login_img .circle span{
            width: 150px;
            height: 40px;
            border-radius: 50px;
            position: absolute;
        }
        #login_img .circle span:nth-child(1){
            top: 30px;
            left: -38px;
            background: #c55c59;
        }
        #login_img .circle span:nth-child(2){
            bottom: 20px;
            right: -35px;
            background: #934555;
        }
        #login_img .star span{
            background: radial-gradient(#fff 10%,#fff 20%,rgba(72, 34, 64, 0));
            border-radius: 50%;
            box-shadow: 0 0 7px #fff;
        }
        #login_img .star span:nth-child(1){
            width: 15px;
            height: 15px;
            top: 50px;
            left: 30px;
        }
        #login_img .star span:nth-child(2){
            width: 10px;
            height: 10px;
            left: 360px;
            top: 80px;
        }
        #login_img .star span:nth-child(3){
            width: 5px;
            height: 5px;
            top: 400px;
            left: 80px;
        }
        #login_img .star span:nth-child(4){
            width: 8px;
            height: 8px;
            top: 240px;
            left: 60px;
        }
        #login_img .star span:nth-child(5){
            width: 4px;
            height: 4px;
            top: 20px;
            left: 200px;
        }
        #login_img .star span:nth-child(6){
            width: 4px;
            height: 4px;
            top: 460px;
            left: 410px;
        }
        #login_img .star span:nth-child(7){
            width: 6px;
            height: 6px;
            top: 250px;
            left: 350px;
        }
        #login_img .fly_star span{
            width: 90px;
            height: 3px;
            background: -webkit-linear-gradient(left, rgba(255, 255, 255, 0.67), rgba(255,255,255,0));
            background: -o-linear-gradient(left, rgba(255, 255, 255, 0.67), rgba(255,255,255,0));
            background: linear-gradient(to right, rgba(255, 255, 255, 0.67), rgba(255,255,255,0));
            transform: rotate(-45deg);
        }
        #login_img .fly_star span:nth-child(1){
            top:60px;
            left: 80px;
        }
        #login_img .fly_star span:nth-child(2){
            top: 210px;
            left: 332px;
            opacity: 0.6;
        }
        #login_img p{
            text-align: center;
            color: #af4b55;
            font-weight: 600;
            margin-top: 365px;
            font-size: 25px;
        }
        #login_img p i{
            font-style: normal;
            margin-right: 45px;
        }
        #login_img p i:nth-last-child(1){
            margin-right: 0;
        }
    </style>
</head>
<body>
<div id="bg">
    <div id="loginwin">
    <div id="login">
        <span>
        <form name="form1" action="GLYLoginServlet" method="post" onSubmit="return on_submit()">
            <p class="form"><input type="text" name="rootID" id="rootID" placeholder="管理员ID"></p>
            <p class="form"><input type="password" name="password" id="password" placeholder="密码"></p>
            <input type="button" value="返回" class="btn" onclick="back()">
            <input type="submit" value="登录" class="btn" style="margin-right: 20px;">
        </form>
        </span>
    </div>
    <div id="login_img">
        <span class="circle">
                    <span></span>
                    <span></span>
                </span>
        <span class="star">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </span>
        <span class="fly_star">
                    <span></span>
                    <span></span>
                </span>
        <p id="title">管理员登录</p>
    </div>
    </div>
</div>
</body>
<script>
    //取出传回来的参数error并与yes比较
    var errori ='<%=request.getParameter("error")%>';
    if(errori=='yes'){
        alert("登录失败!");
    }
</script>
<script>
    function back() {
        window.location.href='login.jsp';
    }
</script>
</html>
