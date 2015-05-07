<cfscript>
   rc.UserInfo = rc.JobsCom.GetUserInfo(userid='#session.userid#');
   rc.UserApps = rc.JobsCom.GetUserJobs(userid='#session.userid#');
   //Upload:
   if (cgi.REQUEST_METHOD is "post") {
      rc.UserResume = FileUpload("/files/#form.userFiles#","resumeFile", "application/msword","unique");
      
      location(url='index.cfm?view=account&msg=1', addtoken="false");
   }
   
   
   if(isdefined('url.sec') and url.sec NEQ ''){
      section = '#url.sec#';
      
   } else {
      section = 'default';
      
   }
</cfscript>
<cfoutput>
<div class="content-center job-single">
        
     <cfswitch expression="#section#">
     <cfdefaultcase>
        <div class="heading-l">
          <h2> Your Account #session.username# </h2>
        </div>
        
        
     <div class=" content-center border box-1">
         <cfif isdefined('url.msg') and url.msg is "1">
         <p class="alert alert-success">Your Resume has been successfully Uploaded.</p>
         <cfelseif isdefined('url.msg') and url.msg is "2">
         <p class="alert alert-success">Your Application was successfully submitted.</p>
         </cfif>
     </div>
     
     <div class=" content-center border box-1">
      <cfif rc.UserApps.recordcount GT 0>
      <h2> Jobs you've Applied for: </h2>
      <ul>
      <cfloop query="#rc.UserApps#">
          <li>#Title# - Applied On: #DateFormat(created_on, "MM/DD/YYYY")#</li>
      </cfloop>
      </ul>
      </cfif>
     </div>
     </cfdefaultcase>
     <cfcase value="upl">
         <div class="heading-l">
          <h2> Upload your Resume </h2>
        </div>
        
        
     <div class=" content-center border box-1">
         <p>Use the Form Below to Upload your Resume. Only Microsoft Word (.doc, .docx) Files are Permitted.</p>
         <form id="contact" class="email" action="" method="post" enctype="multipart/form-data">
         <input type="hidden" name="userFiles" value="#rc.userinfo.email#">
         <input type="file" id="resumeFile" name="resumeFile">
         
         <div id="send">
                <input id="send_btn" type="submit" value="Upload Resume">
         </div>
     </form>
     
     </div>
     </cfcase>
     <cfcase value="res">
         <div class="heading-l">
          <h2>Your Resumes</h2>
        </div>
        
        
     <div class=" content-center border box-1">
         <p>Below is a List of Resumes your have on file with us.</p>
        <cfdirectory action="list" directory="./files/#rc.userinfo.email#/" name="myResumes">
              <select name="resume">
                  <cfloop query="myResumes">
                  <option value="#myresumes.name#">#myResumes.name#</option>
                  </cfloop>
              </select>
     
     </div>
     </cfcase>
     <cfcase value="inf">
         <div class="heading-l">
          <h2>Your Information</h2>
        </div>
        
        
     <div class=" content-center border box-1">
         <form id="contact" class="email" action="" method="post">
              <input type="hidden" name="userid" value="#session.userid#">
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
               <div class="span3">Your Email Address:</div>
              <div class="span9">
              <input title="Your First Name" type="text" name="email" value="#rc.UserInfo.email#" class="textfield2" placeholder="Email Address" onclick="this.value='';" onfocus="$(this).addClass('active');" onblur="$(this).removeClass('active');">
              </div>
              </div>
              
              <!---Reserved for ChangePassword--->
              
              
              
              <div id="send">
                <input id="send_btn" type="submit" value="Apply">
              </div>
            </form>
     </div>
     </cfcase>
     </cfswitch>
     </div>   
</div>
<script>
   $('##send_btn').prop('disabled', true);
    $('##resumeFile').on( 'change', function() {
      //alert('File Loaded');
      myfile= $( this ).val();
      var ext = myfile.split('.').pop();
      if(ext=="docx" || ext=="doc"){
       $('##send_btn').prop('disabled', false);
      } else{
       alert('Please Choose a Word Document (.doc or .docx)');
       $('##send_btn').prop('disabled', true);
      }
    });

</script>
</cfoutput>
