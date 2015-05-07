<cfoutput>
<div class="content-center job-single">
        <div class="heading-l">
          <h2> Job Description </h2>
        </div>
        <div class="row-fluid">
          <div class="page-nav">
            <div class="span3">
              <a href="index.cfm" class="btn gray jobbtn">back to listing</a>
            </div>
            <div class="span2 pull-right">
             
            </div>
            <div class="span3 pull-right">
              <a href="index.cfm?view=apply&id=#rc.jobs.id#" class="btn gray pre-btn pull-right">Apply for Job</a>
            </div>
          </div>
        </div>
        <div class=" content-center border box-1">
         
          <div class="divider line"></div>
          <div id="job-content-field">
            <div class="field-container single no_border">
              <div class="header-fields">
               
                <div class="date">#dateformat(rc.jobs.created_on, "DD")#<span>#dateformat(rc.jobs.created_on, "MMM")#</span></div>
                <div class="title-company">
                  <div class="title"><a href="##">#rc.jobs.title#</a></div>
                  <div class="company">#rc.jobs.company#</div>
                </div>
              </div>
              <div class="body-field">
                                
                <div class="full-body" style="display: block">
                  <p>#rc.jobs.description#</p>
                </div>
                
                <cfif rc.jobs.salary_doe>
                   <p><strong>Salary</strong> : Dependant Upon Experience</p>
                <cfelse>
                   <p><strong>Salary</strong> : 
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
                   </p>
                   
                </cfif>
                
              </div>
              <div class="block-fields">
              <ul class="candidate-meta meta-fields">
                  <li class="pull-left">Job Role: <span>#rc.jobs.name#</span></li>
                  <li class="pull-center">Industry: <span>#rc.jobs.industry#</span></li>
                  <li class="pull-right">Career Level: <span>#rc.jobs.career_level#</span></li>
                </ul>
                <cfif len(rc.jobs.reqs_responsibilities)>
                <div class="block skills">
                  <h4>Responsibilities</h4>
                  <div class="block-content">
                    
                    <ul class="skill_list">
                      
                    </ul>
                  </div>
                </div>
                </cfif>
              </div>
              <div class="block-fields">
              
                <div class="block skills">
                  <h4>Required Skills</h4>
                  <div class="block-content">
                  <cfif len(rc.jobs.years_experience)>
                      <div class="field  hide">
                         <div class="roll-field">
                          <div class="roll-button"><span></span></div>
                          <div class="label">#rc.jobs.years_experience# Years of Experience</div>
                          <!---div class="progressbar"><span class="progress-count" data-level="60" style="width: 60%;"></span></div--->
                           <div class="description" style="display: none;">...</div>
                        </div>
                        
                      </div>
                      </cfif>
                     <cfif rc.jobs.speak_english>
                      <div class="field hide">
                        <div class="roll-button"><span></span></div>
                        <div class="roll-field">
                          <div class="label">Perfect Written &amp; Spoken English</div>
                          <!---div class="progressbar"><span class="progress-count" data-level="60" style="width: 60%;"></span></div--->
                         
                        </div>
                      </div>
                      </cfif>
                    <cfif rc.jobs.speak_others>
                      <cfset OtherLangs = #rc.jobs.speak_others_List#>
                      <cfset OthersLen = listlen(OtherLangs, ',')>
                      <div class="field roll-with-description hide">
                        <div class="roll-button"><span></span></div>
                        <div class="roll-field">
                          <div class="label">#OthersLen# Foreign Languages</div>
                         <!---div class="progressbar"><span class="progress-count" data-level="60" style="width: 60%;"></span></div--->
                          <div class="description" style="display: block;">#otherLangs#</div>
                        </div>
                      </div>
                      </cfif>
                    <!-- Cleaner -->
                    <div class="clear"></div>
                    <!-- /Cleaner --> 
                  </div>
                </div>
                <div class="block">
                <cfif len(rc.jobs.reqs_additional)>
                  <h4>Additional Requirements</h4>
                  <div class="block-content">
                    <div class="tag-field">Work Permit</div>
                    <div class="tag-field">5 Years Experience</div>
                    <div class="tag-field">MBA</div>
                    <div class="tag-field">Magento Certified</div>
                    <div class="tag-field">Perfect Written &amp; Spoken English</div>
                  </div>
                </cfif>
                  <!-- Cleaner -->
                  <div class="clear"></div>
                  <!-- /Cleaner --> 
                </div>
              </div>
              <div class="buttons-field applybtns">
                <div class="apply"><a href="index.cfm?view=apply&id=#rc.jobs.id#">Apply for This Job</a></div>
               
              </div>
            </div>
          </div>
        </div>
        <div class="clear"></div>
        
        <div class="clear"></div>
        <!-- Clear Line --> 
        
      </div>
</cfoutput>