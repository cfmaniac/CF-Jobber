<%@ Page Language="C#" AutoEventWireup="true" %>

<%
    //
    // jQuery File Tree ASP Connector
    //
    // Version 1.0
    //
    // Copyright (c)2008 Andrew Sweeny
    // asweeny@fit.edu
    // 24 March 2008
    //
    Boolean bImg = false;
    if (HttpContext.Current.Request.QueryString["img"] == "yes") bImg=true;
        
    
    string dir;
    if(Request.Form["dir"] == null || Request.Form["dir"].Length <= 0)
        dir = "/";
    else
        dir = Server.UrlDecode(Request.Form["dir"]);
    
    string baseDir = Server.MapPath(dir);
    
    System.IO.DirectoryInfo di = new System.IO.DirectoryInfo(baseDir);
    Response.Write("<ul class=\"jqueryFileTree\" style=\"display: none;\">\n");
    foreach (System.IO.DirectoryInfo di_child in di.GetDirectories())
        Response.Write("\t<li class=\"directory collapsed\"><a href=\"#\" rel=\"" + dir + di_child.Name + "/\">" + di_child.Name + "</a></li>\n");
    foreach (System.IO.FileInfo fi in di.GetFiles())
    {
        string ext = ""; 
        if(fi.Extension.Length > 1)
            ext = fi.Extension.Substring(1).ToLower();

        if (bImg && (ext == "jpeg" || ext == "jpg" || ext == "png" || ext == "gif"))
        {
            Response.Write("\t<li class=\"file ext_" + ext + "\"><a href=\"#\" rel=\"" + dir + fi.Name + "\">" + fi.Name + "</a></li>\n");
        }
        else if (!bImg)
        {
            Response.Write("\t<li class=\"file ext_" + ext + "\"><a href=\"#\" rel=\"" + dir + fi.Name + "\">" + fi.Name + "</a></li>\n");
        }
          
    }
    Response.Write("</ul>");
 %>