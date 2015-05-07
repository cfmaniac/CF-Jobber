<cfscript>
   //UDFs:
   string function snippet( content, charactercount=100 ){
		var result = Trim( reReplace( arguments.content, "<[^>]{1,}>", " ", "all" ) );
		if ( Len( result ) > arguments.charactercount + 10 ) return "<p>" & Trim( Left( result, arguments.charactercount ) ) & "&hellip;</p>";
		else return result;
	}

	string function getTimeInterval( date, datemask="dddd dd mmmm yyyy" ){
		var timeinseconds = 0;
		var result = "";
		var interval = "";
		if( IsDate( arguments.date ) ){
			timeinseconds = DateDiff( 's', arguments.date, Now() );
			// less than a minute
			if( timeinseconds < 60 ){ 
				result = " less than a minute ago";
			}
			// less than an hour
			else if ( timeinseconds < 3600 ){ 
				interval = Int( timeinseconds / 60 );
				// more than 1 minute
				if ( interval > 1 ) result = interval & " minutes ago";
				else result = interval & " minute ago";
			}
			// less than 24 hours
			else if ( timeinseconds < ( 86400 ) && Hour( Now() ) >= Hour( arguments.date ) ){ 
				interval = Int( timeinseconds / 3600 );
				// more than 1 hour
				if ( interval > 1 ) result = interval & " hours ago";
				else result = interval & " hour ago";
			}
			// less than 48 hours
			else if ( timeinseconds < 172800 ){ 
				result = "yesterday" & " at " & TimeFormat( arguments.date, "HH:MM" );
			}
			// return the date
			else{ 
				result = DateFormat( arguments.date, arguments.datemask ) & " at " & TimeFormat( arguments.date, "HH:MM" );
			}
		}
		return result;
	}
</cfscript>
<!DOCTYPE html>
<html class="no-js pattern_1">
<head>
<title>Job Board Templete</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
<base href="<cfoutput>#request.basehref#</cfoutput>">
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Lato:300,400,700&amp;subset=latin,latin-ext"/>
<link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700' rel='stylesheet' type='text/css'>
<link href="assets/styles/font-awesome.css" rel="stylesheet" type="text/css" />
<link href="assets/styles/font-awesome-ie7.css" rel="stylesheet" type="text/css" />
<link href="assets/styles/bootstrap.css" rel="stylesheet">
<link href="assets/styles/bootstrap-responsive.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="assets/styles/reset.css"/>
<link id="color_css" rel="stylesheet" type="text/css" href="assets/styles/color_scheme_1.css"/>
<link rel="stylesheet" type="text/css" href="assets/styles/jquery.combosex.css"/>
<link rel="stylesheet" type="text/css" href="assets/styles/jquery.flexslider.css"/>
<link rel="stylesheet" type="text/css" href="assets/styles/jquery.scrollbar.css"/>

<!--[if (lte IE 9)]>
    <link rel="stylesheet" type="text/css" href="assets/styles/iefix.css"/>
    <![endif]-->
<script type="text/javascript" src="assets/scripts/jquery.1.7.2.min.js"></script>
<script type="text/javascript" src="assets/scripts/jquery-ui.1.7.2.min.js"></script>
<script type="text/javascript" src="assets/scripts/bootstrap.min.js"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript" src="assets/scripts/jquery.combosex.min.js"></script>
<script type="text/javascript" src="assets/scripts/jquery.flexslider-min.js"></script>
<script type="text/javascript" src="assets/scripts/jquery.mousewheel.js"></script>
<script type="text/javascript" src="assets/scripts/jquery.easytabs.min.js"></script>
<script type="text/javascript" src="assets/scripts/jquery.gmap.min.js"></script>
<script type="text/javascript" src="assets/scripts/jquery.scrollbar.min.js"></script>
<script type="text/javascript" src="assets/scripts/jQuery.menutron.js"></script>
<script type="text/javascript" src="assets/scripts/jquery.isotope.min.js"></script>
<script type="text/javascript" src="assets/scripts/custom.js"></script>

</head>
<body>
<cfoutput>

<!---Page Layouts are contained within DEFAULT.CFM--->
</cfoutput>