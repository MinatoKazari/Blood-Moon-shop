<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="org.bloodmoon.utils.DbUtil" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/3/24
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String sname = request.getParameter("sname");
    String slevel = request.getParameter("slevel");
    String sremark = request.getParameter("sremark");
    String sprices = request.getParameter("sprices");
    String sort1 = request.getParameter("sort1");
    String slocationf = request.getParameter("slocationf");
    String slocations = request.getParameter("slocations");
    String slocationt = request.getParameter("slocationt");
    String type = request.getParameter("type");
    String simg = request.getParameter("simg");
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
    String createtime = df.format(new java.util.Date());
    request.setCharacterEncoding("utf-8");
%>

<% //修改sDisplay属性为待审核。
    String sql = "insert into shopinformation(sName,sLevel,sRemark,sPrices,sSort1,sLocationF,sLocationS,sLocationT,sDisplay,sTransaction,sUid,sUname,sImage1,createtime) " +
            "VALUES ('"+sname+"','"+slevel+"','"+sremark+"','"+sprices+"','"+sort1+"','"+slocationf+"','"+slocations+"','"+slocationt+"','待审核','"+type+"','"+session.getAttribute("uid")+"','"+session.getAttribute("Username")+"','"+simg+"','"+createtime+"')";
    Connection conn=null;
    Statement stmt=null;
    try{
        DbUtil db= new DbUtil();
        conn= db.getCon();
        out.println(createtime);
        //创建语句对象Statement
        stmt=conn.createStatement();
        stmt.executeUpdate(sql);
    } catch(SQLException e){
        e.printStackTrace();
    }finally {
        if (conn!=null){
            try {
                conn.close();
                conn=null;
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
    alert("发布商品成功");
    window.document.location.href = "user.jsp";
</script>
</body>
</html>
