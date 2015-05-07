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

 
 <div id="content" style="min-height: 227px;">
 
  <div id="title">
   
    <h1 class="inner">
    <cfswitch expression="#view#">
      
      <cfdefaultcase>
       Available Jobs<span id="jobs-counter">(#numberFormat(rc.jobs.RecordCount)#)</span>
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
    </h1>
  
  </div>
  
  <div class="inner"> 
    
    <!-- Content Inner -->
    <div class="content-inner"> 
      <cfif view is "default">
      <cfif rc.ShowSearch>
      <div class="content-left">
      <!-- Content Left -->
       <cfinclude template = "/layouts/#rc.Layout#/includes/jobs/jobsearch.cfm">
       <cfif rc.ShowAdverts>
          <cfinclude template="/layouts/#rc.Layout#/includes/jobs/adverts.cfm">
       </cfif>
      </div>
      </cfif>
      <cfelseif view is "apply" or view is "job">
       <div class="content-left">
         <cfinclude template = "/layouts/#rc.Layout#/includes/jobs/jobInfo.cfm">
      </div>
      
      <cfelseif view is "account">
      <div class="content-left">
      <!-- Content Left -->
      <cfinclude template = "/layouts/#rc.Layout#/includes/users/AccountInfo.cfm">
      </div>
      </cfif>
      <!-- /Content Left --> 
      
      <!-- Content Center -->
      <div class="content-center">
        <!---Reserved for Maps--->
        
        
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
            <h2> Available Jobs </h2>
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
      <!-- /Content Center -->
      
      <div class="clear"></div>
      <!-- Clear Line --> 
      
    </div>
    <!-- /Content Inner --> 
    
  </div>
</div>

</cfoutput>