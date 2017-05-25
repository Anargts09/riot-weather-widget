<app>
	<searchCity></searchCity>
	<weather></weather>
	<style>
		:scope{
		  	margin: 0;
		  	font-family: 'Lato', sans-serif;
		  	font-weight: 300;
		  	background-size: cover;
		  	background-attachment: fixed;
		  	background-image: -webkit-radial-gradient(ellipse farthest-corner at top, #b9bec2, #172938);
		  	background-image: radial-gradient(ellipse farthest-corner at top, #b9bec2, #172938);
		  	color: white;
		  	display: block;
		  	height: 100vh;
		}
	</style>

	<script>
		var self = this;
		this.on('mount', function(){
			getLocalJson();
			getCitiesJson();
			self.changed(selected_c);
		})

		changed(id) {
			selected_c = id;
			self.update();
	    }
	</script>
</app>