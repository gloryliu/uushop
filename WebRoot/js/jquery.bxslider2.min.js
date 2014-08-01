/*
bxSlider v2.0
Plugin developed by: Steven Wanderski
http://bxslider.com
http://stevenwanderski.com

Released under the GPL license:
http://www.gnu.org/licenses/gpl.html
*/


(function($){$.fn.bxSlider=function(options){var defaults={alignment:'horizontal',controls:true,speed:500,pager:true,margin:0,next_text:'next',next_image:'',prev_text:'prev',prev_image:'',auto:false,pause:3500,auto_direction:'next',auto_hover:true,auto_controls:false,ticker:false,ticker_controls:false,ticker_direction:'next',ticker_hover:true,stop_text:'stop',start_text:'start',wrapper_class:'bxslider_wrap'};var o=$.extend(defaults,options);return this.each(function(){var $this=$(this);var $kids=$this.children();var l=$this.children().length;var first=$this.children(':first').clone();var last=$this.children(':last').clone();var w=0,h=0,current_temp=0,pos=0,d=0;var is_working=false,playing=true,tick_play=true;var current=1;var ease='swing',side='',t='';var ani={};$this.append(first).prepend(last);$this.wrap('<div class="bxslider_container"></div>');$this.parent().wrap('<div class="'+o.wrapper_class+'"></div>');if(o.alignment=='horizontal'){$this.children().css({'float':'left','listStyle':'none','marginRight':o.margin});w=first.outerWidth(true);$this.css({'width':'99999px','position':'relative','left':-w});$this.parent().css({'position':'relative','overflow':'hidden','width':w-o.margin});}else if(o.alignment=='vertical'){$kids.each(function(){if($(this).height()>h){h=$(this).height();}});w=first.outerWidth();$this.children().css({'height':h,'listStyle':'none','marginBottom':o.margin});$this.css({'height':'99999px','width':w,'position':'relative','top':-(h+o.margin)});$this.parent().css({'position':'relative','overflow':'hidden','height':h})}
if(o.pager&&!o.ticker){$this.parent().after('<div class="bx_pager"></div>');var $a;$kids.each(function(index){$a=$('<a href="#">'+(index+1)+'</a>');$this.parent().siblings('.bx_pager').append($a);$a.click(function(){is_working=false;tick_play=false;$this.stop();move_slide(index+1);current=index+1;if(o.auto){clearInterval(t);$this.parent().siblings('.auto_controls').find('a').html(o.start_text);playing=false;}
else if(o.ticker){$this.parent().siblings('.ticker_controls').find('a').html(o.start_text);playing=false;}
return false;});});set_active(1);}
if(o.controls&&!o.ticker){if(o.next_image!=''||o.prev_image!=''){$this.parent().after('<a class="prev" href="#"><img src="'+o.prev_image+'" /></a><a class="next" href="#"><img src="'+o.next_image+'" /></a>');}
else{$this.parent().after('<a class="prev" href="#">'+o.prev_text+'</a><a class="next" href="#">'+o.next_text+'</a>');}
$this.parent().siblings('.next').click(function(){if(!is_working){move_slide(++current);}
if(o.auto){clearInterval(t);$this.parent().siblings('.auto_controls').find('a').html(o.start_text);playing=false;}
return false;});$this.parent().siblings('.prev').click(function(){if(!is_working){move_slide(--current);}
if(o.auto){clearInterval(t);$this.parent().siblings('.auto_controls').find('a').html(o.start_text);playing=false;}
return false;});}
if(o.auto&&!o.ticker){t=setInterval(function(){if(o.auto_direction=='next'){move_slide(++current);}else{move_slide(--current);}},o.pause);if(o.auto_hover){$this.hover(function(){clearInterval(t);},function(){if(playing){t=setInterval(function(){if(o.auto_direction=='next'){move_slide(++current);}
else{move_slide(--current);}},o.pause);}});}
if(o.auto_controls){$this.parent().after('<div class="auto_controls"><a class="auto_link" href="#">'+o.stop_text+'</a></div>');$this.parent().siblings('.auto_controls').find('a').click(function(){if(playing){clearInterval(t);$(this).html(o.start_text);playing=false;}
else{t=setInterval(function(){if(o.auto_direction=='next'){move_slide(++current);}else{move_slide(--current);}},o.pause);$(this).html(o.stop_text);playing=true;}
return false;});}}
if(o.ticker){var tick_play=true;tick_slide();$this.hover(function(){$this.stop();},function(){if(tick_play){tick_slide();}});if(o.ticker_controls){$this.parent().after('<div class="ticker_controls"><a class="ticker_link" href="#">'+o.stop_text+'</a></div>');$this.parent().siblings('.ticker_controls').find('a').click(function(){if(tick_play){$this.stop();$(this).html(o.start_text);tick_play=false;}
else{is_working=false;$(this).html(o.stop_text)
tick_slide();tick_play=true;}
return false;});}}
function tick_slide(){if(o.ticker_direction=='next'&&o.alignment=='horizontal'){$this.animate({left:'-=5px'},o.speed/5,'linear',function(){if(parseInt($this.css('left'))<=-((l+1)*w)){$this.css('left',-w);}
tick_slide();});}else if(o.ticker_direction=='prev'&&o.alignment=='horizontal'){$this.animate({left:'+=5px'},o.speed/5,'linear',function(){if(parseInt($this.css('left'))>=-(w)){$this.css('left',-((l+1)*w));}
tick_slide();});}else if(o.ticker_direction=='next'&&o.alignment=='vertical'){$this.animate({top:'-=5px'},o.speed/5,'linear',function(){if(parseInt($this.css('top'))<=-((l+1)*(h+o.margin))){$this.css('top',-(h+o.margin));}
tick_slide();});}else if(o.ticker_direction=='prev'&&o.alignment=='vertical'){$this.animate({top:'+=4px'},o.speed/5,'linear',function(){if(parseInt($this.css('top'))>-(h+o.margin)){$this.css('top',-((l+1)*(h+o.margin-1)));}
tick_slide();});}}
function move_slide(num){if(o.ticker){ease='linear';}
if(!is_working){if(o.alignment=='horizontal'){d=w;side='left';}
else if(o.alignment=='vertical'){d=h+o.margin;side='top';}
pos=num*d;ani[side]=-pos;is_working=true;$this.animate(ani,o.speed,ease,function(){is_working=false;if(current>l){$this.css(side,-d);current=1;}
else if(current<1){$this.css(side,-(d*l));current=l;}
set_active(current);});}}
function set_active(num){if(o.pager){$('.bx_pager a').removeClass('active').eq(num-1).addClass('active');}}});};})(jQuery);