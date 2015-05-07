<cfscript>
   rc.UserInfo = rc.JobsCom.GetUserInfo(userid='#session.userid#');
</cfscript>
<cfoutput>
<div id="search-filter" class="block background">
    <h2 class="title-1">My Account Options</h2>
        <div class="block-content">
           
            <div class="filter-category">
              
              <div class="filter-content show">
                <div class="filter-container" style="display: block;">
                  <div class="major">
                  
                    <ul>
                     
                        <li><a href="index.cfm?view=account&sec=res">My Resume</a></li>
                    
                        <li><a href="index.cfm?view=account&sec=upl">Upload My Resume</a></li>   
                     
                      <li><a href="index.cfm?view=account&sec=inf">My Info</a></li>
                      
                      <li><a href="index.cfm?view=logout">Logout</a></li>
                      
                     
                    </ul>
                  </div>
                  
                </div>
                
              </div>
            </div>
            
        </div>  
 </div>
</cfoutput>