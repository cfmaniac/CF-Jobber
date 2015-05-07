<cfscript>
 if(structKeyExists(session, 'loggedin') && session.loggedin != 'true'){
    showModal = 'true';
    showApplyModal = 'false';
 } else {
    showModal = 'false';
    rc.Applications = rc.JobsCom.getApplications(jobid=#url.id#, userid='#session.userID#');
    rc.UserInfo = rc.JobsCom.GetUserInfo(userid='#session.userid#');
    if(rc.Applications is 'false'){
    //Already Applied:
      showApplyModal = 'true';
    } else{
      showApplyModal = 'false';
            
    }

 }
 
 if(cgi.request_method is "post"){
    rc.ApplyJob = rc.JobsCom.JobApply(jobid='#form.jobid#', userid='#form.userid#', dateapplied='#form.date_applied#', email='#form.email#', ip='#form.ip#',
    firstname='#form.firstname#', lastname='#form.lastname#', resumefile='#form.resume#');
    
 }
 
</cfscript>
<cfoutput>
   
   <div class="content-center job-single">
        <div class="heading-l">
          <h2> Applying for Job: #rc.Jobs.Title#</h2>
        </div>
        
   </div>
   
   <div class=" content-center border box-1">
      <cfif structKeyExists(session, 'loggedin') AND session.loggedin EQ 'true'>
      <form id="contact" class="email" action="" method="post">
              <input type="hidden" name="userid" value="#session.userid#">
              <input type="hidden" name="jobid" value="#url.id#">
              <input type="hidden" name="date_applied" value="#dateformat(now(), "YYYY-MM-DD")#">
              <input type="hidden" name="email" value="#rc.userinfo.email#">
              <input type="hidden" name="ip" value="#cgi.remote_host#">
              <div class="row">
              <div class="span3">Your First Name:</div>
              <div class="span9">
              <input title="Your First Name" type="text" name="firstname" value="#rc.UserInfo.firstname#" class="textfield2" placeholder="First Name" onclick="this.value='';" onfocus="$(this).addClass('active');" onblur="$(this).removeClass('active');">
              </div>
              </div>
              <div class="row">
               <div class="span3">Your Last Name:</div>
              <div class="span9">
              <input title="Your First Name" type="text" name="lastname" value="#rc.UserInfo.lastname#" class="textfield2" placeholder="First Name" onclick="this.value='';" onfocus="$(this).addClass('active');" onblur="$(this).removeClass('active');">
              </div>
              </div>
              <div class="row">
              
               <div class="span3">Your Resume:</div>
              <div class="span9">
              <cfdirectory action="list" directory="/files/#rc.userinfo.email#/" name="myResumes">
              <select name="resume">
                  <cfloop query="myResumes">
                  <option value="#myresumes.name#">#myResumes.name#</option>
                  </cfloop>
              </select>
              </div>
              </div>
              
              
              
              <div id="send">
                <input id="send_btn" type="submit" value="Apply">
              </div>
            </form>
            </cfif>
   </div>
   
   <!---Login or Signup Modal--->
   <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
     <div class="modal-dialog">
       <div class="modal-content">
         <div class="modal-header">
           
           <h4 class="modal-title" id="myModalLabel">Login or Signup</h4>
         </div>
         <div class="modal-body">
         <p>Before you can apply for this job <strong>#rc.jobs.title#</strong>, you need to login to your account or Sign-up</p>
         </div>
         <div class="modal-footer">
           <a href="index.cfm?view=login"  class="btn btn-success">Login</a>
           <a href="index.cfm?view=register" class="btn btn-primary">Register</a>
         </div>
       </div>
     </div>
   </div>
   
   <!---Already Applied Modal:--->
   <div class="modal fade" id="applyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
     <div class="modal-dialog">
       <div class="modal-content">
         <div class="modal-header">
           
           <h4 class="modal-title" id="myModalLabel">You've already Applied for this Job</h4>
         </div>
         <div class="modal-body">
         <p>#session.username#, you have already Applied for this job : #rc.jobs.title# and cannot apply again.</p>
         </div>
         <div class="modal-footer">
           
           <a href="index.cfm" class="btn btn-primary">Back to Listings</a>
         </div>
       </div>
     </div>
   </div>
   
</cfoutput>
<script>
    $(document).ready(function(){
       <cfif showModal>
       $('#loginModal').modal({
       backdrop: 'static',
       keyboard: false
       });
       </cfif>
       
       <cfif showApplyModal>
       $('#applyModal').modal({
       backdrop: 'static',
       keyboard: false
       });
       </cfif>
    
    });
</script>