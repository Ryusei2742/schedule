class EventSchedulesController < ApplicationController
  before_action :set_event_schedule, only: [:show, :edit, :update, :destroy]

  def index
    @event_schedules = EventSchedule.all
    @total_schedules = @event_schedules.count
    @today = Date.today.strftime("%Y年%m月%d日")
  end

  def show
  end

  def new
    @event_schedule = EventSchedule.new
  end

  def create
    @event_schedule = EventSchedule.new(event_schedule_params)
    if @event_schedule.save
      flash[:notice] = 'スケジュールを作成しました。'
      redirect_to event_schedules_path
    else
      flash.now[:notice] = 'スケジュールの作成に失敗しました。'
      render :new
    end
  end

  def edit
  end

  def update
    if @event_schedule.update(event_schedule_params)
      flash[:notice] = 'スケジュールを更新しました。'
      redirect_to event_schedule_path
    else
      flash.now[:notice] = 'スケジュールの更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    @event_schedule = EventSchedule.find(params[:id])
    @event_schedule.destroy
    redirect_to event_schedules_path, notice: 'スケジュールを削除しました。'
  end

  private

  def set_event_schedule
    @event_schedule = EventSchedule.find(params[:id])
  end

  def event_schedule_params
    params.require(:event_schedule).permit(:title, :start_date, :end_date, :all_day, :memo)
  end
end