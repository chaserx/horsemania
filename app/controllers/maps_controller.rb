class MapsController < ApplicationController

  def	index
		@map = GoogleMap::Map.new
		@map.center = GoogleMap::Point.new(38.06, -84.497631) #Lexington Kentucky
		@map.zoom = 12 #200km
		
		# define control types shown on map
		@map.controls = [ :large, :scale, :type ]
		# valid controls options include
		# :large 
		# :small 
		# :overview
		# :large_3d
		# :scale
		# :type
		# :menu_type
		# :hierachical_type
		# :zoom
		# :zoom_3d
		# :nav_label  
	        	
		# allow user to double click to zoom
		@map.double_click_zoom = true
		
		# not certain what this does
		@map.continuous_zoom = false
		
		# allow user to scroll using mouse wheel?
		@map.scroll_wheel_zoom = false
		
		#set some markers
		
    Location.find_each do |loc|
	    @map.markers << GoogleMap::Marker.new(
	      :map => @map,
	      :icon => GoogleMap::SmallIcon.new(@map, 'blue'),
	      :lat => loc.lat,
	      :lng => loc.lon,
	      :html => "<h1>#{loc.title}</h1><br />#{loc.desc}<br /><a href=\"localhost:3000/upload/#{loc.id}\">Add your photo</a>",
	      :open_infoWindow => false
	    )
    end
			  
  end  

end
