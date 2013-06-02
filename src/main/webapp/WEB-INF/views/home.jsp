<%@ include file="/WEB-INF/views/includes/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<title>NicSin Games</title>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7" />
		
		<meta name="application-name" content="NicSin Games" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<link rel="shortcut icon" href="<c:url value='/assets/ico/favicon.ico'/>">
		<link rel="apple-touch-icon-precomposed" sizes="144x144" href="https://raw.github.com/SpringSource/spring-integration-templates/master/si-sts-templates/builds/1.0.0.M5/ico/apple-touch-icon-144-precomposed.png">
		<link rel="apple-touch-icon-precomposed" sizes="114x114" href="https://raw.github.com/SpringSource/spring-integration-templates/master/si-sts-templates/builds/1.0.0.M5/ico/apple-touch-icon-114-precomposed.png">
		<link rel="apple-touch-icon-precomposed" sizes="72x72"   href="https://raw.github.com/SpringSource/spring-integration-templates/master/si-sts-templates/builds/1.0.0.M5/ico/apple-touch-icon-72-precomposed.png">
		<link rel="apple-touch-icon-precomposed"                 href="https://raw.github.com/SpringSource/spring-integration-templates/master/si-sts-templates/builds/1.0.0.M5/ico/apple-touch-icon-57-precomposed.png">
	  	
		<link href="<c:url value='/wro/g1.css'/>" rel="stylesheet">
		
		<!--[if IE]>
			<link rel="stylesheet" type="text/css" href="css/components/layout/layoutIE.css" />
		<![endif]-->
		
		<%-- Framebusting CSS --%>
	  	<style type="text/css" id="antiClickjack">
	  		body {display: none !important;}
	  	</style>
	 	<%-- Framebusting JavaScript --%>
		<script type="text/javascript">
			if (self === top) {
				var antiClickjack = document.getElementById("antiClickjack");
				antiClickjack.parentNode.removeChild(antiClickjack);
			} else {
				top.location = self.location;
			}
		</script>
		
		<script src="assets/js/lib/modernizr.js"></script>
	</head>
	<body>
		<noscript>
	    	<style type="text/css">body{display:block !important;}</style>
	    	<p class="nonjsAlert">
	    		To access many exciting features of NicSin Games, you'll need to turn on JavaScript and enable cookies. You can do this in your web browser's settings area.
	    	</p>
	    </noscript>
	    <%@ include file="/WEB-INF/views/includes/analytics.jsp"%>
	    <div class="navbar navbar-fixed-top navbar-inverse">
			<div class="navbar-inner">
			    <div class="container">
			 
			    	<%-- .btn-navbar is used as the toggle for collapsed navbar content --%>
				   	<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
				    	<span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				    </a>
			 
			      	<%-- Brand Name Outside --%>
			      	<a class="brand" href="http://nicsin.com">NicSin</a>
			 
			      	<%-- Everything to hide goes inside --%>
			      	<div class="nav-collapse collapse">
				      	<ul class="nav">
					    	<li class="active"><a href="#">Home</a></li>
					      	<li><a href="#">Browse</a></li>
					      	<li><a href="#">Contact us</a></li>
					    </ul>
			     	</div>
			 
			    </div>
		  	</div>
		</div>
		<header class="jumbotron subhead" id="overview">
			<div class="container">
		    	<h1>NicSin Games</h1>
		    	<p class="lead">Break the barriers of time & space. Glide through an immersive world of games.</p>
		  	</div>
		</header>
		<div class="bs-docs-sidebar">
	    	<ul class="nav nav-list bs-docs-sidenav">
	        	<li class="active"><a href="#all"><i class="icon-chevron-right"></i> Explore All</a></li>
	        	<li><a href="#action" data-category="action"><i class="icon-chevron-right"></i> Action</a></li>
	          	<li><a href="#adventure" data-category="adventure"><i class="icon-chevron-right"></i> Adventure</a></li>
	          	<li><a href="#board-game" data-category="board-game"><i class="icon-chevron-right"></i> Board Game</a></li>
	          	<li><a href="#casino" data-category="casino"><i class="icon-chevron-right"></i> Casino</a></li>
	          	<li><a href="#driving" data-category="driving"><i class="icon-chevron-right"></i> Driving</a></li>
	          	<li><a href="#dress-up" data-category="dress-up"><i class="icon-chevron-right"></i> Dress Up</a></li>
	          	<li><a href="#fighting" data-category="fighting"><i class="icon-chevron-right"></i> Fighting</a></li>
	          	<li><a href="#puzzles" data-category="puzzles"><i class="icon-chevron-right"></i> Puzzles</a></li>
	          	<li><a href="#customize" data-category="customize"><i class="icon-chevron-right"></i> Pimp my / Customize</a></li>
	          	<li><a href="#shooting" data-category="shooting"><i class="icon-chevron-right"></i> Shooting</a></li>
	          	<li><a href="#sports" data-category="sports"><i class="icon-chevron-right"></i> Sports</a></li>
	          	<li><a href="#other" data-category="other"><i class="icon-chevron-right"></i> Others</a></li>
	          	<li><a href="#strategy" data-category="strategy"><i class="icon-chevron-right"></i> Strategy</a></li>
	          	<li><a href="#education" data-category="education"><i class="icon-chevron-right"></i> Education</a></li>
	          	<li><a href="#rhythm" data-category="rhythm"><i class="icon-chevron-right"></i> Rhythm</a></li>
	          	<li><a href="#jigsaw" data-category="jigsaw"><i class="icon-chevron-right"></i> Jigsaw / Slider Puzzles</a></li>
	    	</ul>
	    </div>
		<div class="container" id="mainContent">
			<a class="btn to-top btn-inverse no-load" href="#bodyId"><i class="icon-chevron-up icon-white"></i></a>
			<section>
				<div class="row-fluid">
					<div class="span3">
			  		</div>
			  		<div class="span3">
			  		</div>
			  		<div class="span3">
			  		</div>
			  		<div class="span3">
			  		</div>
				</div>
			</section>
			<div class="well well-large throbber no-load">
				<div class="progress progress-striped active">
	  				<div class="bar" style="width: 100%;"></div>
				</div>
			</div>
			<div id="gameModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-header">
			    	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			    	<h3 id="gameLabel"></h3>
			  	</div>
			  	<div class="modal-body">
			    	<span id="gameEmbed">
			    		<span id="gameContent">
				    		<a href="http://www.adobe.com/go/getflashplayer">
								<img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player" />
							</a>
						</span>
			    	</span>
			  	</div>
			  	<div class="modal-footer">
			    	<button class="btn destroy" data-dismiss="modal" aria-hidden="true">Close</button>
			  	</div>
			</div>
		</div>
		<script data-main="assets/js/main" src="assets/js/lib/require.js"></script>
	</body>
</html>
