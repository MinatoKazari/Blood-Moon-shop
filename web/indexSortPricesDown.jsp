<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/4/9
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ page import="org.bloodmoon.dao.ItemDao" %>
<%@ page import="org.bloodmoon.model.Item" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.Currency" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk" />
    <link type="text/css" rel="styleSheet"  href="css/index.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%request.setCharacterEncoding("GBK"); String sSort1 = request.getParameter("sSort1");%>
    <title><%=sSort1%></title>
    <style>
        .container {
            hheight: auto;
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
        .tel{
            width: 200px;
            height: 7%;
            font-size: 20px;
            font-weight: 600;
            position: absolute;
            top:32%;
            right: 1%;
        }
        .tel a{
            color: white;
            text-decoration: none;
        }
    </style>
</head>
<body>

<div id="index-header" >
    <div id="logo"><a href="index.jsp">BLOOD MOON</a></div>
    <div class="container">
        <form id="formsearch" action="indexsearch.jsp" method="post" class="parent" onsubmit="return on_search()">
            <input type="text" class="search" name="keyword" id="keyword" minlength="1" maxlength="25" placeholder="����">
            <button type="submit" class="btn">ȷ��</button>
        </form>
    </div>
    <div id="uname"><a>�û�:<%=session.getAttribute("Username") %></a></div>
    <div id="mya"><a href="user.jsp">MyAccount</a> </div>
    <div id="out"><a href="exit.jsp">ע��</a> </div><div class="tel"><a target = "_blank" href="Contact%20us.jsp">��ϵ����</a></div>
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
            <li><a title="��ҳ" href="index.jsp">��ҳ</a></li>
            <li><a title="����" href="indexSort.jsp?sSort1=����">����</a></li>
            <li><a title="�������" href="indexSort.jsp?sSort1=�������">�������</a></li>
            <li><a title="�ֻ�" href="indexSort.jsp?sSort1=�ֻ�">�ֻ�</a></li>
            <li><a title="�������" href="indexSort.jsp?sSort1=�������">�������</a></li>
            <li><a title="�·�" href="indexSort.jsp?sSort1=�·�">�·�</a></li>
            <li><a title="�ҵ�" href="indexSort.jsp?sSort1=�ҵ�">�ҵ�</a></li>
            <li><a title="�˶�����" href="indexSort.jsp?sSort1=�˶�����">�˶�����</a></li>
            <li><a title="�ְ����" href="indexSort.jsp?sSort1=�ְ����">�ְ����</a></li>
            <li><a title="��Ϸ����" href="indexSort.jsp?sSort1=��Ϸ����">��Ϸ����</a></li>
            <li><a title="�鱾" href="indexSort.jsp?sSort1=�鱾">�鱾</a></li>
            <li><a title="����" href="indexSort.jsp?sSort1=����">����</a></li>
        </ul>
    </div>
</div>

<div id="tabs1">
    <h2 style="position: relative;left: 19%;width: 300px;">���ࣺ<%=request.getParameter("sSort1")%></h2>
    <a style="position: relative;left: 19%;text-decoration: none;color: darkcyan;font-size: 18px;" href="indexSortPricesUp.jsp?sSort1=<%=request.getParameter("sSort1")%>">�۸�ӵ͵���չʾ</a>
    <a style="position: relative;left: 20%;text-decoration: none;color: darkcyan;font-size: 18px;" href="indexSortPricesDown.jsp?sSort1=<%=request.getParameter("sSort1")%>">�۸�Ӹߵ���չʾ</a>
    <center>
        <table width="1220" height="60" cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td>
                    <%
                        System.out.println("��������ֶΣ�"+request.getParameter("sSort1"));
                        ItemDao itemDao = new ItemDao();
                        ArrayList<Item> list = itemDao.getSortItemPricesDown(String.valueOf(request.getParameter("sSort1")));
                        if(list != null&&list.size()>0){
                            for(int i=0;i<list.size();i++){
                                Item item = list.get(i);
                    %>
                    <div id="item">
                        <dl>
                            <dt>
                                <a href="iteminfo.jsp?sid=<%=item.getSid()%>"><img src="img/shopimage/<%=item.getSImage1()%>" width="200" height="200"></a>
                            </dt>
                            <dd id="dd_name" ><%=item.getSName()%></dd>
                            <dd id="dd_level">�¾ɳ̶ȣ�<%=item.getSLevel()%></dd>
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
