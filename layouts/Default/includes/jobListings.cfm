<cfscript>
   
</cfscript>
<cfoutput>
   <div class="field-container odd box-1 hide">
              <div class="nav-buttons">
                <ul>
                  <li class="show-hide hide"><a></a></li>
                 <cfif len(url)>
                  <li class="link"><a href="job.html"></a></li>
                 </cfif>
                </ul>
              </div>
              <div class="header-fields">
                <div class="date">#dateformat(created_on, "DD")#<span>#dateformat(created_on, "MMM")#</span></div>
                <div class="title-company">
                  <div class="title"><a href="index.cfm?view=job&id=#id#">#title#</a></div>
                  <div class="company">#company#</div>
                </div>
               
              </div>
              <div class="body-field">
                <div class="teaser">
                  <p>#snippet(summary)#
                  <span class="read-more"><a>Read More</a></span></p>
                </div>
                <div class="full-body" style="display: none;">
                  <p>#description#</p>
                </div>
                <ul class="candidate-meta meta-fields">
                  <li class="pull-left">Job Role: <span>#name#</span></li>
                  <li class="pull-center">Industry: <span>#industry#</span></li>
                  <li class="pull-right">Career Level: <span>#career_level#</span></li>
                </ul>
                <div class="block-fields" style="display: none;">
                  <div class="block skills">
                    <h4>Required Skills</h4>
                    <div class="block-content">
                      <cfif len(years_experience)>
                      <div class="field  hide">
                         <div class="roll-field">
                          <div class="roll-button"><span></span></div>
                          <div class="label">#years_experience# Years of Experience</div>
                          <!---div class="progressbar"><span class="progress-count" data-level="60" style="width: 60%;"></span></div--->
                           <div class="description" style="display: none;">...</div>
                        </div>
                        
                      </div>
                      </cfif>
                      <cfif speak_english>
                      <div class="field hide">
                        <div class="roll-button"><span></span></div>
                        <div class="roll-field">
                          <div class="label">Perfect Written &amp; Spoken English</div>
                          <!---div class="progressbar"><span class="progress-count" data-level="60" style="width: 60%;"></span></div--->
                         
                        </div>
                      </div>
                      </cfif>
                      
                      <cfif speak_others>
                      <cfset OtherLangs = #speak_others_List#>
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
                    <h4>Additional Requirements</h4>
                    <div class="block-content">
                      <div class="tag-field">Work Permit</div>
                      <div class="tag-field">5 Years Experience</div>
                      <div class="tag-field">MBA</div>
                      <div class="tag-field">Magento Certified</div>
                      <div class="tag-field">Perfect Written &amp; Spoken English</div>
                    </div>
                    <!-- Cleaner -->
                    <div class="clear"></div>
                    <!-- /Cleaner --> 
                  </div>
                </div>
                <cfif apply_online>
                <div class="buttons-field applybtns" style="display: none;">
                  <div class="apply"><a href="index.cfm?view=apply&id=#id#">Apply for This Job</a></div>
                  
                </div>
               </cfif>
              </div>
            </div>
</cfoutput>