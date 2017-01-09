<!DOCTYPE html>
<html>
<head>
  <title>Фотогалерея</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="css/gallery.css">
  <link href="https://fonts.googleapis.com/css?family=Philosopher" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Yeseva+One" rel="stylesheet">
  <link rel="shortcut icon" href="img/favicon.ico"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="/js/gallery.js"></script>
</head>
<body class = "body">
  	<div class="container">
		<div class="name">
			<h1>Фотогалерея</h1>
		</div>
		<div class="menu">
			<div class="col span_1_of_2">
				<a class="button" href="index.html">Главная</a>
			</div>
			<div class="col span_1_of_2">
				<a class="button" href="gallery.html">Фотогалерея</a>
			</div>
		</div>
		<div class= "loading"><img src = "img/loading.gif"></span></div>
		<div class="gallery">
				<ul class="photos">
					<li><a href="img/photos/big/1.jpg"><img src="img/photos/small/1s.jpg"></a></li>
					<li><a href="img/photos/big/2.jpg"><img src="img/photos/small/2s.jpg"></a></li>
					<li><a href="img/photos/big/3.jpg"><img src="img/photos/small/3s.jpg"></a></li>
					<li><a href="img/photos/big/4.jpg"><img src="img/photos/small/4s.jpg"></a></li>
					<li><a href="img/photos/big/5.jpg"><img src="img/photos/small/5s.jpg"></a></li>
					<li><a href="img/photos/big/6.jpg"><img src="img/photos/small/6s.jpg"></a></li>
					<li><a href="img/photos/big/7.jpg"><img src="img/photos/small/7s.jpg"></a></li>
					<li><a href="img/photos/big/8.jpg"><img src="img/photos/small/8s.jpg"></a></li>
					<li><a href="img/photos/big/9.jpg"><img src="img/photos/small/9s.jpg"></a></li>
					<li><a href="img/photos/big/10.jpg"><img src="img/photos/small/10s.jpg"></a></li>
				</ul>
			</div>
			
		<div class="footer">
			<div>
					Последний раз вы тут были: {{lastTime}}
				<br>
					Количество просмотров: 
					<ul>
					<li>Сегодня {{today}}</li>
					<li>Всего {{all}}</li>
					</ul>
				</p>
			</div>
        </div>
	<div class="modal_div">
      <figure>
		<span class="newBack">Сделать фоном</span>
        <img src="#">
      </figure>
    </div>
	
	<div class="help">
		<h1>Краткая спраква по использованию фотогалереи</h1>
		<ul class="readme">
			<li>Чтобы перейти к следующей фотографии, нижмите клавишу "вправо"</li>
			<li>Чтобы перейти к предыдущей фотографии, нижмите клавишу "влево"</li>
			<li>Чтобы выйти из справки нижмите клавишу "Esc"</li>
			<li>Чтобы выйти из режима просмотра нижмите клавишу "Esc"</</li>
			<li>Чтобы сделать картинку фоном сайта, нажмите в режиме просмотра "Сделать фоном"</</li>
		</ul>
    </div>
</div>
<div class="adsbox">&nbsp;</div><div class="adsbox">&nbsp;</div>
</body>
</html>