define(['jquery', 'underscore', 'swfObject', 'bootstrap', 'scroll'], function( $, _, swfObject){
	
	'use strict';
	
	var	MAIN_CONTENT_ID	=	"mainContent",
		GAME_MODAL_ID	=	"gameModal",
		GAME_PARENT_ID	= 	"gameEmbed",
		GAME_LABEL_ID	=	"gameLabel",
		GAME_OBJECT_ID	=	"gameContent";
	
	var $mainContent	=	$("#" + MAIN_CONTENT_ID),
		$gameModal		=	$("#" + GAME_MODAL_ID, $mainContent),
		$gameParent 	=	$("#" + GAME_PARENT_ID, $gameModal),
		$gameLabel		=	$("#" + GAME_LABEL_ID,	$gameModal),
		$mainSection	=	$(".row-fluid", $mainContent),
		$throbber		=	$(".throbber", $mainContent),
		$toTop			=	$(".to-top", $mainContent);
		
	var thumbnail 		= 			"<div class='thumbnail'>"
  								+		"<img data-src='holder.js/300x200' alt='300x200' style='width: 300px; height: 200px;' src='<%=thumbnail_url%>'>"
  								+		"<div class='caption'>"
	  							+			"<h3><%=name%></h3>"
	  							+			"<p><%=description%></p>"
	  							+			"<p><a href='javascript:void(0)' role='button' class='btn btn-primary launch' data-gameurl='<%=swf%>' data-gamename='<%=name%>' data-width='<%=width%>' data-height='<%=height%>'>Launch</a></p>"
  								+		"</div>"
								+	"</div>"
	var _thumbnail 		= 	_.template(thumbnail);
		
	var restoreModal = function(){
		/* 1. Destroy SWF
		 * 2. Restore GameEmbed Markup
		 * 3. Empty Modal Label
		 */
		swfobject.removeSWF(GAME_OBJECT_ID);
		$gameParent.html("<span id='" + GAME_OBJECT_ID + "'></span>");
		$gameLabel.text('');
	};
	
	$mainContent.click(function(event){
		var $src = $(event.target);
		if( $src.is(".launch") ){
			/* 1. Collect Data
			 * 2. Load Modal Label
			 * 3. Load Game
			 * 4. Show Modal
			 */
			
			var gameURL = $src.data('gameurl');
			var gameName = $src.data('gamename');
			var gameWidth = $src.data("width");
			var gameHeight = $src.data("height");
			
			$gameLabel.text(gameName);
			swfobject.embedSWF(gameURL, GAME_OBJECT_ID, gameWidth, gameHeight, "9.0.0");
			
			$gameModal.modal();
		}else if( $src.is(".destroy") ){
			restoreModal();
		}
	});
	
	$toTop.click(function() {
		$("html, body").animate({ scrollTop: 0 }, "slow");
		
		$toTop.hide();
		//$(this).fadeOut('slow');
	  	return false;
	});
	
	$gameModal.on('hidden', restoreModal);
	
	$mainSection.scrollPagination({
		"method"		: 	"GET",
		"dataType"		: 	"json",
		"contentPage"	: 	"/api/games",
		"scrollTarget"	: 	$(window),
		"heightOffset"	: 	10,
		"beforeLoad"	: 	function(obj){
			$throbber.show();
			var objectsRendered = $(".span3", obj).children('[rel!=loaded]');
			return true;
		},
		"successCallback"	: 	function(data, obj){
			var rowhtml = ["", "", "", ""];
			$.each(data.details, function(index, value){
				var thumbnail = _thumbnail(value);
				
				var mod = index%4;
				rowhtml[mod] += thumbnail;
			});
			
			$('.span3', $mainContent).each(function(index){
				$(this).append(rowhtml[index]);
			});
			
			$throbber.hide();
			$toTop.show();
			//$toTop.fadeIn('slow');
		},
		"errorCallback"		: 	function(jqXHR, textStatus, errorThrown){
			
		}
	});
});
