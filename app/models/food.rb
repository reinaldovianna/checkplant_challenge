class Food
	include ActiveModel::Model
	require 'timeout'

	attr_accessor :time_cook, :time_hourglass_one, :time_hourglass_two, :result_calculator

	def initialize time_cook = nil, time_hourglass_one = nil, time_hourglass_two = nil
		self.time_cook = time_cook
		self.time_hourglass_one = time_hourglass_one 
		self.time_hourglass_two = time_hourglass_two
	end

  def cook_calculate
  	return self.result_calculator = time_cook if [time_hourglass_one, time_hourglass_two].include?(time_cook)
  	time_min_max =[time_hourglass_one.to_i, time_hourglass_two.to_i].minmax
  	time_min_max_sum = time_min_max.clone
  	loop_i = 1
		
		begin
	    Timeout.timeout(5) do
	    	while (time_min_max_sum.max - time_min_max_sum.min) != time_cook.to_i do
	    		time_min_max.map do |time_hourglass| 
	    			if((time_hourglass * loop_i) == time_cook.to_i)
	    				return self.result_calculator = (time_hourglass * loop_i)
	    			end
	    		end
	    		loop_i += 1

	    		if (time_min_max_sum.first < time_min_max_sum.last)
				  	time_min_max_sum[0] = time_min_max_sum.first + time_min_max.first
				  elsif (time_min_max_sum.first > time_min_max_sum.last)
				  	time_min_max_sum[1] = time_min_max_sum.last + time_min_max.last
					else
						raise "Não é possível calcular o tempo de preparo com as ampulhetas informadas."
					end
				end
	    end
	  rescue Timeout::Error
			raise "Tempo de processamento excedido."
	  end

		self.result_calculator = time_min_max_sum.max
	end
end