<%@ page import="org.bloodmoon.model.Item" %>
<%@ page import="org.bloodmoon.dao.ItemDao" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.IOException" %>
<%@ page import="org.bloodmoon.utils.DbUtil" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/4/12
  Time: 22:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" language="javascript">
        var sUname = <%=session.getAttribute("Username")%>
        if (sUname==null)
        {
            alert("您还没有登录，请登录！");
            window.document.location.href = "login.jsp";
        }
    </script>
    <%
    String n1=(String) session.getAttribute("Username");
    if(n1==null){
        return;
    }
    Connection conn=null;
    Statement sql=null;
    ResultSet rs=null;
    try{
    DbUtil db= new DbUtil();
    conn= db.getCon();
    sql=conn.createStatement();//实例化Statement对象
    rs = sql.executeQuery("SELECT * FROM userinformation where username ='"+session.getAttribute("Username")+"'");
    while (rs.next()){
        String u = rs.getString(1);
        session.setAttribute("uid",u);
    }
    rs.close();
    sql.close();
    conn.close();
    }catch (Exception e){
        out.print(e);
    }finally{
        if (conn!=null){
            try {
                conn.close();
                conn=null;
            }catch (Exception ex){
                ex.printStackTrace();
            }
        }
        if(sql!=null){
            try {
                sql.close();
                sql=null;
            }catch (Exception ex){
                ex.printStackTrace();
            }
        }
        if(rs!=null){
            try {
                rs.close();
                rs=null;
            }catch (Exception ex){
                ex.printStackTrace();
            }
        }
    }
%><!-- 已获取uid:session.getAttribute("uid")-->


    <!--检测该商品是否已经被用户收藏过了-->
    <% Connection conn3=null;
        Statement sql3=null;
        ResultSet rs3=null;
        try{
            DbUtil db= new DbUtil();
            conn3= db.getCon();
            sql3=conn3.createStatement();//实例化Statement对象
            rs3 = sql3.executeQuery("select count(*) from userfavourite where ufSid = '"+request.getParameter("sid")+"'AND ufUid='"+session.getAttribute("uid")+"'");
            while (rs3.next()){
            int count = rs3.getInt(1);
            if(count>=1){
                System.out.println("该商品已被收藏过了");%>
    <script type="text/javascript" language="javascript">
    alert("该商品已被收藏过了");
    window.document.location.href = "iteminfo.jsp?sid=<%=request.getParameter("sid")%>";
    </script>
    <%
                return;
            }
        }
            rs3.close();
            sql3.close();
            conn3.close();
    }catch (IOException e){
        e.printStackTrace();
    }finally {
        if (conn3!=null){
            try {
                conn3.close();
                conn3=null;
            }catch (Exception ex){
                ex.printStackTrace();
            }
        }
        if(sql3!=null){
            try {
                sql3.close();
                sql3=null;
            }catch (Exception ex){
                ex.printStackTrace();
            }
        }
        if(rs3!=null){
            try {
                rs3.close();
                rs3=null;
            }catch (Exception ex){
                ex.printStackTrace();
            }
        }
    }

    %>
    <title>Title</title>
</head>
<body>

<%
    ItemDao itemDao = new ItemDao();
    Item item = itemDao.getItemBySid(Integer.valueOf(request.getParameter("sid")));
    if(item!=null){

%><!-- 已获取商品详细信息-->

<%
    request.setCharacterEncoding("utf-8");
    int ufSid = Integer.valueOf(request.getParameter("sid"));
    String ufSimg = item.getSImage1();
    int ufSlevel = item.getSLevel();
    int ufSprice = item.getSPrices();
    String ufSname = item.getSName();
    request.setCharacterEncoding("utf-8");
%>

<%
    String sql2 = "insert into userfavourite(ufSid,ufSimg,ufSname,ufSlevel,ufSprice,ufUid)" +
            " VALUES ('"+ufSid+"','"+ufSimg+"','"+ufSname+"','"+ufSlevel+"','"+ufSprice+"','"+session.getAttribute("uid")+"')";
    Connection conn2=null;
    Statement stmt=null;
    DbUtil db=new DbUtil();
    conn2=db.getCon();
    //创建语句对象Statement
    stmt=conn2.createStatement();
    try{
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
    alert("收藏成功");
    window.document.location.href = "iteminfo.jsp?sid=<%=request.getParameter("sid")%>";
</script>
<%
    }
%>
</body>
</html>
