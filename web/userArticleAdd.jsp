<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/12/31
  Time: 0:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script language="javascript">
    function on_submit()
    {
        if(form1.file.value==""){
            alert("你还没有选择图片文件！");
            return false;
        }
        //取出上传文件格式的后缀名
        var fileAccept = file.value.split(".")[1];//获取上传文件的后缀
        if(fileAccept!="png"&&fileAccept!="jpg"&&fileAccept!="JPG"&&fileAccept!="PNG"){
            alert("只能上传.png和.jpg的图片！");
            return false;
        }

        if(confirm('确定？')){
            return true;
        }else {
            return false;
        }
    }
</script>
<html>
<head>
    <link type="text/css" rel="styleSheet"  href="css/user.css" />
    <title>发布商品</title>
    <style>
        #Articleadd{
            width: 1300px;
            height: 300px;
            background: ghostwhite;
            position: absolute;
            top: 200px;
            left: 290px;
            margin: 20px;
        }

        input{
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
            top: 62px;
            left: 96px;
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
    <div id="Articleadd">
        <center>
        <form name="form1" action="uploadshopimgServlet" enctype="multipart/form-data" method="POST" onSubmit="return on_submit()" style="position: absolute;top: 20%;left: 37%;">
            <b>商品图片（尺寸1:1）：</b><input type="file" id="file" name="file" accept="image/png,image/jpeg" ><br>
            <input id="btn" type="submit" value="下一步"/>
        </form>
        </center>
</div>
</body>
</html>
