<%@ page import="org.bloodmoon.model.Item" %>
<%@ page import="org.bloodmoon.dao.ItemDao" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.bloodmoon.utils.DbUtil" %>

<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/4/13
  Time: 14:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" language="javascript">
    var sUname = <%=session.getAttribute("Username")%>
    if (sUname==null)
    {
        alert("您还没有登录，请登录！");
        window.document.location.href = "login.jsp";
    }
</script>
<html>
<head>
    <title>Title</title>
    <%
    String n1=(String) session.getAttribute("Username");
    if(n1==null){
        return;
    }
    Connection conn=null;
    Statement sql=null;
    ResultSet rs=null;
    DbUtil db=new DbUtil();
    conn=db.getCon();
    sql=conn.createStatement();//实例化Statement对象
    rs = sql.executeQuery("SELECT * FROM userinformation where username ='"+session.getAttribute("Username")+"'");
    while (rs.next()){
        String u = rs.getString(1);
        session.setAttribute("uid",u);
    }
    rs.close();
    sql.close();
    conn.close();
%><!-- 已获取uid:session.getAttribute("uid")-->
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String smContext=request.getParameter("context");
    int smSid = Integer.valueOf(request.getParameter("sid"));
    request.setCharacterEncoding("utf-8");
%>
<%
    ItemDao itemDao = new ItemDao();
    Item item = itemDao.getItemBySid(Integer.valueOf(request.getParameter("sid")));
    if(item!=null){

%><!-- 已获取商品详细信息-->

<%
    String sql2 = "insert into shopmessage(smUid,smSid,smUname,smContext) VALUES ('"+session.getAttribute("uid")+"','"+smSid+"','"+session.getAttribute("Username")+"','"+smContext+"')";
    Connection conn2=null;
    Statement stmt=null;
    conn2=db.getCon();
    try{
        //创建语句对象Statement
        stmt=conn2.createStatement();
        stmt.executeUpdate(sql2);

    } catch(SQLException e){
        e.printStackTrace();
    }finally {
        if (conn2!=null){
            try {
                conn2.close();
                conn2=null;
            }catch (Exception ex){
                ex.printStackTrace();
            }
        }
        if(stmt!=null){
            try {
                stmt.close();
                stmt=null;
            }catch (Exception ex){
                ex.printStackTrace();
            }
        }
    }
%>
<script type="text/javascript" language="javascript">
    alert("留言成功");
    window.document.location.href = "iteminfo.jsp?sid=<%=request.getParameter("sid")%>";
</script>
<%
    }
%>
</body>
</html>
