$(function(){
	
	var	$images = $('.photos >li>a');
	var liIndex;
	var targetImg;
	var $newBack = $('.newBack');
	var $li = $('.photos').find('> li');
		
	function replaceImg(src) {
		$('.modal_div').find('img').attr('src', src);}
		

	function getHref(index) {
		return $li.eq(index).find('>a').attr('href');}
		
		
	function setCookie(cname, cvalue, exdays) {
		var d = new Date();
		d.setTime(d.getTime() + (exdays*24*60*60*1000));
		var expires = "expires="+ d.toUTCString();
		document.cookie = cname + "=" + cvalue + ";" + expires + ";path= /";}
		
	
	function getCookie(cname) {
		var name = cname + "=";
		var decodedCookie = decodeURIComponent(document.cookie);
		var ca = decodedCookie.split(';');
		for(var i = 0; i < ca.length; i++) {
			var c = ca[i];
			while (c.charAt(0) == ' ') {
				c = c.substring(1);
			}
			if (c.indexOf(name) == 0) {
				return c.substring(name.length, c.length);
			}
		}
		return "";}
						
	$newBack.click(changeBack);
	
	function changeBack(){
		setCookie("newBack", targetImg, 10);
		$('.body').css("background", "url("+ targetImg + ") repeat");}
	
	function checkChanges(){
		var newBackName = getCookie("newBack");
		if (newBackName == undefined || newBackName == "null" || newBackName == ""){
			$('.body').css("background", "url(img/background2.jpg) repeat");}
		else{
			targetImg = newBackName;
			changeBack();}}
			
	function checkCurrentPhoto(){
		var oldCurPhoto = getCookie("curImg");
		if (oldCurPhoto == undefined || oldCurPhoto == "" || oldCurPhoto == "null"){
			return;}
		else {liIndex = $(oldCurPhoto).parent().index();
			replaceImg(oldCurPhoto);
			$('.modal_div').fadeIn();}}
			
	
		
	$images.click(function(event) {
		event.preventDefault();
		$('.loading').addClass('show');
		targetImg = $(this).attr('href');
		liIndex = $(this).parent().index();
		setCookie("curImg", targetImg, 3);
		replaceImg(targetImg);
		$('.loading').removeClass('show');;
		$('.modal_div').fadeIn();});
		
			
	$(document).keydown(function(e) {
		var keyCode = e.keyCode;
		switch (keyCode) {
			case 27: $('.modal_div').fadeOut();
					setCookie("cutImg", "", -1);
					$('.help').fadeOut();
			break;
			case 112: e.preventDefault();
					$('.help').fadeIn();
			break;}});
			
	$(document).keydown(function(event) {
		var keyCode = event.keyCode;
		event.preventDefault();
		if (keyCode == 39){
			if ((liIndex + 1) < $li.length){
				targetImg = getHref(liIndex + 1);
				liIndex++;
				replaceImg(targetImg);}
			else{
				targetImg = getHref(0);
				liIndex = 0;
				replaceImg(targetImg);}
		}
		if (keyCode == 37){
			if((liIndex) > 0){
			targetImg = getHref(liIndex - 1);
			liIndex--;
			replaceImg(targetImg);}
		else {
			targetImg = getHref($li.length - 1);
			liIndex = $li.length - 1;
			replaceImg(targetImg);}}});
			
	$(window).load(function() {
        checkChanges();
		checkCurrentPhoto();
    });
	
});