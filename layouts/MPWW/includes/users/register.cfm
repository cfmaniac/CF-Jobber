<cfscript>
   if (cgi.REQUEST_METHOD is "post") {
      rc.RegisterUser = rc.JobsCom.Register(firstname='#form.firstname#', lastname='#form.lastname#', email='#form.email#', password='#form.password#');
   
      //WriteOutput('Submitted: #rc.RegisterUser#');
   }
</cfscript>

<div class="content-center job-single">
        <div class="heading-l">
          <h2>Register your Account </h2>
        </div>
        
        <form id="contact" class="email" action="" method="post">
              <p>Creating an Account permits you to be able to create a Profile, Upload your Resume and respond to Messages sent to you.</p>
              <div id="about">
                <input title="Your First Name" type="text" name="firstname" class="textfield2" placeholder="First Name" onclick="this.value='';" onfocus="$(this).addClass('active');" onblur="$(this).removeClass('active');">
                <input title="Your Last Name" type="text" name="lastname" class="textfield2" placeholder="Last Name" onclick="this.value='';" onfocus="$(this).addClass('active');" onblur="$(this).removeClass('active');">
                <input title="Your E-Mail" type="text" name="email" class="textfield2" placeholder="E-mail" onclick="this.value='';" onfocus="$(this).addClass('active');" onblur="$(this).removeClass('active');">
                <input title="Your WebSite" type="password" name="password" class="textfield2" placeholder="Password" onclick="this.value='';" onfocus="$(this).addClass('active');" onblur="$(this).removeClass('active');">
              </div>
              
              <div id="send">
                <input id="send_btn" type="submit" value="Register">
              </div>
            </form>
        
</div>