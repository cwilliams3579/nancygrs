class ExercisesController < ApplicationController
  before_action :find_exercise, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_user, except: [:index, :show]

  def index
    @exercises = Exercise.all.order("created_at DESC")
    # @exercises = Exercise.where(exercise_id: @exercise.id)
  end

  def show
    @reviews = Review.where(exercise_id: @exercise.id)
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
  end

  def new
    @exercise = current_user.exercises.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    @exercise.user = current_user
    if @exercise.save
      flash[:notice] = "Exercise has been created"
      redirect_to @exercise
    else
      flash.now[:danger] = "Exercise was not created"
      render :new
    end
  end

  def edit

  end

  def update
    if @exercise.save
      flash[:notice] = "Exercise was successfully updated"
      redirect_to exercises_path
    else
      flash[:danger] = "Exercise was not updated"
      render 'new'
    end
  end

  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy
    flash[:notice] = "Exercise has successfully been deleted"
    redirect_to exercises_path
  end

  def upvote
    @exercise.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @exercise.downvote_by current_user
    redirect_to :back
  end

  private

  def exercise_params
    params.require(:exercise).permit(:title, :workout, :duration_in_min, :workout_date, :user_id, :image)
  end

  def find_exercise
    @exercise = Exercise.find(params[:id])
  end

  def check_user
    unless current_user.admin?
      redirect_to root_url, alert: "Sorry, only an administrator can perform that action!"
    end
  end

  # def require_user_vote
  #   if !user_signed_in?
  #     flash[:danger] = "You must be logged in to perform that action"
  #     redirect_to '/users/sign_in'
  #   end
  # end
end
