class BmiController < ApplicationController
  def index
    # 180102 新增 BmiCalcuator
    @bmi_calculator = BmiCalculator.new
  end

  def result
    # height = params[:body_height].to_f / 100  # Change the unit to meter
    # weight = params[:body_weight].to_f

    # @bmi = (weight / (height * height)).round(2)

    # 180102 改用以下呈現
    @bmi_calculator = BmiCalculator.new(bmi_calculator_params)

    if @bmi_calculator.valid?
      @bmi = @bmi_calculator.perform
    else
      render :index
    end
  end

  private
  def bmi_calculator_params
    params.require(:bmi_calculator).permit(:body_height, :body_weight)
  end
end
