<single-day>
	<li>
		<span if={ index == 0}>Өнөөдөр</span>
		<span if={ index != 0}>{week}</span>
		<p>		
			{item.TemperatureDay}&#176;
		  	<i class="{ DayiconWi }"></i>
		</p>
		<p>
			{item.TemperatureNight}&#176;
			<i class="{ NighticonWi }"></i>
		</p>
	</li>

	<script>
		var self = this;
		var item = self.item;
		var old_item;
		var timeStamp = new Date(item.Date).getTime() / 1000;
    	self.week = dayConverter(timeStamp);

		this.on('mount', function(){
			self.update();
		})

		this.on('updated', function(){
			if(old_item != self.item){
				old_item = self.item;
			  	var dCode = self.item.PhenoIDDay;
			  	var nCode = self.item.PhenoIDNight;
			  	var dCode = self.item.PhenoIDDay;
			  	var nCode = self.item.PhenoIDNight;
		    	var prefix = "wi wi-";
			  	self.DayiconWi =prefix + weatherIcons['mn'][dCode].icon;
			  	self.NighticonWi = prefix + weatherIcons['mn'][nCode].icon;
			  	self.update();
		  	}else{
				return;
			}
		})

	</script>

	<style>
	  	:scope{
	  		text-align: center;
	  		width: calc((100% - 4px)/5);
			float: left;
			border-right: 1px outset #0d1331;
			padding-bottom: 20px;
	  	}
	  	:scope:last-child{
			border-right: medium none;
	  	}
	  	span{
	  		font-weight: 300;
	  		display: block;
	  		font-size: 19px;
	  		line-height: 40px;
	  		text-shadow: 0px 3px 4px rgba(27, 35, 48, 0.4);
	    	opacity: .7;
	  	}
	  	p{
	  		margin: 0;
	  	}
	    .iconWi{
	    	margin: 0.3em 0;
	    	font-size: 90px;
	    	opacity: 0.7;
	    	text-shadow: 0px 3px 4px rgba(1, 17, 28, 1); 
	    }
	</style>
</single-day>