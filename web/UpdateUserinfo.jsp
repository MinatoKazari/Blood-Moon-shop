<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="org.bloodmoon.utils.DbUtil" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/3/18
  Time: 12:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script language="javascript">
    function on_submit()
    {
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
            form1.phone.focus();
            return false
        }
    }
</script>
<script language="javascript">
    function on_submit2()
    {
        if(form2.file.value==""){
            alert("你还没有选择图片文件！");
            return false;
        }
        //取出上传文件格式的后缀名
        var fileAccept = file.value.split(".")[1];//获取上传文件的后缀
        if(fileAccept!="png"&&fileAccept!="jpg"&&fileAccept!="JPG"&&fileAccept!="PNG"){
            alert("只能上传.png和.jpg的图片！");
            return false;
        }

        if(confirm('确定更新头像？')){
            return true;
        }else {
            return false;
        }
    }
</script>
<html>
<head>
    <link type="text/css" rel="styleSheet"  href="css/user.css" />
    <title>更新用户信息</title>
    <style>
        #infoupdate{
            width: 1300px;
            height: 500px;
            background: ghostwhite;
            position: absolute;
            top: 200px;
            left: 290px;
            margin: 20px;
        }

        #infoupdate form{
            margin: 20px;
            text-align: center;
        }

        #infoupdate form dd{
            margin: 15px;
            font-size: 20px;
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
            top: 500px;
            left: 550px;
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
    Connection conn=null;
    Statement sql=null;
    ResultSet rs=null;
    DbUtil db=new DbUtil();
    conn=db.getCon();
    sql=conn.createStatement();//实例化Statement对象
    rs = sql.executeQuery("SELECT * FROM userinformation where uid ='"+session.getAttribute("uid")+"'");
    try{
%>
<% while (rs.next()) { %>
<div id="infoupdate">
    <form name="form1" action="EXupdateuserinfo.jsp" method="post" onSubmit="return on_submit()">
        <dd>真名：<input type="text" name="realname" minlength="2" maxlength="15" value="<%out.print(rs.getString(4));%>" onkeyup="value=value.replace(/[^\a-\z\A-\Z\u4E00-\u9FA5]/g,'')" onpaste="value=value(/[^\a-\z\A-\Z\u4E00-\u9FA5]/g,'')" oncontextmenu = "value=value.replace(/[^\a-\z\A-\Z\u4E00-\u9FA5]/g,'')"><br></dd>
        <dd style="position: relative;left: -52px">年龄：<input type="number" name="age" id="age" min="16" max="100" value="<%out.print(rs.getString(5));%>"><br></dd>
        <dd>性别：<input type="text" maxlength="1" name="sex" id="sex" value="<%out.print(rs.getString(6));%>" placeholder="填写男、女" onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,'')" onpaste="value=value(/[^9\u4E00-\u9FA5]/g,'')" oncontextmenu = "value=value.replace(/[^\u4E00-\u9FA5]/g,'')"><br></dd>
        <dd>联系电话：<input type="tel" minlength="11" maxlength="11" name="phone" id="phone" value="<%out.print(rs.getString(7));%>" placeholder="不能为空"onkeyup="value=value.replace(/[^0-9]/g,'')" onpaste="value=value(/[^0-9]/g,'')" oncontextmenu = "value=value.replace(/[^0-9]/g,'')"><br></dd>
        <dd>电子邮件：<input type="email" name="email" id="email" minlength="7" maxlength="25" value="<%out.print(rs.getString(8));%>" placeholder="不能为空"onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9@.]/g,'')" onpaste="value=value(/[^\a-\z\A-\Z0-9@.]/g,'')" oncontextmenu = "value=value.replace(/[^\a-\z\A-\Z0-9@.]/g,'')"><br></dd>
        <dd>地方省区：<input type="text" name="locationA" id="locationA" value="<%out.print(rs.getString(13));%>" maxlength="7" placeholder="用于收发货地址" onkeyup="value=value.replace(/[^\a-\z\A-\Z\u4E00-\u9FA5]/g,'')" onpaste="value=value(/[^\a-\z\A-\Z\u4E00-\u9FA5]/g,'')" oncontextmenu = "value=value.replace(/[^\a-\z\A-\Z\u4E00-\u9FA5]/g,'')"><br></dd>
        <dd>地方市区：<input type="text" name="locationB" id="locationB" value="<%out.print(rs.getString(14));%>" maxlength="11" placeholder="用于收发货地址" onkeyup="value=value.replace(/[^\a-\z\A-\Z\u4E00-\u9FA5]/g,'')" onpaste="value=value(/[^\a-\z\A-\Z\u4E00-\u9FA5]/g,'')" oncontextmenu = "value=value.replace(/[^\a-\z\A-\Z\u4E00-\u9FA5]/g,'')"><br></dd>
        <dd>地方镇区：<input type="text" name="locationC" id="locationC" value="<%out.print(rs.getString(15));%>" maxlength="8" placeholder="用于收发货地址" onkeyup="value=value.replace(/[^\a-\z\A-\Z\u4E00-\u9FA5]/g,'')" onpaste="value=value(/[^\a-\z\A-\Z\u4E00-\u9FA5]/g,'')" oncontextmenu = "value=value.replace(/[^\a-\z\A-\Z\u4E00-\u9FA5]/g,'')"><br></dd>
        <dd>详细街道：<input type="text" name="locationD" id="locationD" value="<%out.print(rs.getString(16));%>" maxlength="50" placeholder="用于收发货地址"><br></dd>
        <input type="submit" value="提交" id="btn">
    </form>

    <form id="form2" action="uploadServlet" enctype="multipart/form-data" method="POST" onSubmit="return on_submit2()">
        头像（尺寸1:1）：<input type="file" id="file" name="file" accept="image/png,image/jpeg"/>
        <input type="submit" value="更新"/>
    </form>
    <% } %>
    <%
        rs.close();
        sql.close();
        conn.close();
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
</div>
</body>
</html>
