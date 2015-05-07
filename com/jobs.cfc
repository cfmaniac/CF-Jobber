/**
 * Created by JHarvey on 10/7/2014.
 */
component output="false" persistent="true" accessors="true"{
   property name="ModuleVersion" default="1.5.0";
   property name="ModuleAuthor" default="J Harvey";
   property name="Description" default="Job Bank Module";
   
   
 public  function init(){
   
    
    
   return this;
 }
 
 public function GetFeatured(){
   
      rc.JobsSQL = "Select * from Jobs JBS
      INNER JOIN jobs_categories JBC on JBS.category_id = JBC.id
      where jbs.is_active=:isActive and jbs.spotlight=:spotlight order by created_on";
      rc.Jobs = new query();
      rc.Jobs.addParam(name="isActive",value="1",cfsqltype="NUMERIC");
      rc.Jobs.addParam(name="spotlight",value="1",cfsqltype="NUMERIC");
      rc.JobsFeaturedResult = rc.Jobs.execute(sql=rc.JobsSQL).getResult();
   
      return rc.jobsFeaturedResult;
  } 
  
  public function GetDefault(){
   
      rc.JobsSQL = "Select * from Jobs JBS
      INNER JOIN jobs_categories JBC on JBS.category_id = JBC.id
      where jbs.is_active=:isActive order by created_on";
      rc.Jobs = new query();
      rc.Jobs.addParam(name="isActive",value="1",cfsqltype="NUMERIC");
      
      rc.JobsResult = rc.Jobs.execute(sql=rc.JobsSQL).getResult();
   
      return rc.jobsResult;
  } 
  
  public function GetView(required string view){
    variables.view = arguments.view;
    if(isdefined('arguments.id')) {
       variables.jobid = arguments.id;
    }
    
      if(variables.view == 'job' || variables.view == 'apply') {
         rc.JobsSQL = "Select * from Jobs JBS
         INNER JOIN jobs_categories JBC on JBS.category_id = JBC.id
         where jbs.id=:jobID";
         rc.Jobs = new query();
         rc.Jobs.addParam(name = "jobID", value = "#variables.jobid#", cfsqltype = "NUMERIC");

         rc.JobsResult = rc.Jobs.execute(sql = rc.JobsSQL).getResult();
         
         //Only Count it is View is "Job"
         if(variables.view == "job"){
            rc.Count = (rc.JobsResult.views_count + 1);
            rc.CountView = new Query(sql = "Update Jobs set views_count=#rc.Count# where id=#rc.jobsResult.id#").execute().getResult();
         }
         
         return rc.jobsResult;
         
      } else if(variables.view == 'login' || variables.view == 'register'){
   
   
      } else if(variables.view == 'account'){
   
      }
  } 
  
  public function GetUserInfo(){
     
     variables.userid = arguments.userid;
         
         rc.JobsSQL = "Select * From jobs_subscribers where id=:userid";
         rc.Jobs = new query();
         rc.Jobs.addParam(name = "userid", value = "#variables.userid#", cfsqltype = "cf_sql_integer");
         
         rc.JobsUser = rc.Jobs.execute(sql = rc.JobsSQL).getResult();
         
         return rc.JobsUser;
    
  }
  
  public function Register(){
     
     variables.firstname = arguments.firstname;
     variables.lastname = arguments.lastname;
     variables.email = arguments.email;
     variables.password = arguments.password;
     //EncryptedPassword: 
     variables.passHash = hash(variables.password, "SHA-512"); 
   
      rc.JobsSQL = "insert into jobs_subscribers (firstname, lastname, email, password) VALUES (:firstname, :lastname, :email, :password)";
         rc.Jobs = new query();
         rc.Jobs.addParam(name = "firstname", value = "#variables.firstname#", cfsqltype = "cf_sql_varchar");
         rc.Jobs.addParam(name = "lastname", value = "#variables.lastname#", cfsqltype = "cf_sql_varchar");
         rc.Jobs.addParam(name = "email", value = "#variables.email#", cfsqltype = "cf_sql_varchar");
         rc.Jobs.addParam(name = "password", value = "#variables.passhash#", cfsqltype = "cf_sql_varchar");
         rc.JobsResult = rc.Jobs.execute(sql = rc.JobsSQL).getResult();
      //return variables.passHash;
      
      //Create the User's Files Folder:
      DirectoryCreate('/files/#form.email#');
      
      AutoLogin(firstname='#variables.firstname#', lastname='#variables.lastname#', email='#variables.email#');
  }
  
  public function Login(){
     
     variables.email = arguments.email;
     variables.password = arguments.password;
     //EncryptedPassword: 
     variables.passHash = hash(variables.password, "SHA-512"); 
   
         rc.JobsSQL = "Select * From jobs_subscribers where email=:email and password=:password";
         rc.Jobs = new query();
         rc.Jobs.addParam(name = "email", value = "#variables.email#", cfsqltype = "cf_sql_varchar");
         rc.Jobs.addParam(name = "password", value = "#variables.passhash#", cfsqltype = "cf_sql_varchar");
         rc.JobsLogin = rc.Jobs.execute(sql = rc.JobsSQL).getResult();
         
         if(rc.JobsLogin.recordcount GT "0"){
            session.username='#rc.JobsLogin.firstname# #rc.JobsLogin.lastname#';
            session.userid='#rc.JobsLogin.id#';
            session.loggedin='true';
            location (url='index.cfm?view=account&id=#session.userid#', addtoken='false');
         } else {
            location (url='index.cfm?view=login&err=1', addtoken='false');
         }
    
  }
  
  public function AutoLogin(){
      variables.firstname = arguments.firstname;
      variables.lastname = arguments.lastname;
      variables.email = arguments.email;
      
      rc.UserInfo = new query(sql="Select * from jobs_subscribers where email='#variables.email#'").execute().getResult();
      
      session.username='#variables.firstname# #variables.lastname#';
      session.userid='#rc.userInfo.id#';
      session.loggedin='true';
      
      location (url='index.cfm?view=account&id=#session.userid#', addtoken='false');
   
      
  }
  
  public function JobApply(required string jobid){
     variables.jobid = arguments.jobid;
     variables.userid = arguments.userid;
     variables.name = arguments.firstname & arguments.lastname;
     variables.email = arguments.email;
     variables.resumefile = arguments.resumefile;
     variables.date_applied = arguments.dateapplied;
     variables.ip = arguments.ip;
     
     rc.JobsSQL = "insert into jobs_applications (jobs_id, user_id, name, email, cv_path, created_on, ip)
     VALUES (:jobsid, :userid, :name, :email, :cvpath, :createdon, :ip)";
         rc.Jobs = new query();
         rc.Jobs.addParam(name = "jobsid", value = "#variables.jobid#", cfsqltype = "cf_sql_integer");
         rc.Jobs.addParam(name = "userid", value = "#variables.userid#", cfsqltype = "cf_sql_integer");
         rc.Jobs.addParam(name = "name", value = "#variables.name#", cfsqltype = "cf_sql_varchar");
         rc.Jobs.addParam(name = "email", value = "#variables.email#", cfsqltype = "cf_sql_varchar");
         rc.Jobs.addParam(name = "cvpath", value = "/files/#variables.email#/#variables.resumefile#", cfsqltype = "cf_sql_varchar");
         rc.Jobs.addParam(name = "createdon", value = "#variables.date_applied#", cfsqltype = "cf_sql_date");
         rc.Jobs.addParam(name = "ip", value = "#variables.ip#", cfsqltype = "cf_sql_varchar");
         rc.JobsResult = rc.Jobs.execute(sql = rc.JobsSQL).getResult(); 
      
         location(url='index.cfm?view=account&msg=2&jobID=#variables.jobid#', addToken='false');
      
  }
  
  public function GetUserJobs(){
     
    
     variables.userid = arguments.userid;
         
         rc.JobsSQL = "Select * From jobs_applications JBA 
         Inner JOIN jobs JBS on JBA.jobs_id = JBS.id
         where JBA.user_id=:userid";
         rc.Jobs = new query();
         rc.Jobs.addParam(name = "userid", value = "#variables.userid#", cfsqltype = "cf_sql_integer");
         
         rc.JobsUser = rc.Jobs.execute(sql = rc.JobsSQL).getResult();
         
         
         
         return rc.JobsUser;
    
  }
  
  public function GetApplications(){
     
     variables.jobid = arguments.jobid;
     variables.userid = arguments.userid;
         
         rc.JobsSQL = "Select * From jobs_applications where jobs_id=:jobid and user_id=:userid";
         rc.Jobs = new query();
         rc.Jobs.addParam(name = "jobid", value = "#variables.jobid#", cfsqltype = "cf_sql_integer");
         rc.Jobs.addParam(name = "userid", value = "#variables.userid#", cfsqltype = "cf_sql_integer");
         
         rc.JobsUser = rc.Jobs.execute(sql = rc.JobsSQL).getResult();
         
         if(rc.JObsUser.recordcount is "0"){
            rc.Apply = 'true';
         } else {
            rc.Apply = 'false';
         }
         
         return rc.Apply;
    
  }
  
  public function GetJobCategories(){
     rc.JobCats = new Query(SQL="Select * from Jobs_Categories order By category_order").execute().getResult();
     
     return rc.JobCats;
  }
}
