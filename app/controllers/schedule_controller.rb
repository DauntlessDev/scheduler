class ScheduleController < ApplicationController
  def index
    # @schedules = Schedule.all(:conditions => ["user_id"])
    if user_signed_in?
      @schedules = current_user.schedules
   else
     @schedules = nil
   end
  end

  def new
    @schedule = current_user.schedules.create(schedule_params)
  end

  def create
    @schedule = current_user.schedules.create(schedule_params)
  end

  private
  def schedule_params
    params.require(:schedule).permit(:date, :time, :total)
  end
end
