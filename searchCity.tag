<searchCity>
	<select name="cityName" onChange={this.handleChange}>
        <optgroup>
            <option each={item, index in items} value={item.id}>{item.mn_text}</option>
        </optgroup>
    </select>
      
    <div if={ isLoading } class='loader'>
      <img src='http://samherbert.net/svg-loaders/svg-loaders/puff.svg' />       
    </div>
      
    <p class='error' if={ error }>{ error }</p>
    
	<script>
		var self = this;
		this.on('mount', function(){
			getCities();
		})

		var cityNames;

		function getCities(){
		  fetch('src/cities.json').then(function(res) {
		      return res.json();
		    })
		    .then(function(data) {
				self.items = data['Cities'];
				self.update();
		    })
		}

		handleChange(e) {
			e.preventDefault();
			self.parent.changed(parseInt(e.target.value));
		}

	</script>
      
	<style scoped>
	    :scope {
	      position: absolute;
	      top: 2rem;
	      left: 50%;
	      transform: translate(-50%, 0);
	    }
	    .loader {
	      position: absolute;
	      top: 50%;
	      left: 50%;
	      transform: translate(-50%, -50%);
	    }
	    .loader {
	      margin: 6rem 0 0;
	    }
	    .error {
	      color: #FFFAAA;
	      margin: 1rem 0;
	    }
  	</style>
</searchCity>