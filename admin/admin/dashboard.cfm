<cfset page.title ="Dashboard">

<cfquery name="totalContacts" dataSource="#dsn#">
  select `id` from contacts
</cfquery>

<cfinclude template="/admin/components/header.cfm">

<cfoutput>
  	
    <div class="alert alert-info">
      Welcome to your website's control panel. Use the navigation on the left to access each module.  Use the top right buttons to update your profile
      or manage your site's contact information.
      <a href="##" data-dismiss="alert" class="close">x</a>
    </div>
						 		
  	<div class="row-fluid">
  		<div class="span12">  			
  			<div class="widget-box">
  			   
  			  
						 
  				<div class="widget-title"><span class="icon"><i class="icon-signal"></i></span><h5>Site Statistics</h5><div class="buttons"><a href="javascript:;" onclick="window.location.reload();" class="btn btn-mini" id="fetchSeries"><i class="icon-refresh"></i> Update stats</a></div></div>
  				<div class="widget-content">
  					<div class="row-fluid">
  					<div class="span4">
  						<ul class="site-stats">
  							<li><i class="icon-comment"></i> <strong>#totalContacts.recordcount#</strong> <small>Total Contacts</small></li>
  						</ul>
  					</div>
  					<div class="span8">  						
  						<cfinclude template="/admin/components/generate-contacts-graph.cfm"> 						  						
  					</div>	
  					</div>							
  				</div>
  			</div>					
  		</div>
  	</div>
  	</cfoutput> 
  	
  	<!--- Start Blog Stuff --->
  	<!---
<cfif recentposts.recordcount gt 0>
  	<div class="row-fluid">
  		<div class="span6">
  			<div class="widget-box">
  				<div class="widget-title"><span class="icon"><i class="icon-file"></i></span><h5>Recent Posts</h5><span title="54 total posts" class="label label-info tip-left"><cfoutput>#totalposts.numrows#</cfoutput></span></div>
  				<div class="widget-content nopadding">
  					<ul class="recent-posts">
  					
  					<cfoutput query="recentposts">
  						<li>
  							<div class="user-thumb">
  							  
  							  <cfif len(mainphoto)>
  							   <img src="/images/blog/icon/#mainphoto#">
  							  <cfelse>
  							   <img src="http://placehold.it/40x40">
  							  </cfif> 
  								
  							</div>
  							<div class="article-post">
  								<span class="user-info"> By: #name# on #DateFormat(thedate,'mm/dd/yyyy')# @ #TimeFormat(thedate,'hh:mm')# </span>
  								<p><a href="/admin/blog">#title#</a></p>  								
  							</div>
  						</li>
  				   </cfoutput>
  						
  						<li class="viewall">
  							<a title="View all posts" class="tip-top" href="/admin/blog"> + View all + </a>
  						</li>
  					</ul>
  				</div>
  			</div>
  		</div>
  		</cfif>
--->
  		<!--- End Blog Stuff --->
  
<cfinclude template="components/footer.cfm">

<script src="/admin/bootstrap/js/excanvas.min.js"></script>
<script src="/admin/bootstrap/js/jquery.min.js"></script>
<script src="/admin/bootstrap/js/jquery.ui.custom.js"></script>
<script src="/admin/bootstrap/js/bootstrap.min.js"></script>
<script src="/admin/bootstrap/js/jquery.flot.min.js"></script>
<script src="/admin/bootstrap/js/jquery.flot.resize.min.js"></script>
<script src="/admin/bootstrap/js/jquery.peity.min.js"></script>
<script src="/admin/bootstrap/js/fullcalendar.min.js"></script>
<script src="/admin/bootstrap/js/unicorn.js"></script>