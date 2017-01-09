<!DOCTYPE html>
<html>
<head>
  <title>Отзывы о сайте</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="css/recall.css">
  <link href="https://fonts.googleapis.com/css?family=Philosopher" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Yeseva+One" rel="stylesheet">
  <link rel="shortcut icon" href="img/photos/favicon.ico"/>
  <script>
  function send_message(){
	var xhr = new XMLLHttpRequest();
	xhr.open('POST', '/recall.html', true);
	xhr.send();
	
	
	xhr.onreadystatechange(function (){
		if(xhr.readystate ==4){
			document.getElementDyId('messages').innerHTML=xhr.responseText		
		}
	
	})}</script>
</head>
<body>
<div class="container">
		<div class="name">
			<h1>Отзывы о сайте</h1>
        </div>
        <div class="menu">
            <div class="col span_1_of_2">
                <a class="button" href="index.html">Главная</a>
            </div>
            <div class="col span_1_of_2">
                <a class="button" href="gallery.html">Галерея</a>
            </div>
        </div>
            <div class="section group">				
				<form action='/recall.html' method='post'>
        
					<label>Имя</label>
					<input type='text' id='author' name='author' placeholder="Не более 50 символов">
                        
					<label>Текст</label>
					<textarea  id='msg' name="message" placeholder="Не более 200 символов"></textarea>
            
					<button onclick = send_message()>Добавить отзыв</button>
        
				</form>
            </div>
		<div class="comments">
            <h1>Все отзывы</h1>
            %for m in messages:
            <h2>{{m['author']}}</h2>
            <blockquote>{{m['text']}}</blockquote>
            %end
        </div>
        </div>
</body></html>