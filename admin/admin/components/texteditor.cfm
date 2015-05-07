<!--- Any page that needs a texteditor needs to include this file --->

<script src="/admin/live-editor/scripts/innovaeditor.js" type="text/javascript"></script>
<script src="/admin/live-editor/scripts/innovamanager.js" type="text/javascript"></script>
<script src="http://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js" type="text/javascript"></script>
<script src="/admin/live-editor/scripts/common/webfont.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function () {
  $('#live-editor').liveEdit({
    height: 300,
    width: '81.5%',
    fileBrowser: '/admin/live-editor/assetmanager/asset.php',
    pasteTextOnCtrlV: true,
    css: ['/admin/live-editor/bootstrap/css/bootstrap.min.css', '/admin/live-editor/bootstrap/bootstrap_extend.css'] /* Apply bootstrap css into the editing area */,
    groups: [      
      ["group2", "", ["Bullets", "Numbering", "Indent", "Outdent"]],      
      ["group4", "", ["LinkDialog", "ImageDialog", "TableDialog"]],
      ["group5", "", ["SourceDialog"]]
    ] /* Toolbar configuration */
  });  
  $('#live-editor').data('liveEdit').startedit();
});
function save() {
  var sHtml = $('#live-editor').data('liveEdit').getXHTMLBody(); //Use before finishedit()
  alert(sHtml); /*You can use the sHtml for any purpose, eg. saving the content to your database, etc, depend on you custom app */
}
</script>


