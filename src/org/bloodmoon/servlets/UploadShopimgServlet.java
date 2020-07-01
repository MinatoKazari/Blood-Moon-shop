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
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

@WebServlet("/UploadShopimgServlet")

public class UploadShopimgServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request,response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FileItemFactory factory = new DiskFileItemFactory();

        // 创建文件上传处理器
        ServletFileUpload upload = new ServletFileUpload(factory);

        // 开始解析请求信息
        List items = null;
        try {
            items = upload.parseRequest(request);
        }
        catch (FileUploadException e) {
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
                request.setAttribute(fieldName, value);
            }
            // 信息为文件格式
            else {
                SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSSS");//设置日期格式
                String time = df.format(new Date());
                String fileName = item.getName();//这里获取文件名字xxx.jpg||xxx.png....
                System.out.println(fileName+"（未修改）");
                fileName = "shopimg.png";
                System.out.println(fileName+"（未修改2）");
                StringBuilder sb = new StringBuilder(fileName);
                sb.insert(0,time);
                fileName = sb.toString();//给文件名处理
                System.out.println(fileName+"（已修改文件名）");//检查是否已修改文件名
                int index = fileName.lastIndexOf("\\");
                fileName = fileName.substring(index + 1);

                request.setAttribute("realFileName", fileName);
                String basePath = ("G:/DesignWordks/web/img/shopimage");// 路径：/web/img
                File file = new File(basePath, fileName);
                try {
                    item.write(file);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            request.setAttribute("msg", "文件上传成功!");
            getServletContext().getRequestDispatcher("/userArticleAdd2.jsp").forward(request, response);
        }
    }
}
