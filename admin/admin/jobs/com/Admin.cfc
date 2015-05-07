/**
 * Created by JHarvey on 10/7/2014.
 */
component output="false" persistent="true" accessors="true"{
 
 public  function init(){
   
   variables.datasource = arguments.datasource;
    
   return this;
 }
 
 public function GetJobsList(){
   
      rc.JobsSQL = "Select * from Jobs JBS
      INNER JOIN jobs_categories JBC on JBS.category_id = JBC.id
      order by created_on";
      rc.Jobs = new query();
      rc.JobsList = rc.Jobs.execute(datasource=#variables.datasource#, sql=rc.JobsSQL).getResult();
   
      return rc.jobsList;
 }
 
 public function GetJobsCats(){
   
      rc.JobsSQL = "Select * From jobs_categories
      order by category_order";
      rc.Jobs = new query();
      rc.JobsCats = rc.Jobs.execute(datasource=#variables.datasource#, sql=rc.JobsSQL).getResult();
   
      return rc.jobsCats;
 } 
 
 public function GetIndustries(){
   
      rc.JobsSQL = "Select * from Jobs JBS
      INNER JOIN jobs_categories JBC on JBS.category_id = JBC.id
      order by created_on";
      rc.Jobs = new query();
      rc.JobsList = rc.Jobs.execute(datasource=#variables.datasource#, sql=rc.JobsSQL).getResult();
   
      return rc.jobsFList;
 } 
 
  public function GetTypes(){
   
      rc.JobsSQL = "Select * from Jobs_types";
      rc.Jobs = new query();
      rc.JobsTypes = rc.Jobs.execute(datasource=#variables.datasource#, sql=rc.JobsSQL).getResult();
   
      return rc.jobsTypes;
 }
 
 public function GetApplications(){
   
      rc.JobsSQL = "Select * From jobs_applications jba
      INNER JOIN jobs_subscribers jbu on jbu.id = jba.user_id
      INNER JOIN jobs jbs on jbs.id = jba.jobs_id 
      Order By jba.created_on";
      rc.Jobs = new query();
      rc.JobsApps = rc.Jobs.execute(datasource=#variables.datasource#, sql=rc.JobsSQL).getResult();
   
      return rc.jobsApps;
 } 
 
 public function GetSubScribers(){
   
      rc.JobsSQL = "Select * from jobs_subscribers Order by lastName";
      rc.Jobs = new query();
      rc.JobsFList = rc.Jobs.execute(datasource=#variables.datasource#, sql=rc.JobsSQL).getResult();
   
      return rc.jobsFList;
 }
 
  
 
}
