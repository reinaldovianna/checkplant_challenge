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
    th = { 
          one: { value: time_hourglass_one.to_i, sum: time_hourglass_one.to_i},
          two: { value: time_hourglass_two.to_i, sum: time_hourglass_two.to_i}
         }

    begin
      Timeout.timeout(3) do
        while((th[:one][:sum] - th[:two][:sum]).abs != time_cook.to_i) do
          if(th[:one][:sum] < th[:two][:sum])
            th[:one][:sum] += th[:one][:value]
          elsif(th[:one][:sum] > th[:two][:sum])
            th[:two][:sum] += th[:two][:value]
          else 
            if(time_cook.to_i % th[:one][:value] == 0 ||
               time_cook.to_i % th[:two][:value] == 0)
              return self.result_calculator = time_cook.to_i
            end

            raise "Não é possível calcular o tempo de preparo com as ampulhetas informadas."
          end

          current_time_min = [th[:one][:sum], th[:two][:sum]].min
          if(current_time_min == time_cook.to_i)
            return self.result_calculator =  current_time_min
          end

        end
      end
    rescue Timeout::Error
      raise "Tempo de processamento excedido."
    end
    self.result_calculator = [th[:one][:sum], th[:two][:sum]].max
  end
end