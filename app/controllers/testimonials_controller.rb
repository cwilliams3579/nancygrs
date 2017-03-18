class TestimonialsController < ApplicationController
  before_action :set_testimonial, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @testimonials = Testimonial.all
  end

  def show
  end

  def new
    @testimonial = Testimonial.new

  end

  def edit
  end

  def create
    @testimonial = Testimonial.new(testimonial_params)
    @testimonial.user_id = current_user.id
    if @testimonial.save
      redirect_to root_path, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  def update
    if @testimonial.update(testimonial_params)
      redirect_to root_path, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @testimonial.destroy
    redirect_to root_path, notice: 'Review was successfully destroyed.'
  end

  private

  def set_testimonial
    @testimonial = Testimonial.find(params[:id])
  end

  def testimonial_params
    params.require(:testimonial).permit(:content, :user_id, :rating)
  end
end
