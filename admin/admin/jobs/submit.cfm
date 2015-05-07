<cfset table = 'pages'>

<cfif isdefined('url.id') and isdefined('url.delete')> <!--- delete statement --->
	
  <cfquery dataSource="#application.dsn#">
  	delete from #table# where id = <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#url.id#"> 
  </cfquery>
  
  <cflocation addToken="no" url="index.cfm?success">

<cfelseif isdefined('form.id')> <!--- update statement --->
  
  
  <cfif form.parentID neq 0>
      
      <!--- Get the slug for the parent page and append to new page slug --->
      <cfquery name="getParentSlug" dataSource="#dsn#">
         select slug from pages where id = <cfqueryparam  CFSQLType="CF_SQL_INTEGER" value="#form.parentID#">
      </cfquery>
      
      <cfset mySlug = getParentSlug.slug & '/' & form.slug> 
  
  <cfelse>
      <cfset mySlug = form.slug>
  </cfif>
  
  
  <!---START: VERSIONING CODE BY BS--->
  
  <cfquery name="getPreviousPageData" dataSource="#dsn#">
         select * from pages where id = <cfqueryparam  CFSQLType="CF_SQL_INTEGER" value="#form.id#">
  </cfquery>

  
    <cfquery dataSource="#application.dsn#">
    insert into pages_versioning (name,body,slug,h1,metatitle,metadescription,status,parentID,MainPageID)  
    values(
      <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#getPreviousPageData.name#">,      
      <cfqueryparam CFSQLType="CF_SQL_LONGVARCHAR" value="#trim(getPreviousPageData.body)#">,
      <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#getPreviousPageData.slug#">,
      <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#getPreviousPageData.h1#">,
      <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#getPreviousPageData.metatitle#">,
      <cfqueryparam CFSQLType="CF_SQL_LONGVARCHAR" value="#getPreviousPageData.metadescription#">,
      <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#getPreviousPageData.status#">,
	  <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#form.parentID#">,
      <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#form.id#">	  
    )
  </cfquery>
  
   <!---END: VERSIONING CODE BY BS--->
  
  
  <cfquery datasource="#application.dsn#">
	update #table# set 
    name = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#form.name#">,    
    body = <cfqueryparam CFSQLType="CF_SQL_LONGVARCHAR" value="#trim(form.body)#">,
    slug = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#mySlug#">,
    h1 = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#form.h1#">,
    metatitle = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#form.metatitle#">,
    metadescription = <cfqueryparam CFSQLType="CF_SQL_LONGVARCHAR" value="#form.metadescription#">,
    status = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#form.status#">,
    showinnavigation = <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#form.showinnavigation#">,
    parentID = <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#form.parentID#">
    where id = <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#form.id#">
  </cfquery> 
	
  
  <cflocation addToken="no" url="form.cfm?id=#form.id#&success">
  
<cfelse>  <!---insert statement--->
  
  <cfif form.parentID neq 0>
      
      <!--- Get the slug for the parent page and append to new page slug --->
      <cfquery name="getParentSlug" dataSource="#dsn#">
         select slug from pages where id = <cfqueryparam  CFSQLType="CF_SQL_INTEGER" value="#form.parentID#">
      </cfquery>
      
      <cfset mySlug = getParentSlug.slug & '/' & form.slug> 
  
  <cfelse>
      <cfset mySlug = form.slug>
  </cfif>
  
  <cfquery dataSource="#application.dsn#">
    insert into #table#(name,body,slug,h1,metatitle,metadescription,status,showinnavigation,parentID)  
    values(
      <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#form.name#">,      
      <cfqueryparam CFSQLType="CF_SQL_LONGVARCHAR" value="#form.body#">,
      <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#mySlug#">,
      <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#form.h1#">,
      <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#form.metatitle#">,
      <cfqueryparam CFSQLType="CF_SQL_LONGVARCHAR" value="#form.metadescription#">,
      <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#form.status#">,
      <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#form.showinnavigation#">,
      <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#form.parentID#">
    )
  </cfquery>
  
  <cflocation addToken="no" url="form.cfm?success">
  
</cfif>