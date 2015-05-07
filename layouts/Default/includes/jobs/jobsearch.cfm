<cfscript>
  rc.JobCats = rc.JobsCom.getJobCategories();
</cfscript>
     <div id="search-filter" class="block background">
          <h2 class="title-1">Results Filtering</h2>
          <div class="block-content">
           
            <div class="filter-category">
              <h3>By Job Role</h3>
              <div class="filter-content show">
                <div class="filter-container" style="display: block;">
                  <div class="major">
                  <cfoutput>
                  <cfscript>
                     
                  </cfscript>  
                    <ul>
                      <cfloop query="#rc.JobCats#">
                      <cfscript>
                         rc.JobCount = new Query(SQL="Select Count(id) as Total from Jobs where category_id=#rc.JobCats.id#").execute().getResult();
                      </cfscript>
                      <li>#name# (#numberformat(rc.JobCount.Total)#)</li>
                      
                      </cfloop>
                      </cfoutput>
                    </ul>
                  </div>
                  
                </div>
                
              </div>
            </div>
            
        </div>
     </div>