component {
   this.applicationroot = getDirectoryFromPath( getCurrentTemplatePath() );
   
   this.name = "CF-Jobs";
   if(cgi.http_host contains 'localhost.com') {
      this.datasource = 'cfjobs';
      this.defaultdatasource = "cfjobs";
   }else{
      this.datasource = 'mountpleasant_dev';
      this.defaultdatasource = "mountpleasant_dev";
   }
   this.applicationTimeout = createTimespan(0,2,0,0);
   this.clientManagement = true;
   this.sessionManagement = true;
   this.sessionTimeout = createTimespan(0,0,20,0);
   this.setClientCookies = true;
   this.setDomainCookies = true;
  
   
   this.mappings[ "/layouts" ] = this.applicationroot & "layouts/";
   this.mappings[ "/files" ] = this.applicationroot & "files/";
   this.mappings[ "com" ] = this.applicationroot & "com/";
   //We setup our Request context Variables So We NEVER have to SET THEM AGAIN
   request.baseDir = right(getdirectoryfrompath(getcurrenttemplatepath()),len(getdirectoryfrompath(getcurrenttemplatepath()))-len(expandpath("/"))+1);
   request.baseDir = rereplace(request.baseDir, "\\", "/", "All");
   if( CGI.HTTPS eq "on" ) {
      request.basehref = "https://";
   } else { 
      request.basehref = "http://";
   }
     
		request.basehref &= CGI.HTTP_HOST & request.basedir;
   
   
   
   
   
   function onApplicationStart() {
     
      return true;
   }
   
   
   function onSessionStart() {
      session.loggedin = 'false';
      session.username = 'guest';
      session.userid = '0';
      
      return this;
      
   }
   //For Information on Returning these Settings:
   //See: http://webdevsourcerer.com/index.cfm/blog/post/slug/traversing-your-application-settings
}


