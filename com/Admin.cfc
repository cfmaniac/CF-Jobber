/**
 * Created by JHarvey on 10/7/2014.
 */
component output="false" persistent="true" accessors="true"{
 
 public  function init(){
    
    
   return this;
 }
 
 public function GetJobsList(){
   
      rc.JobsSQL = "Select * from Jobs JBS
      INNER JOIN jobs_categories JBC on JBS.category_id = JBC.id
      order by created_on";
      rc.Jobs = new query();
      rc.JobsList = rc.Jobs.execute(sql=rc.JobsSQL).getResult();
   
      return rc.jobsFList;
 }
 
 public function GetJobCats(){
   
      rc.JobsSQL = "Select * from Jobs JBS
      INNER JOIN jobs_categories JBC on JBS.category_id = JBC.id
      order by created_on";
      rc.Jobs = new query();
      rc.JobsList = rc.Jobs.execute(sql=rc.JobsSQL).getResult();
   
      return rc.jobsFList;
 } 
 
 public function GetIndustries(){
   
      rc.JobsSQL = "Select * from Jobs JBS
      INNER JOIN jobs_categories JBC on JBS.category_id = JBC.id
      order by created_on";
      rc.Jobs = new query();
      rc.JobsList = rc.Jobs.execute(sql=rc.JobsSQL).getResult();
   
      return rc.jobsFList;
 } 
 
 public function GetApplications(){
   
      rc.JobsSQL = "Select * from Jobs JBS
      INNER JOIN jobs_categories JBC on JBS.category_id = JBC.id
      order by created_on";
      rc.Jobs = new query();
      rc.JobsList = rc.Jobs.execute(sql=rc.JobsSQL).getResult();
   
      return rc.jobsFList;
 } 
 
 public function GetSubScribers(){
   
      rc.JobsSQL = "Select * from Jobs JBS
      INNER JOIN jobs_categories JBC on JBS.category_id = JBC.id
      order by created_on";
      rc.Jobs = new query();
      rc.JobsList = rc.Jobs.execute(sql=rc.JobsSQL).getResult();
   
      return rc.jobsFList;
 }
 
  
 
}
