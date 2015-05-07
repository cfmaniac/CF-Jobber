<cfscript>
   rc.JobsCom = createObject('component','com.jobs').init(); //The Jobs Component
   rc.ShowSearch = '1';
   rc.ShowAdverts = '0';
   rc.ShowFeatured = '0';
   
   if(isdefined('url.view') and url.view NEQ '') {
      view = #url.view#;
     
      if(url.view is "logout"){
         structClear(session);
         session.loggedin = 'false';
         session.username = 'guest';
         session.userid = '0';
         location(url='index.cfm', addtoken='false');
      }
     
     
      if (isdefined('url.id')) {
         rc.Jobs = rc.JobsCom.GetView(view = #view#, id = #id#);
      } else {
         rc.Jobs = rc.JobsCom.GetView(view = #view#);
      }
   
      } else {
         view = 'default';
         if(rc.ShowFeatured) {
            rc.Featured = rc.JobsCom.GetFeatured();
         }
         rc.Jobs = rc.JobsCom.GetDefault();

      }

   
</cfscript>
<cfoutput>

<!--- 
<div id="content" style="min-height: 227px;">

 
  
 
</div>--->
                	<div class="interior">
                    	<div class="interior-left" style="padding: 0 0 0 25px;">
                    	<!---Main Content--->      
                     <h2>
                     <cfswitch expression="#view#">
      
                           <cfdefaultcase>
                            Available Jobs (#numberFormat(rc.jobs.RecordCount)#)
                           </cfdefaultcase>
                           <cfcase value="job">
                              Viewing Job : #rc.Jobs.Title#
                           </cfcase>
                           <cfcase value="apply">
                              Apply for Job : #rc.Jobs.Title#
                           </cfcase>
                           <cfcase value="login">
                              Login to your Account
                           </cfcase>
                           <cfcase value="register">
                              Register
                           </cfcase>
                           <cfcase value="account">
                              My Account
                           </cfcase>
                     </cfswitch>
                     </h2>   	
                     <div class="inner" style="padding: 0; margin-left: -10px;">
                     <cfswitch expression="#view#">
           <cfdefaultcase>
           <cfif rc.ShowFeatured>
           <!---Featured JObs --->
           <cfif rc.Featured.recordCount GT 0>
            <div class="heading-l">
            <h2> Featured Jobs </h2>
           </div>
            <div class="clear"></div>
             <div id="job-content-fields">
             <div id="list" class="view_mode">
               <cfloop Query="#rc.Featured#">
               <cfinclude template="jobs/jobFeatured.cfm">
               
               </cfloop>
               
               
             </div>
        </div>
        <div class="clear"></div>
        </cfif> 
        </cfif>  
           <!---Standard Job Listings--->
           <div class="heading-l">
           
           </div>
        <div class="clear"></div>
          <div id="job-content-fields">
          <div id="list" class="view_mode">
            <cfloop Query="#rc.Jobs#">
            <cfinclude template="jobs/jobListings.cfm">
            
            </cfloop>
            
            
          </div>
        </div>
        <div class="clear"></div>
        </cfdefaultcase>
        
        <cfcase value="search">
           
        </cfcase>   
        <cfcase value="job">
           <cfinclude template="jobs/jobDesc.cfm">
           
        </cfcase>   
        <cfcase value="apply">
           <cfinclude template="jobs/jobApply.cfm">
        </cfcase>
       
        <!---//User Views--->
        <cfcase value="login">
           <cfinclude template="users/login.cfm">
        </cfcase>
        
        <cfcase value="register">
           <cfinclude template="users/register.cfm">
        </cfcase>
        
        <cfcase value="account">
           <cfinclude template="users/account.cfm">
        </cfcase>
        </cfswitch>
                     </div>
                     <!---End Main Content--->                                
                     </div>
                    <div class="interior-right">
                    	 
                    <div class="clear"></div>
                    </div>
                    <div class="clear"></div>
                	</div>
                </div>
                
            	<div class="main-left">            		
            		<cfinclude template = "/layouts/#rc.Layout#/includes/jobs/jobsearch.cfm">                                   
            	</div>     
            	      	
        		   <div class="clear"></div>
                <div class="color-trasperent">&nbsp; </div>
        	</div>
    	</div>
    </div>	
</div>
<!-- maincontent ends -->
</cfoutput>