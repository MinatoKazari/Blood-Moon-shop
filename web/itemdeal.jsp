<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="org.bloodmoon.dao.ItemDao" %>
<%@ page import="org.bloodmoon.model.Item" %>
<%@ page import="org.bloodmoon.utils.DbUtil" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/4/12
  Time: 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script language="javascript">
    function on_submit() {
        if (form1.address.value == "")
        {
            alert("请填写收货地址！");
            form1.address.focus();
            return false;
        }
        if(confirm('请确认订单信息无误后再付款！')){
            return true;
        }else {
            return false;
        }
    }
</script>
<html>
<head>
    <title>付款</title>
    <script type="text/javascript" language="javascript">
        var sUname = <%=session.getAttribute("Username")%>
        if (sUname==null)
        {
            alert("您还没有登录，请登录！");
            window.document.location.href = "login.jsp";
        }
    </script>
    <style>
        #orderwindow{
            width: 1300px;
            height: 433px;
            background: ghostwhite;
            position: absolute;
            top: 115px;
            left: 290px;
            margin: 20px;
        }
        #orderwindow form dd{
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
            width: 110px;
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
            top: 345px;
            left: 673px;
        }
        #btn2{
            width: 110px;
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
            top: 345px;
            left: 512px;
        }
    </style>
</head>
<body>
<%
    Connection conn=null;
    Statement sql=null;
    ResultSet rs=null;
    DbUtil db=new DbUtil();
    conn=db.getCon();
    sql=conn.createStatement();//实例化Statement对象
    rs = sql.executeQuery("SELECT * FROM userinformation where username ='"+session.getAttribute("Username")+"'");
    try{
    while (rs.next()){
        String u = rs.getString(1);
        session.setAttribute("uid",u);
    }
    rs.close();
    sql.close();
    conn.close();
    }catch (Exception ex){
        ex.printStackTrace();
    }finally{
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
%><!-- 已获取uid:session.getAttribute("uid")-->
<div id="orderwindow">
    <h1 style="    position: relative;left: 160px;">提交购买订单</h1>
    <!-- 商品详情  -->
    <%
        ItemDao itemDao = new ItemDao();
        Item item = itemDao.getItemBySid(Integer.valueOf(request.getParameter("sid")));
        if(item!=null){
    %>
    <center>
    <form id="form1" action="SubmitorderServlet" method="post" onsubmit="return on_submit()">
        <dd>买家id：<input type="text" name="uidb" id="uidb" value="<%=session.getAttribute("uid")%>" readonly="readonly"><br></dd>
        <dd>卖家id：<input type="text" name="uids" id="uids" value="<%=item.getSUid()%>" readonly="readonly"><br></dd>
        <dd>商品id：<input type="text" name="sid" id="sid" value="<%=item.getSid()%>" readonly="readonly"><br></dd>
        <dd>商品名：<input type="text" name="sName" id="sName" value="<%=item.getSName()%>" readonly="readonly"><br></dd>
        <dd>成交价格：<input type="text" name="sPrice" id="sPrice" value="<%=item.getSPrices()%>" readonly="readonly" style="width: 157px"><br></dd>
        <%
            }
        %>
        <%
            Connection conn2=null;
            Statement sql2=null;
            ResultSet rs2=null;
            conn2=db.getCon();
            sql2=conn2.createStatement();//实例化Statement对象
            rs2 = sql2.executeQuery("SELECT * FROM userinformation where username ='"+session.getAttribute("Username")+"'");
            try{
        %>
        <% while (rs2.next()) { %>
        <dd style="left: 62px;position: relative;">收货地址：<input type="text" name="address" maxlength="150" value="<%out.print(rs2.getString(13));%><%out.print(rs2.getString(14));%><%out.print(rs2.getString(15));%><%out.print(rs2.getString(16));%>" id="address" placeholder="不能为空"style="width: 280px"><br></dd>
        <% } %>
        <%
            rs2.close();
            sql2.close();
            conn2.close();
            }catch (Exception ex){
                ex.printStackTrace();
            }finally{
                if(rs2!=null){
                    try{
                        rs2.close();
                        rs2=null;
                    }catch (Exception e){
                        e.printStackTrace();
                    }
                }
                if(sql2!=null){
                    try{
                        sql2.close();
                        sql2=null;
                    }catch (Exception e){
                        e.printStackTrace();
                    }
                }
                if(conn2!=null){
                    try{
                        conn2.close();
                        conn2=null;
                    }catch (Exception e){
                        e.printStackTrace();
                    }
                }
            }
        %>
        <input type="submit" value="付款" id="btn"><input type="button" value="返回" id="btn2" onclick="back()">
    </form>
    </center>
</div>
</body>
<script>
    function back() {
        window.location.href='iteminfo.jsp?sid=<%=request.getParameter("sid")%>';
    }
</script>
</html>
