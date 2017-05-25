<current>
  	<div if={ isLoading }>
  		<div class="is-half">
  			<p class="text-left">
		  		{ week }
	  		</p>
	  		<p class="text-left">
		  		{ dt }
	  		</p>
	  		<p class="iconWi">
		  		<i class="{ iconWi }"></i>
	  		</p>
  		</div>
  		<div class="is-half">
  			<p class="temp text-right">
		  		{ Math.round(main.temp) }&#176
	  		</p>
	  		<p class="text-right">
		  		Улаанбаатар
	  		</p>
	  		<p class="text-right wind">
		  		<i class="wi wi-wind towards-{ Math.round(wind.deg) }-deg"></i>
		  		{ Math.round(wind.speed) }
		  		<span>m/c</span>
	  		</p>
  		</div>
	</div>
	<script>
		var self = this;
	  	getCurrentWeather = function() {
	    	fetch('https://api.openweathermap.org/data/2.5/weather?q=Ulaanbaatar&units=metric&appid=fdd0e62073750d3d83317adbdc2b2230')
	    	.then(function(res) {
	        	return res.json();
	      	})
      		.then(function(data) {
		        if (data) {
		        	self.weather = data.weather[0];
		        	self.main = data.main;
		        	self.wind = data.wind;
		        	self.clouds = data.clouds;
		        	self.sys = data.sys;
		        	self.name = data.name;
		        	self.dt = timeConverter(data.dt);
		        	self.week = dayConverter(data.dt);

		     		var prefix = 'wi wi-';
				  	var code = data.weather[0].id;
				  	self.iconWi = weatherIcons['en'][code].icon;

				  	// If we are not in the ranges mentioned above, add a day/night prefix.
				  	if (!(code > 699 && code < 800) && !(code > 899 && code < 1000)) {
				    	self.iconWi = 'day-' + self.iconWi;
				  	}
				  	// Finally tack on the prefix.
				  	self.iconWi = prefix + self.iconWi;
			        self.isLoading = true;
			        self.update();
		        }
	      	})
	  	};
		this.on('mount', function(){
			getCurrentWeather('Ulaanbaatar');
		})
	</script>
  	<style>
	    :scope {
	    	padding: 0 17px;
	    	display: block;
	    }
	    .text-right{
	    	text-align: right;
	    	opacity: .8;
	    	text-shadow: 0px 3px 4px rgba(27, 35, 48, 0.4); 
	    	margin: 0 15px 5px 0;
	    }
	    .text-left{
	    	text-align: left;
	    	opacity: .8;
	    	text-shadow: 0px 3px 4px rgba(27, 35, 48, 0.4); 
	    	margin: 0;
	    	font-weight: 400;
	    	font-size: 24px;
	    }
	    .wind{
	    	font-size: 26px;
	    	font-weight: bold;
	    }
	    .wind i{
	    	margin-right: 0.2em;
	    }
	    .wind span{
	    	font-size: 60%;
	    }
	    .temp{
	    	font-size: 92px;
	    	color: #FFF;
	    	text-shadow: 0px 3px 4px rgba(121, 23, 11, 0.37); 
	    	font-weight: 500;
	    	line-height: 0.5;
	    	margin: 0 0 20px;
	    }
	    .iconWi{
	    	margin: 0.3em 0;
	    	font-size: 90px;
	    	opacity: 0.7;
	    	text-shadow: 0px 3px 4px rgba(1, 17, 28, 1); 
	    }
  	</style>
</current>