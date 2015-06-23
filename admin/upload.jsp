<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%/*@page import="com.oreilly.servlet.MultipartRequest"*///需import java.io.*%>
<%@page import="com.jspsmart.upload.*"%>
<%@include file="db_link.jsp"%>
<jsp:useBean id="theSmartUpload" scope="page" class="com.jspsmart.upload.SmartUpload"/>
<html>
<style type="text/css">
body {
  background-color: #CDC0A0;
  padding-top: 15%;
}
</style>
<head>
<title></title></head>
<body>
	<%
    request.setCharacterEncoding("UTF-8");
    try{
      if(con.isClosed())
        out.print("資料庫關閉");
      else {
          //smartUpload上傳方式
          theSmartUpload.initialize(pageContext);
          theSmartUpload.setTotalMaxFileSize(1024*1024*1024);
          //theSmartUpload.setAllowedFileList("txt,htm,jpg,png,pdf");
          theSmartUpload.upload();
          try{
            String savePath="Library/Tomcat/webapps/ROOT/database/doll/";
            int fileCount=theSmartUpload.save(savePath);
            out.println("成功上傳數目："+fileCount);
            Files theFiles=theSmartUpload.getFiles();
            out.println("<br>");
            out.println("======================");
            for(int i=0;i<theFiles.getCount();i++){
              File theFile=theFiles.getFile(i);
              out.println("欄位名稱："+theFile.getFieldName()+"<br>");
              out.println("檔案名稱："+theFile.getFileName()+"<br>");
              out.println("副檔名："+theFile.getFileExt()+"<br>");
              out.println("檔案路徑："+theFile.getFilePathName()+"<br>");
              out.println("檔案型態："+theFile.getContentType()+"<br>");
              out.println("檔案大小："+theFile.getSize()+"<br>");
              out.println("<br>");
              theFile.saveAs("Library/Tomcat/webapps/ROOT/database/doll/"+theFile.getFileName(),theSmartUpload.SAVE_AUTO);
              out.println("以複製一份檔案至"+"Library/Tomcat/webapps/ROOT/database/doll/"+theFile.getFileName());
              out.println("<br>");
              out.println("===================================");
              String thePath="doll/"+theFile.getFileName();
              sql="use dollseller";
              con.createStatement().execute(sql);      
              sql="select * from product"; 
              ResultSet rs=con.createStatement().executeQuery(sql);
              rs.last();
              int count=rs.getRow();
              count++;
              sql="INSERT INTO `product`( `Product_ID` , `pic_position`) VALUES ('"+count+"','"+thePath+"')";
              con.createStatement().execute(sql);
            }
          }catch(Exception e){
            String savePath="C:\\xampp\\tomcat\\webapps\\ROOT\\doll\\";//(此為windows路徑)
            int fileCount=theSmartUpload.save(savePath);
            out.println("成功上傳數目："+fileCount);
            Files theFiles=theSmartUpload.getFiles();
            out.println("<br>");
            out.println("======================");
            for(int i=0;i<theFiles.getCount();i++){
              File theFile=theFiles.getFile(i);
              out.println("欄位名稱："+theFile.getFieldName()+"<br>");
              out.println("檔案名稱："+theFile.getFileName()+"<br>");
              out.println("副檔名："+theFile.getFileExt()+"<br>");
              out.println("檔案路徑："+theFile.getFilePathName()+"<br>");
              out.println("檔案型態："+theFile.getContentType()+"<br>");
              out.println("檔案大小："+theFile.getSize()+"<br>");
              out.println("<br>");
              theFile.saveAs("C:\\xampp\\tomcat\\webapps\\ROOT\\doll\\"+theFile.getFileName(),theSmartUpload.SAVE_AUTO);//(此為windows路徑)
              out.println("以複製一份檔案至"+"C:\\xampp\\tomcat\\webapps\\ROOT\\doll\\"+theFile.getFileName());//(此為windows路徑)
              out.println("<br>");
              out.println("===================================");
              String thePath="doll/"+theFile.getFileName();
              sql="use dollseller";
              con.createStatement().execute(sql);      
              sql="select * from product"; 
              ResultSet rs=con.createStatement().executeQuery(sql);
              rs.last();
              int count=rs.getRow();
              count++;
              sql="INSERT INTO `product`( `Product_ID` , `pic_position`) VALUES ('"+count+"','"+thePath+"')";
              con.createStatement().execute(sql);
            }
          }
                     //com.oreilly.servlet.MultipartRequest上傳方式
                     /*MultipartRequest up = new MultipartRequest(request,"Library/Tomcat/webapps/ROOT/database/doll/",1024*1024*1024);//C:\\Program Files\\Apache Software Foundation\\Tomcat 6.0\\webapps\\ROOT\\jsproot\\img\\(此為windows路徑)
                    Enumeration theEnumeration=up.getFileNames();
                      out.print(up.getFileNames().nextElement());
                      //out.print("<br>"+up.getFilesystemNames());
                      String fieldName=(String)up.getFileNames().nextElement();
                      String fileName=up.getFilesystemName(fieldName);
                      String contentType=up.getContentType(fieldName);
                      String thePath="doll/"+fileName;
                      File theFile=up.getFile(fieldName);
                      out.print("====================<br>");
                      out.print("欄位名稱："+fieldName+"<br>");
                      out.print("檔案名稱："+fileName+"<br>");
                      out.print("檔案形態："+contentType+"<br>");
                      out.print("檔案路徑："+theFile.getAbsolutePath()+"<br>");*/
                      con.close();
                      response.sendRedirect("putOn.jsp");
                }
              }catch(Exception e){
                out.print(e.getMessage());
              }
		
%>
</body>
</html>