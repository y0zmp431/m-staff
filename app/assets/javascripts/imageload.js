/** delayed image load by Black#FFFFFF **/
loadWait            = 30000;
loadCheck           = 300;
preloadObjects      = ".mosaic_element img";
notImagesLoaded     = [];
excludeImages       = false;
function getScreenHeight(){
var myHeight = 0;
if( typeof( window.innerHeight ) == "number" ) {
  //Non-IE
    myHeight = window.innerHeight;
} else if( document.documentElement &&
( document.documentElement.clientHeight
|| document.documentElement.clientHeight )){
  //IE 6+ in "standards compliant mode"
    myHeight = document.documentElement.clientHeight;
} else if( document.body &&
( document.body.clientHeight || document.body.clientHeight ) ) {
  //IE 4 compatible
    myHeight = document.body.clientHeight;
}
return  myHeight;
}
function preloadOther(){
        var l       = notImagesLoaded.length;
        var currentExists       = false;
        for(var i = 0; i < l; i ++){
  var item          = notImagesLoaded[i];
  if(item){
      loadImage(item);
      currentExists = true;
  };
        };
        if(!currentExists){
    notImagesLoaded = [];
    jQuery(window).unbind("scroll",preloadOther);
        };
};
function imagesPreloader(){
        jQuery(preloadObjects).each(function(){
      var item        =  this;
      if(item.nodeName.toLowerCase()          == "img"
        &&
        (
          typeof excludeImages == "undefined"
          || excludeImages == false
          || (item.className.indexOf(excludeImages) == -1)
        )
      ){
      item.longDesc   = item.src;
      item.src        = "#";
      item.alt        = "";
      var preloaderElt= jQuery("<span></span>");
      jQuery(preloaderElt).css({"display":"block"});
      preloaderElt.className      = "preloader "+item.className;
      jQuery(item).before(preloaderElt);
      loadImage(item);
      };
        });
        jQuery(window).bind("scroll",preloadOther);
};
function loadImage(item){
var pos      = jQuery(item).position();
var ItemOffsetTop        = typeof pos == "object"
&& typeof pos.top != "undefined" ? pos.top : 0;
var documentScrollTop    = jQuery(window).scrollTop();
var scrHeight= getScreenHeight();
if(ItemOffsetTop <= (documentScrollTop + scrHeight)
    && typeof item.storePeriod == "undefined"){
    item.src = item.longDesc;
    item.onerror         = function(){
        this.width       = 0;
        this.height      = 0;
      }
    item.onabort         = function(){
        this.width       = 0;
        this.height      = 0;
      }
    item.wait= 0;
    item.storePeriod     = setInterval(function(){
item.wait    += loadCheck;
if(item.width && item.height && item.complete){
   clearInterval(item.storePeriod);
   item.storePeriod      = false;
   jQuery(item.previousSibling).remove();
   jQuery(item).css("visibility","visible");
    if(typeof item.loadedCount != "undefined"
        && notImagesLoaded[item.loadedCount]){
       notImagesLoaded[item.loadedCount] = false;
    };
  $('.mosaic').masonry('appended',  $(this).parent().parent() ); 

} else if(item.wait > loadWait){
   clearInterval(item.storePeriod);
   item.storePeriod      = false;
   if(typeof item.loadedCount != "undefined"
        && notImagesLoaded[item.loadedCount]){
        notImagesLoaded[item.loadedCount]  = false;
   };
   jQuery(item).css({"display":"none","visibility":"hidden"});
   jQuery(item.previousSibling).remove();
};
    },loadCheck);
   //$('.mosaic').addItem( $(this).parent().parent());
   $('.mosaic').masonry();
} else {
    if(typeof item.loadedCount       == "undefined"){
        item.loadedCount = notImagesLoaded.length;
        notImagesLoaded[item.loadedCount]        = item;
    };
};
};
jQuery(document).ready(imagesPreloader);
