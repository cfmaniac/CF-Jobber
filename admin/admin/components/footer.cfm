     		</div>
    	</div>
  		<div class="row-fluid">
  			<div id="footer" class="span12 <cfif cgi.script_name is not "/admin/login.cfm">well</cfif>">
  				<em>Powered by</em>&nbsp;<a href="http://www.icoastalnet.com/" target="_blank">ICND</a>
  				<p>For help and support send all requests to <a href="mailto:support@icoastalnet.com">support@icoastalnet.com</a></p>
  				
  				<!--- If you are logged in as 'admin' or ICND member you can view documentation on the admin template; clients should not be seeing this --->
  				<cfif isdefined('cookie.LoggedInRole') and cookie.LoggedInRole is 'icnd'>
  				  <a href="/admin/_Unicorn-Base/documentation/" target="_blank">Admin Documentation</a><br />
  				  <a href="/admin/_Unicorn-Base/html/" target="_blank">Admin Demo</a><br />
  				  <a href="http://twitter.github.com/bootstrap/" target="_blank">Twitter Bootstrap</a><br />
  				  <a href="http://bootstrap-forms.heroku.com/" target="_blank">Bootstrap Form Builder</a>
  				</cfif>
  				
  		  </div>
  		</div>
    </div>
	</div>
</div>





<!--- These are included on all pages --->
<script src="/admin/bootstrap/js/jquery.ui.custom.js"></script>
<script src="/admin/bootstrap/js/bootstrap.min.js"></script>
<script src="/admin/bootstrap/js/jquery.uniform.js"></script>
<script src="/admin/bootstrap/js/select2.min.js"></script>
<script src="/admin/bootstrap/js/jquery.dataTables.min.js"></script>
<script src="/admin/bootstrap/js/unicorn.js"></script>
<script src="/admin/bootstrap/js/unicorn.tables.js"></script>
<script src="/admin/bootstrap/js/jquery.validate.js"></script>
<script src="/admin/bootstrap/js/unicorn.form_validation.js"></script>

<!--- To implement, add data-confirm="Are you sure you want to delete this?" to href --->
<script type="text/javascript">

/* This is for the confirm modal for deleting leads */
$(document).ready(function() {
	$('a[data-confirm]').click(function(ev) {
		var href = $(this).attr('href');
		if (!$('#dataConfirmModal').length) {
			$('body').append('<div id="dataConfirmModal" class="modal" role="dialog" aria-labelledby="dataConfirmLabel" aria-hidden="true"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button><h3 id="dataConfirmLabel">Please Confirm</h3></div><div class="modal-body"></div><div class="modal-footer"><button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button><a class="btn btn-primary" id="dataConfirmOK">OK</a></div></div>');
		} 
		$('#dataConfirmModal').find('.modal-body').text($(this).attr('data-confirm'));
		$('#dataConfirmOK').attr('href', href);
		$('#dataConfirmModal').modal({show:true});
		return false;
	});
});


</script>



</body>
</html>

