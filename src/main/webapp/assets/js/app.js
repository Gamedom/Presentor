define(['jquery', 'underscore', 'swfObject', 'bootstrap', 'scroll', 'webcam'], function( $, _, swfObject){
	
	'use strict';
	
	var	MAIN_CONTENT_ID	=	'mainContent',
		GAME_MODAL_ID	=	'gameModal',
		GAME_PARENT_ID	= 	'gameEmbed',
		GAME_LABEL_ID	=	'gameLabel',
		GAME_OBJECT_ID	=	'gameContent',
		SIDE_NAV		=	'.bs-docs-sidenav';
	
	var $mainContent	=	$('#' + MAIN_CONTENT_ID),
		$gameModal		=	$('#' + GAME_MODAL_ID, $mainContent),
		$gameParent 	=	$('#' + GAME_PARENT_ID, $gameModal),
		$gameLabel		=	$('#' + GAME_LABEL_ID,	$gameModal),
		$mainSection	=	$('.row-fluid', $mainContent),
		$throbber		=	$('.throbber', $mainContent),
		$toTop			=	$('.to-top', $mainContent),
		$sideNav		=	$(SIDE_NAV);
		
	var thumbnail 		= 			"<div class='thumbnail'>"
  								+		"<img data-src='holder.js/300x200' alt='300x200' style='width: 300px; height: 200px;' src='<%=thumbnail_url%>'>"
  								+		"<div class='caption'>"
	  							+			"<h3><%=name%></h3>"
	  							+			"<p><%=description%></p>"
	  							+			"<p><a href='javascript:void(0)' role='button' class='btn btn-primary launch' data-gameurl='<%=swf%>' data-gamename='<%=name%>' data-width='<%=width%>' data-height='<%=height%>'>Launch</a></p>"
  								+		"</div>"
								+	"</div>";
	var _thumbnail 		= 	_.template(thumbnail);
	
	// Disable certain links in docs
    $('.navbar [href^=#], .bs-docs-sidebar [href^=#]').click(function (e) {
      e.preventDefault();
    });
    
    var $window = $(window);
	/* Side Bar */
    setTimeout(function () {
      $('.bs-docs-sidebar').affix({
          offset: {
              top: function () { return $window.width() <= 980 ? 290 : 210; }
            }
          });
    }, 100);
		
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
		if( $src.is('.launch') ){
			/* 1. Collect Data
			 * 2. Load Modal Label
			 * 3. Load Game
			 * 4. Show Modal
			 */
			
			var gameURL = $src.data('gameurl');
			var gameName = $src.data('gamename');
			var gameWidth = $src.data('width');
			var gameHeight = $src.data('height');
			
			$gameLabel.text(gameName);
			swfobject.embedSWF(gameURL, GAME_OBJECT_ID, gameWidth, gameHeight, '9.0.0');
			
			$gameModal.modal();
		}else if( $src.is('.destroy') ){
			restoreModal();
		}
	});
	
	$toTop.click(function() {
		$('html, body').animate({ scrollTop: 0 }, 'slow');
		
		$toTop.hide();
		//$(this).fadeOut('slow');
	  	return false;
	});
	
	/* SideNav Initialization */
	$sideNav.on('click', function (event) {
		var state = window.NICSIN.state, $target = $(event.target), $li = $target.parent(), category = $target.data('category');
		if( typeof category === 'undefined' || category === '' ) {
			state.changePageType('DEFAULT');
		} else {
			state.changePageType('CATEGORY');
			state.setCategory( category );
			state.resetCount();
		}
		
		
		
		$li.siblings().removeClass('active');
		$li.addClass('active');
		
		$('.span3', $mainContent).each(function(index){
			$(this).empty();
		});
		
		$.ajax({
			url			: calculateDataURL(),
			type		: 'GET',
			dataType	: 'jsonp',
			success		: responseHandler,
			beforeSend 	: function () {
				beforeResponse();
			}
		});
	});
	
	$gameModal.on('hidden', restoreModal);
	
	/* NicSin State Manager */
	window.NICSIN = {
			state : (function() {
				var increment = 20, 
					offset = 0, 
					pageType = 'DEFAULT', 	/* Valid Types Are : DEFAULT, PERSONAL & CATEGORY */
					category = 'action',	/* Valid Types Are : action, adventure, board-game, casino, driving, dress-up, fighting, puzzles, customize, shooting, sports, others, strategy, education, rhythm, jigsaw */
					count = 0;
				
				return {
					getIncrement	: function () {
						return increment;
					},
					getOffset		: function () {
						var cuurentOffset = offset;
						offset += this.getIncrement();
						return cuurentOffset;
					},
					resetOffset		: function () {
						offset = 0;
					},
					getPageType		: function () {
						return pageType;
					},
					changePageType	: function(change) {
						this.resetOffset();
						if(change === this.getPageType()) {
							return;
						}
						pageType = change;
					},
					getCategory		: function () {
						return category;
					},
					setCategory		: function (categoryType) {
						category = categoryType;
					},
					getCount		: function () {
						return count;
					},
					incrementCount		: function () {
						count += 1;
					},
					resetCount			: function () {
						count = 0;
					}
				};
			})()
	};
	
	function calculateDataURL() {
		var state = window.NICSIN.state, pageType = state.getPageType(), category = state.getCategory(), currentOffset = state.getOffset(), limit = state.getIncrement(), dataURL = '';
		
		switch (pageType) {
			case 'PERSONAL':
				dataURL = 'http://feedmonger.mochimedia.com/feeds/query/?q=recommendation%3A%3E%3D4&partner_id=b6818afc19de2630&limit=' + limit + '&offset=' + currentOffset;
				break;
			case 'CATEGORY':
				dataURL = 'http://feedmonger.mochimedia.com/feeds/query/?q=(recommendation%3A%3E%3D4)%20and%20category%3A' + category + '&partner_id=b6818afc19de2630&limit=' + limit + '&offset=' + currentOffset;
				break;
			default:
				dataURL = 'http://feedmonger.mochimedia.com/feeds/query/?q=recommendation%3A%3E%3D4&partner_id=b6818afc19de2630&limit=' + limit + '&offset=' + currentOffset;
				break;
		}
		return dataURL;
	}
	
	/* Load Data On Page Load */
	$.ajax({
		url			: calculateDataURL(),
		type		: 'GET',
		dataType	: 'jsonp',
		success		: function(data, obj) {
			responseHandler(data, obj);
			
			/* Register Scroll After First Load */
			$mainSection.scrollPagination({
				'method'		: 	'GET',
				'dataType'		: 	'jsonp',
				'contentPage'	: 	calculateDataURL,
				'scrollTarget'	: 	$(window),
				'heightOffset'	: 	10,
				'beforeLoad'	: 	beforeResponse,
				'successCallback'	: 	responseHandler,
				'errorCallback'		: 	function(jqXHR, textStatus, errorThrown){
					
				}
			});
		},
		beforeSend 	: function () {
			beforeResponse();
		}
	});
	
	function responseHandler (data, obj) {
		var rowhtml = ['', '', '', ''], state = window.NICSIN.state;
		$.each(data.games, function(index, value){
			
			if( value.thumbnail_large_url ) {
				var thumbnail = _thumbnail({
					thumbnail_url	: value.thumbnail_large_url,
					name			: value.name,
					description		: value.description,
					swf				: value.swf_url,
					width			: value.width,
					height			: value.height
				});
				
				var mod = state.getCount() % 4;
				state.incrementCount();
				rowhtml[mod] += thumbnail;
			}
		});
		
		$('.span3', $mainContent).each(function(index){
			$(this).append(rowhtml[index]);
		});
		
		$throbber.hide();
		$toTop.show();
	};
	
	function beforeResponse (obj) {
		$throbber.show();
		var objectsRendered = $('.span3', obj).children('[rel!=loaded]');
		return true;
	};
	
	$("#camera").webcam({
		width: 320,
		height: 240,
		mode: "callback",
		swffile: "http://www.xarg.org/download/jscam_canvas_only.swf",
		onTick: function() {},
		onSave: function() {},
		onCapture: function() {},
		debug: function() {},
		onLoad: function() {}
	});
});
