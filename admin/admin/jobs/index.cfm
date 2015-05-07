<cfscript>
   rc.JobAdminCom = createObject('component','com.admin').init(datasource=#application.dsn#); //The Jobs Admin Component
   
   rc.JobList = rc.JobAdminCom.GetJobsList();
   rc.JobCats = rc.JobAdminCom.getJobsCats();
   rc.JobType = rc.JobAdminCom.getTypes();
   rc.JobApps = rc.JobAdminCom.GetApplications();
   rc.JobApUs = rc.JobAdminCom.getSubscribers();
   
   page.title ="Jobs Portal";
   include "/admin/components/header.cfm";
</cfscript>
<cfoutput>
   <div class="widget-box">
  <div class="widget-title">
    <span class="icon">
      <i class="icon-th"></i>
    </span>
    <h5><cfoutput>#page.title#</cfoutput></h5>
  </div>
  <div class="widget-content nopadding">
   <ul class="nav nav-tabs" style="margin-top:20px">
        <li><a href="##listings" data-toggle="tab" class="active">Listings <span class="label">#numberFormat(rc.JobList.recordCount)#</span></a> </li>
        <li><a href="##categories" data-toggle="tab">Categories  <span class="label">#numberFormat(rc.JobCats.recordCount)#</span></a></li> 
        <li><a href="##applicants" data-toggle="tab">Applicants <span class="label">#numberFormat(rc.JobApUs.recordCount)#</span></a> </li>
        <li><a href="##applications" data-toggle="tab">Applications <span class="label">#numberFormat(rc.JobApps.recordCount)#</span></a> </li>
        <li><a href="##types" data-toggle="tab">Types <span class="label">#numberFormat(rc.JobType.recordCount)#</span></a> </li>           
   </ul>
  
  <div class="tab-content">
        <!---Job Listings--->
        <div class="tab-pane active" id="listings">
            <div class="widget-content nopadding">
            <p>
            <h5>Job Listings</h5>
            <a href="form.cfm?view=Job" class="btn btn-success pull-right"><i class="icon-plus icon-white"></i> Add New Listing</a></p>
       
        <table class="table table-bordered table-striped table-hover">
          <tr>
            <th>No.</th>
            <th>Title</th>
            <th>Category</th> 
            <th>Active</th>  
            <th>Posted On</th>  
            <th></th>
            <th></th>    
           <th></th>  
          </tr>
          <cfloop query="#rc.JobList#"> 
          <tr>
              <td>#rc.JobList.currentRow#</td>
              <td>#rc.JobList.Title#</td>
              <td>#rc.JobList.Name#</td>
              <td>#yesNoFormat(rc.JobList.is_active)#</td>
              <td>#dateformat(rc.JobList.created_on, "MM/DD/YYYY")#</td>
              <td></td>
              <td></td>
          </tr>
          </cfloop>
          </table> 
            
            </div>
        </div>
        
        <!---Job Cats--->
        <div class="tab-pane" id="categories">
        <div class="widget-content nopadding">
            <p><h5>Job Catgegories</h5>
            <a href="form.cfm?view=Cat" class="btn btn-success pull-right"><i class="icon-plus icon-white"></i> Add New Category</a></p>
       
        <table class="table table-bordered table-striped table-hover">
          <tr>
            <th>No.</th>
            <th>Name</th>
            <th>Order</th>  
            <th></th>
            <th></th>    
            <th></th>  
          </tr>
          <cfloop query="#rc.JobCats#"> 
          <tr>
              <td>#rc.JobCats.currentRow#</td>
              <td>#rc.JobCats.Name#</td>
              <td>#rc.JobCats.category_order#</td>
              <td></td>
              <td></td>
              <td></td>
          </tr>
          </cfloop>
          </table> 
            
            </div>
        </div>
        
         <!---Job Cats--->
        <div class="tab-pane" id="applicants">
         <div class="widget-content nopadding">
          <p>
            <h5>Applicants</h5></p>  
       
        <table class="table table-bordered table-striped table-hover">
          <tr>
            <th>No.</th>
            <th>First Name</th>
            <th>Last Name</th>  
            <th>Resume Uploaded</th>
            <th>Jbbs Applied For</th>    
            <th></th>  
          </tr>
          <cfloop query="#rc.JobApUs#"> 
          <tr>
              <td>#rc.JobApUs.currentRow#</td>
              <td>#rc.JobApUs.FirstName#</td>
              <td>#rc.JobApUs.LastName#</td>
              <td></td>
              <td></td>
              <td></td>
          </tr>
          </cfloop>
          </table> 
            
            </div>
        
        </div>
        
         <!---Job Cats--->
        <div class="tab-pane" id="applications">
        <div class="widget-content nopadding">
         <p>
            <h5>Applications</h5></p> 
          <p>Applicants in Bold Have not Yet Been Reviewed</p>  
       
        <table class="table table-bordered table-striped table-hover">
          <tr>
            <th>No.</th>
            <th>First Name</th>
            <th>Last Name</th>  
            <th>Job Applied For</th>
            <th>Submitted on</th>    
            <th></th>  
          </tr>
          <cfloop query="#rc.JobApps#"> 
          <tr <cfif !rc.JobApps.reviewed> style="font-weight: bold;"</cfif>>
              <td #rc.JobApps.currentRow#</td>
              <td>#rc.JobApps.FirstName#</td>
              <td>#rc.JobApps.LastName#</td>
              <td>#rc.JobApps.Title#</td>
              <td>#dateformat(rc.JobApps.created_on, "MM/DD/YYYY")#</td>
              <td></td>
          </tr>
          </cfloop>
          </table> 
            
            </div>
        </div>
         <!---Job Cats--->
        <div class="tab-pane" id="types">
         <div class="widget-content nopadding">
            <p><h5>Job Types</h5>
            <a href="form.cfm?view=type" class="btn btn-success pull-right"><i class="icon-plus icon-white"></i> Add New Type</a></p>
       
        <table class="table table-bordered table-striped table-hover">
          <tr>
            <th>No.</th>
            <th>Name</th>
               
            <th></th>  
          </tr>
          <cfloop query="#rc.JobType#"> 
          <tr>
              <td>#rc.JobType.currentRow#</td>
              <td>#rc.JobType.Name#</td>
              
              <td></td>
              
          </tr>
          </cfloop>
          </table> 
            
            </div>
        </div>
        
  </div>
  
  </div>
</cfoutput>
<cfscript>
   include "/admin/components/footer.cfm";
</cfscript>