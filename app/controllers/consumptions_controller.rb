class ConsumptionsController < ApplicationController
  def index
    @consumption = Consumption.find_or_create_by(user: current_user)
  end

  def update
    @consumption = Consumption.find_or_create_by(id: params[:id], user: current_user)
    if @consumption.update(consumption_params)
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @old_record = Consumption.find(params[:id])
    @old_record.destroy
    @consumption = Consumption.find_or_create_by(user: current_user)
    respond_to do |format|
      format.js
    end
  end

  def consumption_params
    params.require(:consumption).permit(:sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday)
  end
end
