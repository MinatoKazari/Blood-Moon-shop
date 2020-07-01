<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="org.bloodmoon.utils.DbUtil" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/12/31
  Time: 0:10
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script language="javascript">
    function on_submit()
    {
        if (form1.sname.value == "")
        {
            alert("商品名不能为空，请输入商品名！");
            form1.sname.focus();
            return false;
        }
        if (form1.slevel.value == "")
        {
            alert("新旧程度不能为空，请输入！");
            form1.slevel.focus();
            return false;
        }
        if (form1.slevel.value !== "")
        {
            if(form1.slevel.value <=0) {
                alert("新旧程度输入有误，请输入1-10！");
                form1.slevel.focus();
                return false;
            }
        }
        if (form1.sprices.value == "")
        {
            alert("商品价格不能为空，请输入！");
            form1.sprices.focus();
            return false;
        }
        if (form1.slocationf.value == ""&&form1.slocations.value=="")
        {
            alert("省和市不能都为空，至少输入一个！");
            form1.slocationf.focus();
            return false;
        }
        if(confirm('请确认商品信息，确定发布？')){
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
            height: 658px;
            background: ghostwhite;
            position: absolute;
            top: 200px;
            left: 290px;
            margin: 20px;
        }
        #Articleadd form dd{
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
            top: 564px;
            left: 564px;
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
    <%
        Connection conn=null;
        Statement sql=null;
        ResultSet rs=null;
        DbUtil db=new DbUtil();
        conn=db.getCon();
        sql=conn.createStatement();//实例化Statement对象
        rs = sql.executeQuery("SELECT * FROM userinformation where username ='"+session.getAttribute("Username")+"'");
        try{
    %>
    <center>
        <form name="form1" action="EXaddArticle.jsp" method="post"onSubmit="return on_submit()" style="margin: 20px;text-align: center;">
            <dd>商品名称：<input type="text" name="sname" id="sname" maxlength="25" placeholder="不能为空" onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5 ]/g,'')" onpaste="value=value(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5 ]/g,'')" oncontextmenu = "value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5 ]/g,'')"><br></dd>
            <dd>新旧程度：<input type="number" name="slevel" id="slevel" max="10" min="1" placeholder="不能为空" style="width:176px;height:32px; border-radius: 3px;"><br></dd>
            <%--<dd>商品简介：<input type="text" name="sremark" id="sremark"><br></dd>--%>
            <dd>商品简介：<textarea name="sremark" id="sremark" cols="22" rows="7" maxlength="254"></textarea><br></dd>
            <dd style="position: relative;left: 21px;">价格：<input type="number" name="sprices" id="sprices" min="1" placeholder="不能为空"><br></dd>
            <dd style="position: relative;left: 21px;">分类：<select name="sort1" style="width:176px;height:32px; border-radius: 3px;">
                <option value="电脑" <c:if test="${sort1=='电脑'}"></c:if>>电脑</option>
                <option value="电脑配件" <c:if test="${sort1=='电脑配件'}"></c:if>>电脑配件</option>
                <option value="手机" <c:if test="${sort1=='手机'}"></c:if>>手机</option>
                <option value="数码相机" <c:if test="${sort1=='数码相机'}"></c:if>>数码相机</option>
                <option value="衣服" <c:if test="${sort1=='衣服'}"></c:if>>衣服</option>
                <option value="家电" <c:if test="${sort1=='家电'}"></c:if>>家电</option>
                <option value="运动器材" <c:if test="${sort1=='运动器材'}"></c:if>>运动器材</option>
                <option value="手办玩具" <c:if test="${sort1=='手办玩具'}"></c:if>>手办玩具</option>
                <option value="游戏交易" <c:if test="${sort1=='游戏交易'}"></c:if>>游戏交易</option>
                <option value="书本" <c:if test="${sort1=='书本'}"></c:if>>书本</option>
                <option value="其他" <c:if test="${sort1=='其他'}"></c:if>>其他</option>
            </select><br></dd>
            <% while (rs.next()) { %>
            <dd>地方省区：<input type="text" name="slocationf" VALUE="<%out.print(rs.getString(13));%>" maxlength="7" id="slocationf" placeholder="省或市至少填一个" onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')" onpaste="value=value(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')" oncontextmenu = "value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')"><br></dd>
            <dd>地方市区：<input type="text" name="slocations" VALUE="<%out.print(rs.getString(14));%>" maxlength="11" id="slocations" placeholder="省或市至少填一个" onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')" onpaste="value=value(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')" oncontextmenu = "value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')"><br></dd>
            <dd>地方镇区：<input type="text" name="slocationt" VALUE="<%out.print(rs.getString(15));%>" maxlength="8" id="slocationt" onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')" onpaste="value=value(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')" oncontextmenu = "value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')"><br></dd>
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
            <dd>交易方式：<select name="type" style="width:177px;height:32px; border-radius: 3px;">
                <option value="仅线上交易" <c:if test="${type=='仅线上交易'}"></c:if>>仅线上交易</option>
                <option value="线上与当面交易" <c:if test="${type=='线上与当面交易'}"></c:if>>线上与当面交易</option>
                <option value="仅当面交易" <c:if test="${type=='仅当面交易'}"></c:if>>仅当面交易</option>
            </select><br></dd>
            <dd style="position: relative;left: 21px;">图片：<input type="text" name="simg" value=<%=request.getAttribute("realFileName")%> readonly="readonly"><br></dd>
            <input type="submit" value="提交" id="btn">
        </form>
    </center>
</div>
</body>
</html>
