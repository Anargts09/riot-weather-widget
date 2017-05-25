<other-days>
	<ul>
		<single-day each={ item, index in items } no-reorder></single-day>
	</ul>
	<script>
		var self = this;
		var weatherdatas;
		var old_id = selected_c;
	  	getOtherWeather = function() {
	    	fetch('https://weather-api.now.sh/api/v1/weather')
	    	.then(function(res) {
	        	return res.json();
	      	})
      		.then(function(data) {
		        if (data) {
		        	weatherdatas = data['Cities'];
		        	self.items = weatherdatas[selected_c].Weathers;
			        self.update();
		        }
	      	})
	  	};
	  	changeCity = function(city) {
	  		if(weatherdatas){
		  		self.items = weatherdatas[city].Weathers;
	  			self.update();
	  		}
	  	};
		this.on('mount', function(){
			getOtherWeather();
		})
		this.on('updated', function(){
			if(old_id != selected_c){
				old_id = selected_c;
				changeCity(selected_c);
			}else{
				return;
			}
		})
	</script>
  	<style>
	  	:scope{
	  		background: rgba(22,32,84,0.75);
	  		position: absolute;
	  		width: 100%;
	  		left: 0;
	  		bottom: 0;
	  	}
	  	ul{
	  		list-style: none;
	  		margin: 0;
	  		padding: 0;
	  	}
  	</style>
</other-days>