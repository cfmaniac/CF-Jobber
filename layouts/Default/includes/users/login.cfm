<cfscript>
   if (cgi.REQUEST_METHOD is "post") {
      rc.RegisterUser = rc.JobsCom.Login(email='#form.email#', password='#form.password#');
   
      //WriteOutput('Submitted: #rc.RegisterUser#');
   }
   
   if(isdefined('url.err') and url.err is "1"){
      rc.msgType = 'error';
      rc.Message = 'Could not Log you in. Please Check your Username or Password.';
      
   }
</cfscript>
<cfoutput>
<div class="content-center job-single">
        
        <cfif isdefined('rc.message')>
        <div>
          <p class="alert alert-#rc.MsgType#"> #rc.Message# </h2>
        </div>
        </cfif>
        <div class="heading-l">
          <h2> Login to your Account </h2>
        </div>
        
        <form id="contact" class="email" action="" method="post">
              <p></p>
              <div id="about">
               <input title="Your E-Mail" type="text" name="email" class="textfield2" placeholder="E-mail" onclick="this.value='';" onfocus="$(this).addClass('active');" onblur="$(this).removeClass('active');">
                <input title="Your WebSite" type="password" name="password" class="textfield2" placeholder="Password" onclick="this.value='';" onfocus="$(this).addClass('active');" onblur="$(this).removeClass('active');">
              </div>
              
              <div id="send">
                <input id="send_btn" type="submit" value="Register">
              </div>
            </form>
        
</div>
</cfoutput>