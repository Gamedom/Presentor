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
	    		To access many of the new PayPal features, you'll need to turn on JavaScript and enable cookies. You can do this in your web browser's settings area.
	    	</p>
	    </noscript>
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
			      	<a class="brand" href="#">NicSin Games</a>
			 
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
		    	<p class="lead">Glide through an immersive world. Break the barriers of time & space</p>
		  	</div>
		</header>
		<div class="container" id="mainContent">
			<a class="btn to-top btn-inverse no-load" href="#bodyId"><i class="icon-chevron-up icon-white"></i></a>
			<section>
				<div class="row-fluid">
					<div class="span3">
						<div class="thumbnail">
					  		<img data-src="holder.js/300x200" alt="300x200" style="width: 300px; height: 200px;"  
					  		src="assets/games/running-men/_thumb_200x200.jpg">
					  		<div class="caption">
						  		<h3>Running Men</h3>
						  		<p>Some global Corporation carries out professional development training for their managers. You play as one of these managers, who perform the tasks of training by means of guinea pigs. You've never seen anything like it. At first glance, you might think that it's a usual arcade-puzzle game. But actually, it's a serious psychological drama with unique gameplay and elements of social satire. After playing this game you will forever change your attitude to computer and video games.</p>
						  		<p><a href="javascript:void(0)" role="button" class="btn btn-primary launch" data-gameurl="http://games.mochiads.com/c/g/running-men/rm_mochi.swf" data-gamename="Running Men" data-width="640" data-height="480">Launch</a></p>
					  		</div>
						</div>
			  		</div>
			  		<div class="span3">
			  			<div class="thumbnail">
					  		<img data-src="holder.js/300x200" alt="300x200" style="width: 300px; height: 200px;"  
					  		src="assets/games/puzzle-prince/_thumb_200x200.png">
					  		<div class="caption">
						  		<h3>Puzzle Prince</h3>
						  		<p>Do you have what it takes to battle against zombies, monsters and other bad guys in this amazing looking puzzle battler? Taking on the game mechanics of Collapse and combining it with the versus battling of Puzzle Quest, you are set on a journey to save the kingdom with the aid of destroying magical groups of orbs. Only you can control this mage to victory!</p>
						  		<p><a href="javascript:void(0)" role="button" class="btn btn-primary launch" data-gameurl="http://games.mochiads.com/c/g/puzzle-prince/PP_Mochi_NoLockv46.swf" data-gamename="Puzzle Prince" data-width="700" data-height="580">Launch</a></p>
					  		</div>
						</div>
			  		</div>
			  		<div class="span3">
						<div class="thumbnail">
					  		<img data-src="holder.js/300x200" alt="300x200" style="width: 300px; height: 200px;"  
					  		src="assets/games/running-men/_thumb_200x200.jpg">
					  		<div class="caption">
						  		<h3>Running Men</h3>
						  		<p>Some global Corporation carries out professional development training for their managers. You play as one of these managers, who perform the tasks of training by means of guinea pigs. You've never seen anything like it. At first glance, you might think that it's a usual arcade-puzzle game. But actually, it's a serious psychological drama with unique gameplay and elements of social satire. After playing this game you will forever change your attitude to computer and video games.</p>
						  		<p><a href="javascript:void(0)" role="button" class="btn btn-primary launch" data-gameurl="http://games.mochiads.com/c/g/running-men/rm_mochi.swf" data-gamename="Running Men" data-width="640" data-height="480">Launch</a></p>
					  		</div>
						</div>
			  		</div>
			  		<div class="span3">
			  			<div class="thumbnail">
					  		<img data-src="holder.js/300x200" alt="300x200" style="width: 300px; height: 200px;"  
					  		src="assets/games/puzzle-prince/_thumb_200x200.png">
					  		<div class="caption">
						  		<h3>Puzzle Prince</h3>
						  		<p>Do you have what it takes to battle against zombies, monsters and other bad guys in this amazing looking puzzle battler? Taking on the game mechanics of Collapse and combining it with the versus battling of Puzzle Quest, you are set on a journey to save the kingdom with the aid of destroying magical groups of orbs. Only you can control this mage to victory!</p>
						  		<p><a href="javascript:void(0)" role="button" class="btn btn-primary launch" data-gameurl="http://games.mochiads.com/c/g/puzzle-prince/PP_Mochi_NoLockv46.swf" data-gamename="Puzzle Prince" data-width="700" data-height="580">Launch</a></p>
					  		</div>
						</div>
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
			    	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">�</button>
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
		<script data-main="" src="assets/js/lib/require.js"></script>
	</body>
</html>
