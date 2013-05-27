/*
**	Anderson Ferminiano
**	contato@andersonferminiano.com -- feel free to contact me for bugs or new implementations.
**	jQuery ScrollPagination
**	28th/March/2011
**	http://andersonferminiano.com/jqueryscrollpagination/
**	You may use this script for free, but keep my credits.
**	Thank you.
*/

(function( $ ){
	 
		 
 $.fn.scrollPagination = function(options) {
  	
		var opts = $.extend($.fn.scrollPagination.defaults, options);
		var target = opts.scrollTarget;
		if (target == null){
			target = obj; 
	 	}
		opts.scrollTarget = target;
	 	
	 	/* Set this variable true when ajax in progress */
	 	var loading = false;
	 	
		return this.each(function() {
		  $.fn.scrollPagination.init($(this), opts);
		});

  };
  
  $.fn.stopScrollPagination = function(){
	  return this.each(function() {
	 	$(this).attr('scrollPagination', 'disabled');
	  });
	  
  };
  
  $.fn.scrollPagination.loadContent = function(obj, opts){
	 var target = opts.scrollTarget, loadTrigger = $(target).scrollTop()+opts.heightOffset;
	 var mayLoadContent = loadTrigger >= $(document).height() - $(target).height();
	 if (mayLoadContent){
	 	if(obj.loading){
	 		return;
	 	}
	 	
		 if (opts.beforeLoad != null){
			/* We need to get a response from the beforeLoad function and continue or break the function */
                        var response = opts.beforeLoad(obj); 
                        if(!response) return;
		 }
		 
		 obj.loading = true;
		 $.ajax({
			  type: opts.method,
			  url: $.isFunction(opts.contentPage) ? opts.contentPage() : opts.contentPage,
			  data: opts.contentData,
			  success: function(data){
			  	obj.loading = false;
			  	if(!opts.successCallback){
					$(obj).append(data); 
					var objectsRendered = $(obj).children('[rel!=loaded]');
					
					if (opts.afterLoad != null){
						opts.afterLoad(objectsRendered);	
					}
				}else{
					opts.successCallback(data, obj);
				}
			  },
			  error: function(jqXHR, textStatus, errorThrown) {
			  	obj.loading = false;
			  	if(!opts.errorCallback){
			  		console.log(errorThrown);
			  	}else{
			  		opts.errorCallback(jqXHR, textStatus, errorThrown);
			  	}
			  },
			  dataType: opts.dataType,
			  cache: opts.cache
		 });
	 }
	 
	 // code for fade in element by element
	$.fn.fadeInWithDelay = function(){
		var delay = 0;
		return this.each(function(){
			$(this).delay(delay).animate({opacity:1}, 200);
			delay += 100;
		});
	};
	 
  };
  
  $.fn.scrollPagination.init = function(obj, opts){
	 var target = opts.scrollTarget;
	 $(obj).attr('scrollPagination', 'enabled');
	
	 $(target).scroll(function(event){
		if ($(obj).attr('scrollPagination') == 'enabled'){
	 		$.fn.scrollPagination.loadContent(obj, opts);		
		}
		else {
			event.stopPropagation();	
		}
	 });
	 
	 $.fn.scrollPagination.loadContent(obj, opts);
	 
 };
	
 $.fn.scrollPagination.defaults = {
 		 'method' : 'POST',
 		 'dataType' : 'html',
      	 'contentPage' : null,
     	 'contentData' : {},
		 'beforeLoad': null,
		 'afterLoad': null	,
		 'scrollTarget': null,
		 'heightOffset': 0,
		 'cache': false,
		 'topTrigger': 100
 };	
})( jQuery );