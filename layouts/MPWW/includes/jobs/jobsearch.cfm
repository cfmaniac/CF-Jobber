<cfscript>
  rc.JobCats = rc.JobsCom.getJobCategories();
</cfscript>
<cfoutput>
<div class="main-left-top">
  	<h2></h2>
  	<h2></h2>
  	<h2></h2>
  	<h2></h2>
  	<cfif structKeyExists(session, 'loggedin') and session.loggedin is 'true'>
  	<h2>Welcome Back #session.username#</h2>
  	  
     <a href="index.cfm?view=account&user=#session.userid#" class="online">My Account</a>
     <a href="index.cfm?view=logout" class="online">Logout</a>
    <cfelse>
      <div class="clear"></div> 
      <a href="index.cfm?view=login" class="online">ACCOUNT LOGIN</a>
	   <a href="index.cfm?view=register" class="online">REGISTER</a>
      
    </cfif>
  	
  	
  	
   <div class="clear"></div> 
</div> <!--- end of main-left-top --->
  
         		
<div class="clear"></div>
</cfoutput>
<script>
    //Equalizes the Height of this Div:
    var SetHeight = $('div.interior').height();
    $('div.main-left-top').height(SetHeight);
</script> 
