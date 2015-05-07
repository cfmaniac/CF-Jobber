<cfoutput>
    <div id="search-filter" class="block background">
          <h2 class="title-1">Quick Info</h2>
          <div class="block-content">
           
            <div class="filter-category">
            <ul>
                <li><strong>Title:</strong> #rc.jobs.title#</li>
                <li><storng>Company:</storng> #rc.jobs.company#</li>
                
                <cfif rc.jobs.salary_doe>
                   <li><strong>Salary</strong> : Dependant Upon Experience</li>
                <cfelse>
                   <li><strong>Salary</strong> : 
                   <cfif len(rc.jobs.salary_min)>
                   #numberformat(rc.jobs.salary_min)#
                   </cfif>
                   <cfif len(rc.jobs.salary_max)>
                   - #numberformat(rc.jobs.salary_max)#
                   </cfif>
                   <cfif rc.jobs.salary_annual>
                      / Year
                   <cfelse>
                     / Hour  
                   </cfif>
                   </li>
                   
                </cfif>
                <cfif len(rc.jobs.years_experience)>
                <li><strong>Experience: </strong>#rc.jobs.years_experience# Years of Experience</li>
                </cfif>
                
                <cfif rc.jobs.speak_english>
                <li>Speak English: Perfect Written &amp; Spoken English</li>
                </cfif>
            </ul>
            </div>
          </div>
    </div>
</cfoutput>