<cfscript>
   rc.JobAdminCom = createObject('component','com.admin').init(datasource=#application.dsn#); //The Jobs Admin Component
   
   if(isdefined('url.view') and url.view !=''){
      if(url.view is 'job'){
         //Jobs
         rc.JobCats = rc.JobAdminCom.getJobsCats();
         rc.JobType = rc.JobAdminCom.getTypes();
         if(parameterExists(id)){
            rc.Job = rc.JobAdminCom.GetJobs(jobid=#url.id#);
         } 
         page.title ="Jobs Management";
      } else if(url.view is 'cat'){
         //Job Categories
         if(parameterExists(id)){
            rc.JobCat = rc.JobAdminCom.GetCat(catid=#url.id#);
         } 
         page.title ="Jobs Category Management";
      } else if(url.view is 'type'){
         //Job Types
         if(parameterExists(id)){
            rc.JobType = rc.JobAdminCom.GetType(id=#url.id#);
         } 
         page.title ="Job Types Management";
      } else if(url.view is 'appl'){
         //Applicant
         page.title ="Applicant Review";
      } else if(url.view is 'app'){
         //Applications
         page.title ="Application Review";
      }
   } 
   
   
   include "/admin/components/header.cfm";
</cfscript>
<cfoutput>
   
   
   
</cfoutput>
<cfscript>
   include "/admin/components/footer.cfm";
</cfscript>