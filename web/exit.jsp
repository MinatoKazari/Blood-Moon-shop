<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/3/13
  Time: 20:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    session.invalidate();
%>
<script type="text/javascript" language="javascript">
    alert("已退出账号");
    window.document.location.href = "index.jsp";
</script>
</body>
</html>
