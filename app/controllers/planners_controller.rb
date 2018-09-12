class PlannersController < ApplicationController
  before_action :require_login

  def new
    @planner = current_user.planners.build(start_date: params[:start_date] || Date.today, end_date: params[:end_date] || 6.days.from_now.to_date)
    @planner.plan_meals
  end

  def create
    @planner = current_user.planners.build(planner_params)

    if @planner.save
      redirect_to planner_path(@planner)
    else
      @errors = @planner.errors.full_messages
      render :new
    end
  end

  def show
    @planner = current_user.planners.find(params[:id])
  end

  def index
    @current_planner = current_user.planners.where("start_date <= ? AND end_date >= ?", Date.today, Date.today).first
    @planners = current_user.planners.order("start_date desc")
  end

  def destroy
    @planner = current_user.planners.find(params[:id])
    @planner.destroy
    redirect_to planner_path
  end

  def edit
    @planner = current_user.planners.find(params[:id])
  end

  def update
    @planner = current_user.planners.find(params[:id])

    if @planner.update_attributes(planner_params)
      redirect_to planner_path(@planner)
    else
      @errors = @planner.errors.full_messages
      render :edit
    end 
  end


  private

  def planner_params
    params.require(:planner).permit(:start_date, :end_date, meals_attributes: [:id, :date, :recipe_id])
  end

end
