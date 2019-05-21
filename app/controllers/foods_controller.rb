class FoodsController < ApplicationController
  skip_before_action :verify_authenticity_token  

  def cook_calculator_new
    @food = Food.new

    respond_to do |format|
      format.html { render :cook_calculator }
    end
  end

  def cook_calculator
    @food = Food.new(cook_calculator_params[:time_cook], 
                      cook_calculator_params[:time_hourglass_one], 
                      cook_calculator_params[:time_hourglass_two])

    begin
      @food.cook_calculate();
    rescue StandardError => e
      flash[:error] = e.message
    end
    
    respond_to do |format|
      format.json { render json: @food.to_json, layout: false  }
      format.html
    end
  end

  private
    def cook_calculator_params
      params.require(:cook_calculator).permit(:time_cook, :time_hourglass_one, :time_hourglass_two)
    end
end