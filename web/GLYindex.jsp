<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/12/30
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ page import="org.bloodmoon.dao.ItemDao" %>
<%@ page import="org.bloodmoon.model.Item" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.Currency" %>
<script  language="javascript">
    function on_search() {
        if(formsearch.keyword.value == ""){
            alert("请输入关键词");
            formsearch.keyword.focus();
            return false;
        }
    }
</script>
<html>
  <head>
      <meta http-equiv="Content-Type" content="text/html; charset=gbk" />
      <link type="text/css" rel="styleSheet"  href="css/index.css" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <%
          Object message = session.getAttribute("msg");
          if(message!=null&&!"".equals(message)){
      %>
      <script type="text/javascript">
          alert("<%=message%>")
      </script>
      <%session.setAttribute("msg","");
      }%>
      <title>主页</title>
      <style>
          .container {
              height: auto;
              width: 300px;
              margin: 100px auto 0 auto;
              position: relative;
              top: -80px;
              left: -280px;
          }
          .parent {
              position: relative;
          }
          .search {
              width: 420px;
              height: 40px;
              border-radius: 18px;
              outline: none;
              border: 1px solid #ccc;
              padding-left: 20px;
              position: absolute;
          }
          .btn {
              height: 40px;
              width: 65px;
              position: absolute;
              left: 430px;
              padding: 4px 15px;
              font-size: 15px;
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
      </style>
  </head>
  <body>

  <div id="index-header" >
    <div id="logo"><a href="GLYindex.jsp">BLOOD MOON</a></div>
      <div class="container">
          <form id="formsearch" action="GLYindexsearch.jsp" method="post" class="parent" onsubmit="return on_search()">
              <input type="text" class="search" name="keyword" id="keyword" minlength="1" maxlength="25" placeholder="搜索">
              <button type="submit" class="btn">确定</button>
          </form>
      </div>
    <div id="uname"><a>管理员:<%=session.getAttribute("RootID") %></a></div>
    <div id="mya"><a href="root.jsp">MyAccount</a> </div>
    <div id="out"><a href="exit.jsp">注销</a> </div>
  </div>

  <div id="ad">
    <div id="advimg">
      <a target = "_blank" href="https://www.sony.com.hk/zh/electronics/smartphones/xperia-1m2"><img src="img/adverimg01.jpg" height="400" width="1220"/></a>
      <a target = "_blank" href="https://www.sonystyle.com.cn/products/bravia/z8h/kd_75z8h.html"><img src="img/adverimg02.jpg" height="400" width="1220"/></a>
      <a target = "_blank" href="https://www.sony.com.hk/zh/electronics/smartphones/xperia-1"><img src="img/adverimg03.jpg" height="400" width="1220"/></a>
      <a target = "_blank" href="https://www.sonystyle.com.cn/products/ilc/ilce_6600/ilce_6600.html"><img src="img/adverimg04.jpg" height="400" width="1220"/></a>
    </div>
  </div>

  <div id="navigation">
  <div id="nav">
    <ul>
      <li><a title="首页" href="GLYindex.jsp">首页</a></li>
      <li><a title="电脑" href="GLYindexSort.jsp?sSort1=电脑">电脑</a></li>
      <li><a title="电脑配件" href="GLYindexSort.jsp?sSort1=电脑配件">电脑配件</a></li>
      <li><a title="手机" href="GLYindexSort.jsp?sSort1=手机">手机</a></li>
      <li><a title="数码相机" href="GLYindexSort.jsp?sSort1=数码相机">数码相机</a></li>
      <li><a title="衣服" href="GLYindexSort.jsp?sSort1=衣服">衣服</a></li>
      <li><a title="家电" href="GLYindexSort.jsp?sSort1=家电">家电</a></li>
      <li><a title="运动器材" href="GLYindexSort.jsp?sSort1=运动器材">运动器材</a></li>
      <li><a title="手办玩具" href="GLYindexSort.jsp?sSort1=手办玩具">手办玩具</a></li>
      <li><a title="游戏交易" href="GLYindexSort.jsp?sSort1=游戏交易">游戏交易</a></li>
      <li><a title="书本" href="GLYindexSort.jsp?sSort1=书本">书本</a></li>
      <li><a title="其他" href="GLYindexSort.jsp?sSort1=其他">其他</a></li>
    </ul>
  </div>
  </div>

  <div id="tabs1">
      <h2 style="position: relative;left: 19%;width: 150px">最新发布的</h2>
      <center>
        <table width="1220" height="60" cellpadding="0" cellspacing="0" border="0">
          <tr>
            <td>
              <%
                ItemDao itemDao = new ItemDao();
                ArrayList<Item> list = itemDao.getAllItem();
                if(list != null&&list.size()>0){
                    for(int i=0;i<list.size();i++){
                        Item item = list.get(i);
              %>
              <div id="item">
                <dl>
                  <dt>
                    <a target = "_blank" href="GLYiteminfo.jsp?sid=<%=item.getSid()%>"><img src="img/shopimage/<%=item.getSImage1()%>" width="200" height="200"></a>
                  </dt>
                  <dd id="dd_name" ><%=item.getSName()%></dd>
                  <dd id="dd_level">新旧程度：<%=item.getSLevel()%></dd>
                  <dd id="dd_price"><%=Currency.getInstance("CNY").getSymbol(Locale.CHINA)+item.getSPrices()%></dd>
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
      <div id="bottom">
          <div id="bottomimg">
              <img src="img/bottompic.png" height="446" width="1202"/>
          </div>
      </div>
  </div>


  </body>
</html>
