class SchedulesController < ApplicationController
  before_action :authenticate_user!

  def index
    if user_signed_in?
      @schedules = current_user.schedules
      # @schedules = Schedule.all
    end
  end

  def new
    @schedule = current_user.schedules.new
  end

  def create
    @schedule = current_user.schedules.new(schedule_params)

    if @schedule.save
      redirect_to root_path
    else
        render :new, status: :unprocessable_entity
    end
  end

  private
  def schedule_params
    params.require(:schedule).permit(:date, :time, :total)
  end
end
