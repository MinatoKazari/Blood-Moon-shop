<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/4/14
  Time: 18:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script language="javascript">
    function on_submit(){
        if(form1.context.value==""){
            alert("请填写反馈信息！");
            form1.context.focus();
            return false;
        }
    }
</script>
<html>
<head>
    <title>审核不通过</title>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        .form{
            width: 620px;
            height: 400px;
            position: absolute;
            left: 36%;
            top: 25%;
        }
        .back{
            height: 40px;
            width: 65px;
            position: absolute;
            bottom: 27px;
            left: 74%;
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
        .btn{
            height: 40px;
            width: 65px;
            position: absolute;
            left: 89%;
            bottom: 27px;
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
<div class="form">
    <form id="form1" action="NotpassitemServlet?sid=<%=request.getParameter("sid")%>" method="post" onSubmit="return on_submit()">
        <h1>请填写理由：</h1>
        <center>
            <dd><textarea name="context" id="context" cols="50" rows="10" style="font-size: 24px"></textarea><br></dd>
        </center>
        <a href="GLYcheckiteminfo.jsp?sid=<%=request.getParameter("sid")%>"><input type="button" class="back" value="返回"></input> </a> <input type="submit" class="btn" value="提交"></input>
    </form>
</div>
</body>
</html>
