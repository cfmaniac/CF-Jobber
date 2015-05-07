<%@ WebHandler Language="VB" Class="UploadVB" %>

Imports System
Imports System.Web
Imports System.IO

Public Class UploadVB : Implements IHttpHandler
    
    Private Const UPLOAD_FILE_TYPES as String = "jpg|jpeg|gif|png|txt|pdf|zip" 
    
    Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
    
        Dim postedFile As HttpPostedFile = context.Request.Files("Filedata")

        Dim savepath As String = ""
        Dim tempPath As String = context.Request("folder")
        Dim allowedTypes as String = "|" & UPLOAD_FILE_TYPES & "|"

        
        Dim ext as String = System.IO.Path.GetExtension(postedFile.FileName).substring(1)
        
        If allowedTypes.indexOf("|" & ext & "|") < 0 then
            context.Response.Write("Invalid file type")
            context.Response.StatusCode = 200
            return
        end if
        
        
        savepath = context.Server.MapPath(tempPath)
        Dim filename As String = postedFile.FileName
        If Not Directory.Exists(savepath) Then
            Directory.CreateDirectory(savepath)
        End If

        postedFile.SaveAs((savepath & "\") + filename)
        'context.Response.Write((tempPath & "/") + filename)
        context.Response.StatusCode = 200
        
        context.Response.write("<script>parent.refresh();</script>")
    End Sub
 
    Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property

End Class