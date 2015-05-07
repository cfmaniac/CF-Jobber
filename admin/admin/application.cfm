<cfif CGI.http_cookie IS "">
  <cfset sessiontimeout = CreateTimeSpan(0,0,0,10) /> 
<cfelse>
  <cfset sessiontimeout = CreateTimeSpan(0,0,20,0) />
</cfif>

<cfapplication name="MountPleasant-WW-v2Admin" clientmanagement="Yes" sessionmanagement="Yes" sessiontimeout="#sessiontimeout#" setDomainCookies="Yes">

<!--- Admin Global Settings --->
<cfset dsn="mountpleasant_dev">
<cfset application.dsn = 'mountpleasant_dev'>

<cffunction name="getCount" returnType="string">
  
  <cfargument name="table" hint="Name of the database table" required="true" type="string">
  
  <cfquery name="returnCount" dataSource="#dsn#">
    select count(id) as 'numrows' from #table#
  </cfquery>
  
  <cfreturn returnCount.numrows>

</cffunction>


  
 


