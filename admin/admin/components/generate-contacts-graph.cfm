<!--- Placeholder for the graph --->
<div id="contactgraph" style="width:550px;height:300px;"></div>

<cfset thisYear = DateFormat(now(),'yyyy')>
<cfset thisMonthFullName = DateFormat(now(),'mmmm')>
<cfset thisMonth = DateFormat(now(),'mm')>
<cfset numDays = 31>

<cfif thisMonthFullName eq 'September' or thisMonthFullName eq 'April' or thisMonthFullName eq 'June' or thisMonthFullName eq 'November'>
  
  <cfset numDays = 30>

<cfelseif thisMonthFullName eq 'February'>
  
  <cfset numDays = 28>
  
</cfif>

<cfprocessingdirective suppresswhitespace="Yes">
<cfsavecontent variable="temp">
<cfoutput>
{
    "label": "Contacts for #thisMonthFullName#",
    "data": [
    
    <cfset counter = 1>
    <cfloop from="1" to="#numDays#" index="i">
      
      <cfif len(i) is 1>
        <cfset i = '0' & i>
      </cfif>
      
      <cfset formattedDate = #thisYear# & '-' & #thisMonth# & '-' & #i#>
            
      <cfquery name="getContacts" dataSource="#dsn#">
        select `id` from contacts where createdat like '#formattedDate#%' 
      </cfquery>	      
      
      [#i#, #getContacts.recordcount#] <cfif counter lt #numDays#>,</cfif>
      
      <cfset counter = counter + 1>
      
    </cfloop>
    
    ]
}
</cfoutput>
</cfsavecontent>
</cfprocessingdirective>

<cfif StructKeyExists(url,'debug')>
	<cfdump var="#temp#">
</cfif>

<script type="text/javascript">
$(document).ready(function(){
    
    $.plot($("#contactgraph"), [ <cfoutput>#temp#</cfoutput> ],
      {
        lines:{show:true},
        points:{show:true},
        xaxis:{tickSize:1,tickDecimals:0},
        yaxis:{tickSize:1,tickDecimals:0},
        grid: { hoverable: true, clickable: true }
      }       
    );
    
    // === Point hover in chart === //
    var previousPoint = null;
    $("#contactgraph").bind("plothover", function (event, pos, item) {
		
        if (item) {
            
            if (previousPoint != item.dataIndex) {
                previousPoint = item.dataIndex;
                
                $('#tooltip').fadeOut(200,function(){
					       $(this).remove();
				        });
				        
                var x = item.datapoint[0],y = item.datapoint[1];
                    
                unicorn.flot_tooltip(item.pageX, item.pageY,y + ' ' + item.series.label + ' ' + x);
            }
            
        } else {
        
			     $('#tooltip').fadeOut(200,function(){
					   $(this).remove();
				    });
           
           previousPoint = null;           
        }
           
    });
    
    
});


unicorn = {
	
		// === Tooltip for flot charts === //
		flot_tooltip: function(x, y, contents) {
			
			$('<div id="tooltip">' + contents + '</div>').css( {
				top: y + 5,
				left: x + 5
			}).appendTo("body").fadeIn(200);
		}
}



</script>

