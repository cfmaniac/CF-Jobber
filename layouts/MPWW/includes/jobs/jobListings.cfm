<cfscript>
   
</cfscript>
<cfoutput>
   <div class="field-container odd box-1 hide" >
              <div class="nav-buttons">
                <ul>
                  <li class="show-hide hide"><a></a></li>
                 
                </ul>
              </div>
              <div class="header-fields">
                <div class="date">#dateformat(created_on, "DD")#<span>#dateformat(rc.Jobs.created_on, "MMM")#</span></div>
                <div class="title-company">
                  <div class="title"><a href="index.cfm?view=job&id=#rc.Jobs.id#">#rc.Jobs.title#</a></div>
                  <div class="company">#rc.Jobs.company#</div>
                </div>
               
              </div>
              <div class="body-field">
                <div class="teaser">
                  <p>#snippet(rc.Jobs.summary)#
                  <span class="read-more"><a>Read More</a></span></p>
                </div>
                <div class="full-body" style="display: none;">
                  <p>#rc.Jobs.description#</p>
                </div>
                <ul class="row candidate-meta meta-fields">
                  <li class="pull-left" >Job Role: #rc.Jobs.name#</li>
                  <li class="pull-center" >Industry:#rc.Jobs.industry#</li>
                  <li class="pull-right">Career Level:#rc.Jobs.career_level#</li>
                </ul>
                <div class="block-fields" style="display: none;">
                  <div class="block skills">
                    <h4>Required Skills</h4>
                    <div class="block-content">
                      <cfif len(rc.Jobs.years_experience)>
                      <div class="field  hide">
                         <div class="roll-field">
                          <div class="roll-button"><span></span></div>
                          <div class="label">#rc.Jobs.years_experience# Years of Experience</div>
                          <!---div class="progressbar"><span class="progress-count" data-level="60" style="width: 60%;"></span></div--->
                           <div class="description" style="display: none;">...</div>
                        </div>
                        
                      </div>
                      </cfif>
                      <cfif rc.Jobs.speak_english>
                      <div class="field hide">
                        <div class="roll-button"><span></span></div>
                        <div class="roll-field">
                          <div class="label">Perfect Written &amp; Spoken English</div>
                          <!---div class="progressbar"><span class="progress-count" data-level="60" style="width: 60%;"></span></div--->
                         
                        </div>
                      </div>
                      </cfif>
                      
                      <cfif rc.Jobs.speak_others>
                      <cfset OtherLangs = #rc.Jobs.speak_others_List#>
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
                       <cfif len(rc.Jobs.reqs_additional)>
                        <cfset additional = #rc.Jobs.reqs_additional#>
                        <cfset additionalList = listlen(additional, ',')>
                        
                        <cfloop list="additionalList" delimiters="," index = "aReqs">
                           <div class="tag-field">#aReqs#</div>
                           
                        </cfloop>
                        
                     </cfif>
                    </div>
                    <!-- Cleaner -->
                    <div class="clear"></div>
                    <!-- /Cleaner --> 
                  </div>
                </div>
                <cfif apply_online>
                <div class="buttons-field applybtns" style="display: none;">
                  <div class="apply"><a href="index.cfm?view=apply&id=#rc.Jobs.id#">Apply for This Job</a></div>
                  
                </div>
               </cfif>
              </div>
            </div>
</cfoutput>