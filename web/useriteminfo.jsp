<%@ page import="org.bloodmoon.dao.ItemDao" %>
<%@ page import="org.bloodmoon.model.Item" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.bloodmoon.dao.CommentDao" %>
<%@ page import="org.bloodmoon.model.Comment" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/12/31
  Time: 0:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script  language="javascript">
    function on_send() {
        if(sendreview.context.value == ""){
            alert("不能为空");
            sendreview.context.focus();
            return false;
        }
    }
</script>
<html>
<head>
    <link type="text/css" rel="styleSheet"  href="css/index.css" />
    <%
        Object message = session.getAttribute("msg");
        if(message!=null&&!"".equals(message)){
    %>
    <script type="text/javascript">
        alert("<%=message%>")
    </script>
    <%session.setAttribute("msg","");
        }%>
    <title>商品详情</title>
    <style type="text/css">
        #item_win{
            width: 1400px;
            height: 600px;
            position: absolute;
            top: 10%;
            left: 15%;
        }
        #item_win table{
            margin-top: 20px;
        }
        #simg{

        }
        #sco{
            width: 1000px;
            position: absolute;
            left: 30%;
            top: 45px;
        }
        #Sname{
            font-size: 40px;
            color: #fa6d1d;
            font-weight: 600;
            max-width: 1000px;
        }
        #Sid{
            position: absolute;
            top: 55px;
            left: 4px;
        }
        #Stext{
            position: absolute;
            top: 113px;
            font-size: 23px;
            font-weight: 500;
        }
        #Stext1{
            width: 795px;
            height: auto;
            word-wrap: break-word;
            word-break: break-all;
            position: absolute;
            top: 145px;
            font-size: 17px;;
        }
        #SLocation{
            position: absolute;
            top: 292px;
        }
        #Slevel{
            position: absolute;
            top: 264px;
        }
        #Soa{
            font-size: 16px;
            position: absolute;
            top: 321px;
        }
        #Su{
            position: absolute;
            top: 55px;
            left: 115px;
        }
        #Stime{
            position: absolute;
            top: 420px;
            left: -420px;
        }
        #time{
            position: absolute;
            top: 460px;
            left: -420px;
        }
        #sDisplay{
            font-size: 23px;
            color: #2aab63;
            font-weight: 400;
            position: absolute;
            top: 79px;
        }
        #Sort1{
            font-size: 16px;
            position: absolute;
            top: 265px;
            left: 127px;
            font-weight: 400;
        }
        #Sprice{
            font-size: 30px;
            font-weight: 800;
            color: red;
            position: absolute;
            top: 350px;
        }
        .btn1{
            width: 160px;
            height: 40px;
            border: 1px solid #fff;
            border-radius: 3rem;
            background: cadetblue;
            box-shadow: 0 0 8px rgb(243, 240, 254);
            cursor: pointer;
            font-size: 22px;
            color: #fff;
            margin-top: 25px;
            font-family: "neo";
            transition: .25s;
            position: absolute;
            top: 420px;
            left: 0%;
        }
        .btn2{
            width: 160px;
            height: 40px;
            border: 1px solid #fff;
            border-radius: 3rem;
            background: cadetblue;
            box-shadow: 0 0 8px rgb(243, 240, 254);
            cursor: pointer;
            font-size: 22px;
            color: #fff;
            margin-top: 25px;
            font-family: "neo";
            transition: .25s;
            position: absolute;
            top: 420px;
            left: 20%;
        }
        .btn3{
            width: 160px;
            height: 40px;
            border: 1px solid #fff;
            border-radius: 3rem;
            background: linear-gradient(90deg,rgb(255, 0, 0),#ff0000);
            box-shadow: 0 0 8px rgb(243, 240, 254);
            cursor: pointer;
            font-size: 22px;
            color: #fff;
            margin-top: 25px;
            font-family: "neo";
            transition: .25s;
            position: absolute;
            top: 420px;
            left: 40%;
        }
        .btn6{
            width: 160px;
            height: 40px;
            border: 1px solid #fff;
            border-radius: 3rem;
            background: linear-gradient(90deg,rgb(255, 0, 0),#ff0000);
            box-shadow: 0 0 8px rgb(243, 240, 254);
            cursor: pointer;
            font-size: 22px;
            color: #fff;
            margin-top: 25px;
            font-family: "neo";
            transition: .25s;
            position: absolute;
            top: 420px;
            left: 60%;
        }

        .review{
            width: 100%;
            height: auto;
            position: absolute;
            top: 660px;
        }
        .userreview{
            width: 1440px;
            height: 50px;
        }
        .parent {
            position: relative;
        }
        .send {
            width: 1000px;
            height: 50px;
            border-radius: 18px;
            outline: none;
            border: 1px solid #ccc;
            padding-left: 20px;
            position: relative;
            font-size: 22px;
        }
        .btn4 {
            width: 80px;
            height: 48px;
            position: relative;
            padding: 4px 15px;
            font-size: 22px;
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
        #bottom{
            width: 100%;
            height: 446px;
            background: #1f2024;
            position: relative;
            top: 36px;
        }
        #bottomimg{
            width: 100%;
            height: 446px;
            text-align:center;
            position: relative;
            top: -1px;
        }
        .btn5{
            width: 83px;
            height: 26px;
            border: 1px solid #fff;
            border-radius: 3rem;
            background: red;
            box-shadow: 0 0 8px rgb(243, 240, 254);
            cursor: pointer;
            font-size: 17px;
            color: #fff;
            margin-top: 25px;
            font-family: "neo";
            transition: .25s;
            position: relative;
            top: -35px;
            left: 23%;
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
<div id="item_win">
    <h1>用户商品详情</h1>
                <!-- 商品详情  -->
                <%
                    ItemDao itemDao = new ItemDao();
                    Item item = itemDao.getItemBySid(Integer.valueOf(request.getParameter("sid")));
                    if(item!=null){
                %>
            <div id="simg"><img src="img/shopimage/<%=item.getSImage1()%>" width="400" height="400"/></div>
    <div id="sco">
            <p id="Sname"><%=item.getSName()%></p><p id="sDisplay">审核状态：<%=item.getSDisplay()%>(要重新上架只需要点更新信息即可！)</p>
            <p id="Sid">商品ID：<%=item.getSid()%></p>
            <p id="Sort1">分类：<%=item.getSSort1()%></p>
            <p id="Stext">商品介绍：</p>
            <p id="Stext1"><%=item.getSRemark()%></p>
            <p id="SLocation">位置：<%=item.getSLocationF()%>  <%=item.getSLocationS()%>  <%=item.getSLocationT()%></p>
            <p id="Slevel">新旧程度：<%=item.getSLevel()%></p>
            <p id="Soa">交易方式：<%=item.getSTransaction()%></p>
            <p id="Su">卖家：<%=item.getSUname()%></p>
            <p id="Stime">更新时间：<%=item.getModified()%></p>
            <p id="time">发布时间：<%=item.getCreatime()%></p>
            <p id="Sprice">售价：<%=item.getSPrices()%></p>
            <input type="button" value="更新商品信息" class="btn1" id="btn1" onclick="itemdate()">
            <input type="button" value="更改商品价格" class="btn2" id="btn2" onclick="updaprice()">
            <input type="button" value="下架商品" class="btn3" id="btn3" onclick="deleteitem()">
        <%String str1=String.valueOf(item.getSDisplay());
            if(str1.equals("通过")){ %>
            <input type="button" value="取消展示" class="btn6" id="btn6" onclick="cancel()">
        <%}%>
    </div>
</div>

<!--用户评论区部分-->
<div class="review">
    <center>
        <div class="userreview">
            <form id="sendreview" action="Exaddmessage.jsp?sid=<%=item.getSid()%>" method="post" class="parent" onsubmit="return on_send()">
                <input type="text" class="send" name="context" id="context" minlength="4" maxlength="80" placeholder="留言">
                <button type="submit" value="" class="btn4">提交</button>
            </form>
        </div>

        <div class="getreview">
            <a style="position: relative;font-size: 23px;font-weight: 600;left: -34%">用户留言</a>
            <center>
                <table style="width:1160px; height:60px; cellpadding:0; cellspacing:0; border:0;">
                    <tr>
                        <td>
                            <%
                                CommentDao commentDao = new CommentDao();
                                ArrayList<Comment> list = commentDao.getItemComment(Integer.valueOf(request.getParameter("sid")));
                                if(list != null&&list.size()>0){
                                    for(int i=0;i<list.size();i++){
                                        Comment comment = list.get(i);
                            %>
                            <div class="comment">
                                <dl>
                                    <dd style="position: relative;font-size: 20px;font-weight: 600;"><%=comment.getSmUname()%></dd>
                                    <dd style="position: relative;font-size: 20px; top: 6px;"><%=comment.getSmContext()%></dd>
                                    <dd style="position: relative;font-size: 17px;top: 15px;">时间：<%=comment.getModified()%></dd>
                                    <dd><a href="ExdelMessage.jsp?smid=<%=comment.getSmid()%>"><input type="button" class="btn5" value="移除"></a></dd>
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
        </div>
    </center>

    <div id="bottom">
        <div id="bottomimg">
            <img src="img/bottompic.png" height="446" width="1202"/>
        </div>
    </div>
</div>
</body>
<%
    }
%>
<SCRIPT>
    function itemdate() {
        window.location.href='UpdateIteminfo.jsp?sid=<%=item.getSid()%>';
    }
    function updaprice() {
        window.location.href='UpdateItemprice.jsp?sid=<%=item.getSid()%>';
    }
    function deleteitem() {
        if(confirm('确定要删除该商品所有信息？')){
        window.location.href='EXdelArticle.jsp?sid=<%=item.getSid()%>';}
    }
    function cancel() {
        if(confirm('确定要取消商品展示？')){
            window.location.href='EXcancelArticle.jsp?sid=<%=item.getSid()%>';}
    }
</SCRIPT>
</html>
