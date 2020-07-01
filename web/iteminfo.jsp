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
            font-size: 37px;
            color: #fa6d1d;
            font-weight: 600;
            max-width: 930px;
        }
        #sDisplay{
            font-size: 23px;
            color: #2aab63;
            font-weight: 400;
            position: absolute;
            top: 79px;
        }
        #Sid{
            position: absolute;
            top: 55px;
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
        .btn3 {
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
            top: 525px;
        }
        #bottomimg{
            width: 100%;
            height: 446px;
            text-align:center;
            position: relative;
            top: -1px;
        }
        .history{
            width: 100px;
            height: auto;
        }
        .itemView{
            width: 170px;
            height: 230px;
            position: relative;
            left: 1635px;
            top: 102px;
            padding: 12px;
            margin-bottom: 26px;
            background: darkseagreen;
            border-radius: 1rem;
            }
        .item dd{
            margin: 0px;
        }
        .dd_name{
            color: #fa6d1d;
            font-size: 14px;
            max-width: 200px;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            white-space: nowrap;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
        }
        .dd_level{
            font-size: 14px;
            color: black;
        }
        .dd_price{
            font-size: 14px;
            color: black;
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
<!--商品详细信息部分-->
<div id="item_win">
    <h1>商品详情</h1>
                <!-- 商品详情  -->
                <%
                    ItemDao itemDao = new ItemDao();
                    Item item = itemDao.getItemBySid(Integer.valueOf(request.getParameter("sid")));
                    if(item!=null){
                        session.setAttribute("sid",item.getSid());
                %>
            <div id="simg"><img src="img/shopimage/<%=item.getSImage1()%>" width="400" height="400"/></div>
    <div id="sco">
            <p id="Sname"><%=item.getSName()%></p>
            <p id="sDisplay">状态：<%=item.getSDisplay()%></p>
            <p id="Stext">商品介绍：</p>
            <p id="Stext1"><%=item.getSRemark()%></p>
            <p id="SLocation">位置：<%=item.getSLocationF()%>  <%=item.getSLocationS()%>  <%=item.getSLocationT()%></p>
            <p id="Slevel">新旧程度：<%=item.getSLevel()%></p>
            <p id="Soa">交易方式：<%=item.getSTransaction()%></p>
            <p id="Su">卖家：<%=item.getSUname()%></p>
            <p id="Stime">更新时间：<%=item.getModified()%></p>
            <p id="Sprice">售价：<%=item.getSPrices()%></p>
        <%//如果卖家用户名跟当前用户一致和当前商品状态不是通过时，不能购买
            String str1=String.valueOf(item.getSDisplay());
            String str2=String.valueOf(item.getSUname());
            if(str1.equals("通过")&&!str2.equals(session.getAttribute("Username"))){ %>
            <input type="button" value="购买" class="btn1" id="btn1" onclick="buy()">
        <%}%>
            <input type="button" value="收藏" class="btn2" id="btn2" onclick="fav()">
        <script type="text/javascript">
            function buy() {
                window.location.href = 'itemdeal.jsp?sid=<%=item.getSid()%>';
            }
            function fav() {
                window.location.href='Exaddfavour.jsp?sid=<%=item.getSid()%>';
            }
        </script>
    </div>
</div>

<!--用户评论区部分-->
<div class="review">
    <center>
    <div class="userreview">
        <form id="sendreview" action="Exaddmessage.jsp?sid=<%=item.getSid()%>" method="post" class="parent" onsubmit="return on_send()">
            <input type="text" class="send" name="context" id="context" maxlength="80" minlength="4" placeholder="留言">
            <button type="submit" value="" class="btn3">提交</button>
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

<!--浏览记录部分-->
<div class="history">
    <%
        String list="";
        Cookie[] cookies =request.getCookies();//读取Cookie对象
        if(cookies!=null && cookies.length>0){
            //开始循环遍历（foreach）输出cookies所有的值
            for(Cookie c:cookies){
                if(c.getName().equals("listViewCookie")){//是否匹对cookie的键名
                    list = c.getValue();//获取Cookie的值并赋值给list字符串
                }
            }
        }
        list +=request.getParameter("sid")+"#";//把当前商品sid放进sid记录的字符串里面
        //浏览记录超过1000条时清0
        String[] arr = list.split("#");
        if(arr!=null && arr.length>0){
            if(arr.length>=1000)
                list = "";//sid记录清空
        }
        Cookie cookie = new Cookie("listViewCookie",list);//创建Cookie对象 键名：listViewCookie 键值：list
        response.addCookie(cookie);//写入Cookie对象(更新list浏览数据)
    %>
    <!--浏览过的商品：前端-->
    <td width="30%" bgcolor="#EEE" align="center">
        <br>
        <b style="position: relative;left: 1637px;top: 85px;font-size: 20px;">最近浏览：</b><br>
        <!--循环开始-->
        <%
            ArrayList<Item> itemList = itemDao.getViewList(list);
            if(itemList!=null&&itemList.size()>0){
                for(Item i:itemList)
                {
        %>
        <div class="itemView">
            <dl>
                <dt>
                    <a target = "_blank" href="iteminfo.jsp?sid=<%=i.getSid()%>"><img src="img/shopimage/<%=i.getSImage1()%>" width="170" height="170"></a>
                </dt>
                <dd class="dd_name" ><%=i.getSName()%></dd>
                <dd class="dd_level">新旧程度：<%=i.getSLevel()%></dd>
                <dd class="dd_price">售价：<%=i.getSPrices()%></dd>
            </dl>
        </div>
        <%
                }
            }
        %>
    </td>
</div>

<script>
    //取出传回来的参数error并与yes比较
    var errori ='<%=request.getParameter("error")%>';
    if(errori=='yes'){
        alert("该商品已收藏过了!");
    }
</script>
</html>
