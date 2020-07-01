package org.bloodmoon.servlets;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import static java.lang.System.out;

@WebServlet(name = "UpdateitemimgServlet")
public class UpdateitemimgServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        out.println("doPost");
        String sid = req.getParameter("sid");
        FileItemFactory factory = new DiskFileItemFactory();

        // 创建文件上传处理器
        ServletFileUpload upload = new ServletFileUpload(factory);

        // 开始解析请求信息
        List items = null;
        try {
            items = upload.parseRequest(req);
        } catch (FileUploadException e) {
            e.printStackTrace();
        }

        // 对所有请求信息进行判断
        Iterator iter = items.iterator();
        while (iter.hasNext()) {
            FileItem item = (FileItem) iter.next();
            // 信息为普通的格式
            if (item.isFormField()) {
                String fieldName = item.getFieldName();
                String value = item.getString();
                req.setAttribute(fieldName, value);
            }
            // 信息为文件格式
            else {
                SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSSS");//设置日期格式
                String time = df.format(new Date());

                String fileName = item.getName();//这里获取文件名字xxx.jpg||xxx.png....
                System.out.println(fileName+"（未修改）");
                fileName="shopimg.png";
                StringBuilder sb = new StringBuilder(fileName);
                sb.insert(0,time);//文件名开头插入时间戳
                fileName = sb.toString();//给文件名处理
                System.out.println(fileName+"（已修改文件名）");//检查是否已修改文件名

                int index = fileName.lastIndexOf("\\");
                fileName = fileName.substring(index + 1);
                req.setAttribute("realFileName", fileName);
                String basePath = ("G:/DesignWordks/web/img/shopimage");
                File file = new File(basePath, fileName);
                try {
                    item.write(file);//图片上传完成
                    //-----------------------------------
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            getServletContext().getRequestDispatcher("/EXupdateitemimg.jsp?sid="+sid).forward(req, resp);
        }//至此商品图片文件上传完成
    }
}