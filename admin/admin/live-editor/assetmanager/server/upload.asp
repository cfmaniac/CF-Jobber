<!-- #include file="uploader.asp" -->
<%
on error resume next

Dim savefile
Dim tempFile
dim UploadifyObject

tempPath = Request("folder")
savePath = Server.MapPath(tempPath)

Set UploadifyObject = New Uploader

UploadifyObject.allowedTypes = "jpg|jpeg|gif|png|txt|pdf|zip"

UploadifyObject.Save(savePath) 'D:\inetpub\...\images"

Response.Write("<HTML><HEAD><script>parent.refresh();</script></HEAD>" & savePath & "<BODY></BODY></HTML>")
%>