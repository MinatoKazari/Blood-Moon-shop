<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/4/10
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script language="javascript">
    function on_submit(){
        if(form1.sprices.value==""){
            alert("价格不能为空！");
            form1.sprices.focus();
            return false;
        }
    }
</script>
<html>
<head>
    <title>更新商品价格</title>
    <style>
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
            width: 120px;
            height: 43px;
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
            top: 150%;
            left: 60%;
        }
        #btn1{
            width: 120px;
            height: 43px;
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
            top: 150%;
            left: -2%;
        }
    </style>
</head>
<body>
    <div>
        <form name="form1" action="UpdateitempriceServlet?sid=<%=request.getParameter("sid")%>" method="post" onSubmit="return on_submit()" style="position: absolute;top: 40%;left: 40%;">
            <a>请输入新的价格:<input type="number" name="sprices" id="sprices" min="1" placeholder="不能为空"></a>
            <input type="submit" value="提交" id="btn">
            <input type="button" value="返回" id="btn1" onclick="back()">
        </form>
    </div>
</body>
<script>
    function back() {
        window.location.href='useriteminfo.jsp?sid=<%=request.getParameter("sid")%>';
    }
</script>
</html>
