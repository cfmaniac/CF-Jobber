<cfoutput>
<div id="bar" style="display: block;">
  <div class="inner"> 
    
    <!-- Language Menu -->
    <ul id="lang-menu">
     
    </ul>
    <!-- /Language Menu --> 
    
    <!-- User Menu -->
    <ul id="user-menu">
    <cfif structKeyExists(session, 'loggedin') and session.loggedin is 'true'>
      <li id="login" class="first"><a>Welcome Back #session.username#</a></li>
      <li id="login"><a href="index.cfm?view=account&user=#session.userid#">My Account</a></li>
      <li id="register"><a href="index.cfm?view=logout">Logout</a></li>
    <cfelse>
      <li id="login" class="first"><a href="index.cfm?view=login">Login</a></li>
      <li id="register"><a href="index.cfm?view=register">Register</a></li>
      
    </cfif>
      
    </ul>
    <!-- /User Menu --> 
    
  </div>
</div>

<div id="header" class="">
  <div class="inner"> 
    
    <!-- Logo -->
    <div id="logo"> <a href="index.cfm">MountPleasantWaterWorks Jobs</a><a class="menu-hider"></a></div>
    <!-- /Logo -->
    
      <ul id="navigation">
      <li class="current"> <a href="index.cfm">Job Listings</a></li>
      <!---li class="first expanded"><a href="jobs.html">Jobs<span class="dropdown"></span></a>
        <ul class="submenu" style="display: none;">
          <li><a href="jobs.html">Job listing</a></li>
          <li><a href="job.html">Job Details</a></li>
        </ul>
      </li>
      <li class="first expanded"><a href="candidates-listing.html">Candidates<span class="dropdown"></span></a>
        <ul class="submenu" style="display: none;">
          <li><a href="candidates-listing.html">Candidate Listing (with sidebar)</a></li>
          <li><a href="candidates-listing-no-sidebar.html">Candidate listing (without)</a></li>
          <li><a href="candidate.html">Candidate</a></li>
        </ul>
      </li>
      <li><a href="partners.html">Partners</a></li>
      <li><a href="about-us.html">About Us</a></li--->
      <li><a href="">Contact</a></li>
    </ul>
    <div class="reponsive-nav">
   <select class="select combosexed" name="menu1" id="menu1" style="display: none;"> 
      <option value="index.cfm">Job Listings</option>
      <option value="index.cfm?view=login">Login</option>
      <option value="index.cfm?view=register">Register</option>
    </select><span class="combosex_main select combosex_with_append combosex_select"><span class="combosex_arrow combosex_arrow_down" style="width: 16px;"><em></em></span><span class="combosex_input_span"><a href="javascript:void(0)" class="combosex_display">Home</a></span><input type="hidden" class="combosex_def" value="index.html"><input type="hidden" class="combosex_value" value="index.html"><span class="combosex_spinner"></span></span>
    </div>
  </div>
</div>
</cfoutput>