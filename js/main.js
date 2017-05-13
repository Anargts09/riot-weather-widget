var weatherIcons;
function getLocalJson(){
	fetch('src/icons.json').then(function(res) {
  		return res.json();
  	})
  	.then(function(data) {
  		weatherIcons = data;
  		riot.mixin('weatherIcons', {
		    bodyMixin: weatherIcons
		});
  	})
}

function dayConverter(UNIX_timestamp){
  	var a = new Date(UNIX_timestamp * 1000);
  	var getDay = ['Ням','Даваа','Мягмар','Лхагва','Пүрэв','Баасан','Бямба'];
  	var week = getDay[a.getDay()];
  	return week;
}

function timeConverter(UNIX_timestamp){
  	var a = new Date(UNIX_timestamp * 1000);
  	var months = ['1 сар','2 сар','3 сар','4 сар','5 сар','6 сар','7 сар','8 сар','9 сар','10 сар','11 сар','12 сар'];
  	var year = a.getFullYear();
  	var month = months[a.getMonth()];
  	var date = a.getDate();
  	// var hour = a.getHours();
  	// var min = a.getMinutes();
  	// var sec = a.getSeconds();
  	// var time = date + ' ' + month + ' ' + year + ' ' + hour + ':' + min + ':' + sec ;
  	var time = month + ' ' + date  + ' өдөр';
  	return time;
}