<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/4/12
  Time: 18:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script language="javascript">
    function on_submit()
    {
        if (form1.ugodealinfo.value == "")
        {
            alert("物流信息不能为空！");
            form1.ugodealinfo.focus();
            return false;
        }
        if(confirm('确认物流信息无误吗？确定发货？')){
            return true;
        }else {
            return false;
        }
    }
</script>
<html>
<head>
    <%
        Object message = session.getAttribute("msg");
        if(message!=null&&!"".equals(message)){
    %>
    <script type="text/javascript">
        alert("<%=message%>")
    </script>
    <%session.setAttribute("msg","");
    }%>
    <title>商品发货</title>
    <style>
        .win1{
            width: 700px;
            height: 300px;
            background: azure;
            position: absolute;
            top: 25%;
            left: 32%;
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
        .btn{
            width: 120px;
            height: 43px;
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
            top: 67%;
            left: 60%;
        }
        .btn2{
            width: 120px;
            height: 43px;
            border: 1px solid #fff;
            border-radius: 3rem;
            background:hotpink;
            box-shadow: 0 0 8px rgb(243, 240, 254);
            cursor: pointer;
            font-size: 22px;
            color: #fff;
            margin-top: 25px;
            font-family: "neo";
            transition: .25s;
            position: absolute;
            top: 67%;
            left: 23%;
        }
    </style>
</head>
<body>
    <div class="win1">
        <center>
        <form id="form1" action="DelivergoodsServlet?ugoid=<%=request.getParameter("ugoid")%>" method="post" onSubmit="return on_submit()">
            <a style="position:relative;left: -223px;font-size: 17px">订单编号:<input type="number" name="ugoid" id="ugoid" value="<%=request.getParameter("ugoid")%>" readonly="readonly"></a><br>
            <a style="position: relative;top: 90px;font-size: 24px">请输入物流信息:<input type="text" name="ugodealinfo" id="ugodealinfo" maxlength="254" placeholder="不能为空,如果是虚拟物品请备注" style="width: 510px;height: 35px;position: relative;top: -3px;"></a>
            <input type="submit" value="发货" class="btn">
            <dd><a href="userDelivergoods.jsp"><input type="button" class="btn2" value="返回"></a></dd>
        </form>
        </center>
    </div>
</body>
</html>
