<%@ page import="org.bloodmoon.dao.ItemDao" %>
<%@ page import="org.bloodmoon.model.Item" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.bloodmoon.dao.CommentDao" %>
<%@ page import="org.bloodmoon.model.Comment" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/12/31
  Time: 0:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link type="text/css" rel="styleSheet"  href="css/index.css" />
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
            font-size: 17px;
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
            top: 414px;
            left: -420px;
        }
        #Sprice{
            font-size: 30px;
            font-weight: 800;
            color: red;
            position: absolute;
            top: 350px;
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
        .btn1{
            width: 145px;
            height: 50px;
            border: 1px solid #fff;
            border-radius: 3rem;
            background: #5aa1a1;
            box-shadow: 0 0 8px rgb(243, 240, 254);
            cursor: pointer;
            font-size: 30px;
            color: #fff;
            margin-top: 25px;
            font-family: "neo";
            transition: .25s;
            position: absolute;
            top: 390px;
            left: 21%;
        }
        .btn2{
            width: 145px;
            height: 50px;
            border: 1px solid #fff;
            border-radius: 3rem;
            background: #ff5178;
            box-shadow: 0 0 8px rgb(243, 240, 254);
            cursor: pointer;
            font-size: 30px;
            color: #fff;
            margin-top: 25px;
            font-family: "neo";
            transition: .25s;
            position: absolute;
            top: 390px;
            left: -1%;
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
        .btn3{
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
    </style>
</head>
<body>
<div id="index-header" >
    <div id="logo"><a href="GLYindex.jsp">BLOOD MOON</a></div>
    <div id="uname"><a>管理员:<%=session.getAttribute("RootID") %></a></div>
    <div id="mya"><a href="root.jsp">MyAccount</a> </div>
    <div id="out"><a href="exit.jsp">注销</a> </div>
</div>
<div id="item_win">
    <h1>商品详情</h1>
                <!-- 商品详情  -->
                <%
                    ItemDao itemDao = new ItemDao();
                    Item item = itemDao.getItemBySid(Integer.valueOf(request.getParameter("sid")));
                    if(item!=null){
                %>
            <div id="simg"><img src="img/shopimage/<%=item.getSImage1()%>" width="400" height="400"/></div>
    <div id="sco">
            <p id="Sname"><%=item.getSName()%></p>
            <p id="Sid">商品ID：<%=item.getSid()%></p><p id="sDisplay">审核状态：<%=item.getSDisplay()%></p>
            <p id="Sort1">分类：<%=item.getSSort1()%></p>
            <p id="Stext">商品介绍：</p>
            <p id="Stext1"><%=item.getSRemark()%></p>
            <p id="SLocation">位置：<%=item.getSLocationF()%>  <%=item.getSLocationS()%>  <%=item.getSLocationT()%></p>
            <p id="Slevel">新旧程度：<%=item.getSLevel()%></p>
            <p id="Soa">交易方式：<%=item.getSTransaction()%></p>
            <p id="Su">卖家：<%=item.getSUname()%></p>
            <p id="Stime">更新时间：<%=item.getModified()%></p>
            <p id="Sprice">售价：<%=item.getSPrices()%></p>
            <input type="button" value="取消展示" class="btn1" id="btn1" onclick="notpass()">
            <input type="button" value="下架" class="btn2" id="btn2" onclick="del()">
        <SCRIPT>
            function del() {
                if(confirm('确定要下架该商品？')) {
                    window.location.href = 'GLYEXdelArticle.jsp?sid=<%=item.getSid()%>';//GLYdelitem.jsp
                }
            }
            function notpass() {
                window.location.href='GLYnotpassitem.jsp?sid=<%=item.getSid()%>';//GLYnotpassitem.jsp-->notpassitem.jsp
            }
        </SCRIPT>
    </div>
</div>

<!--用户评论区部分-->
<div class="review">
    <center>

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
                                <dd><a href="GLYExdelMessage.jsp?smid=<%=comment.getSmid()%>"><input type="button" class="btn3" value="移除"></a></dd><!---GLYExdelMessage.jsp-->
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
<script>
    //取出传回来的参数error并与yes比较
    var errori ='<%=request.getParameter("error")%>';
    if(errori=='yes'){
        alert("该商品已收藏过了!");
    }
</script>
</html>
