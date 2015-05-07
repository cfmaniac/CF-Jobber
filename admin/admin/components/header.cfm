<cfif cgi.script_name is not '/admin/login.cfm' AND (NOT isdefined('cookie.LoggedInID') or NOT isdefined('cookie.LoggedInName') or NOT isdefined('cookie.LoggedInRole'))>
  <cflocation addToken="no" url="/admin/login.cfm">
</cfif>

<cfset adminPath = #ExpandPath('/admin')#>

<!--- These are always installed by default --->
<cfset numPages = getCount('pages')>
<cfset numContacts = getCount('contacts')>
<cfset numUsers = getCount('users')>


<!doctype html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">  
  <link rel="stylesheet" href="/admin/bootstrap/css/unicorn-app.css">
  <link rel="stylesheet" href="/admin/bootstrap/css/custom.css">
  <link rel="stylesheet" href="/admin/live-editor/styles/bootstrap_extend.css">  
  <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Abel">
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
  <script language="javascript" type="text/javascript" src='/admin/live-editor/scripts/innovaeditor.js'></script>
  <script language="javascript" type="text/javascript" src='/admin/live-editor/scripts/jquery.innovaeditor.js'></script>
  <script language="javascript" type="text/javascript" src='/admin/javascripts/global.js'></script>
</head>

<body>

<cfif cgi.script_name contains 'login'>
  
  <div id="logo">
    <img src="/admin/bootstrap/img/logo.png">
  </div>

<cfelse>

  <div id="header">
		<h1><a href="/admin/dashboard.cfm">ICND Admin</a></h1>		
  </div>  
  
  <div id="user-nav" class="navbar navbar-inverse">
    <ul class="nav btn-group">
      <cfoutput><li class="btn btn-inverse"><a title="" href="/admin/users/form.cfm?id=#cookie.LoggedInID#"><i class="icon icon-user"></i> <span class="text">#cookie.LoggedInName#</span></a></li></cfoutput>
      <li class="btn btn-inverse"><a title="" href="/admin/login.cfm?logout"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
    </ul>
  </div>  
  
  <!--- Start the left side navigation here --->
  <cfoutput>
  <div id="sidebar">
    <a href="/admin/dashboard.cfm" class="visible-phone"><i class="icon icon-home"></i> Dashboard</a>
    <ul>
      <li<cfif cgi.script_name contains "/admin/dashboard.cfm"> class="active"</cfif>><a href="/admin/dashboard.cfm"><i class="icon icon-home"></i> <span>Dashboard</span></a></li>
      <li<cfif cgi.script_name contains "/admin/users/"> class="active"</cfif>><a href="/admin/users/"><i class="icon icon-user"></i> <span>Users</span> <span class="label">#numUsers#</span></a></li>
      <li<cfif cgi.script_name contains "/admin/pages/"> class="active"</cfif>><a href="/admin/pages/"><i class="icon icon-file"></i> <span>Pages</span> <span class="label">#numPages#</span></a></li>
      <li<cfif cgi.script_name contains "/admin/contacts/"> class="active"</cfif>><a href="/admin/contacts/"><i class="icon icon-comment"></i> <span>Contacts</span> <span class="label">#numContacts#</span></a></li>
      
      <cfif FileExists('#adminPath#\testimonials\index.cfm')>
         <cfset numTestimonials = getCount('testimonials')>
         <li<cfif cgi.script_name contains "/admin/testimonials/"> class="active"</cfif>><a href="/admin/testimonials/"><i class="icon icon-comment"></i> <span>Testimonials</span> <span class="label">#numTestimonials#</span></a></li>
      </cfif>
      
      <cfif FileExists('#adminPath#\staff\index.cfm')>
         <cfset numStaff = getCount('staff')>
         <li<cfif cgi.script_name contains "/admin/staff/"> class="active"</cfif>><a href="/admin/staff/"><i class="icon icon-user"></i> <span>Staff</span> <span class="label">#numStaff#</span></a></li>
      </cfif>
      
      <cfif FileExists('#adminPath#\documents\index.cfm')>
         <cfquery name="numDocs" dataSource="#dsn#">
            select count(id) as numDocs from assets where section = 'Documents'
         </cfquery>
         <li<cfif cgi.script_name contains "/admin/documents/"> class="active"</cfif>><a href="/admin/documents/"><i class="icon icon-file"></i> <span>Documents</span> <span class="label">#numDocs.numDocs#</span></a></li>
      </cfif>
      
      <cfif FileExists('#adminPath#\homeslideshow\index.cfm')>
         <cfquery name="numHomeSlides" dataSource="#dsn#">
            select count(id) as 'numHomeSlides' from assets where section = 'Homepage Slideshow'
         </cfquery>
         <li<cfif cgi.script_name contains "/admin/homeslideshow/"> class="active"</cfif>><a href="/admin/homeslideshow/"><i class="icon icon-picture"></i> <span>Home Slideshow</span> <span class="label">#numHomeSlides.numHomeSlides#</span></a></li>
      </cfif>
      
      <cfif FileExists('#adminPath#\events\index.cfm')>
         <cfset numEvents = getCount('eventcal')>
         <li<cfif cgi.script_name contains "/admin/events/"> class="active"</cfif>><a href="/admin/events/"><i class="icon icon-calendar"></i> <span>Events</span> <span class="label">#numEvents#</span></a></li>
      </cfif>
      
      <cfif FileExists('#adminPath#\thingstodo\index.cfm')>
         <cfset numThingsToDo = getCount('thingstodo')>
         <li<cfif cgi.script_name contains "/admin/thingstodo/"> class="active"</cfif>><a href="/admin/thingstodo/"><i class="icon icon-calendar"></i> <span>Things To Do</span> <span class="label">#numThingsToDo#</span></a></li>
      </cfif>
      
      <cfif FileExists('#adminPath#\faqs\index.cfm')>
         <cfset numFAQs = getCount('faqs')>
         <li<cfif cgi.script_name contains "/admin/faqs/"> class="active"</cfif>><a href="/admin/faqs/"><i class="icon icon-question-sign"></i> <span>FAQs</span> <span class="label">#numFAQs#</span></a></li>
      </cfif>
      
      <cfif FileExists('#adminPath#\callouts\index.cfm')>
         <cfset numCallouts = getCount('callouts')>
         <li<cfif cgi.script_name contains "/admin/callouts/"> class="active"</cfif>><a href="/admin/callouts/"><i class="icon icon-bullhorn"></i> <span>Callouts</span> <span class="label">#numCallouts#</span></a></li>
      </cfif>

    </ul>
  </div>
  </cfoutput>
  <!--- End the left side navigation --->
  
  <div id="content">
  
    <div id="content-header">
      <h1><cfoutput>#page.title#</cfoutput></h1>
    </div>
  
    <div id="breadcrumb">
    	<a href="/admin/dashboard.cfm" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a>
    	<span style="font-weight:bold;color:#444;font-size:11px;padding-left:7px"><cfoutput>#page.title#</cfoutput></span>
    </div>
    
    <div class="container-fluid">
    	<div class="row-fluid">
    		<div class="span12">
        
</cfif>