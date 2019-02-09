class InterviewsController < ApplicationController
  before_action :set_my_thread, only: [ :update, :edit, :destroy ]

  def new
    @interview = Interview.new
  end

  def edit

  end

  def show

  end

  def update
    if @interview.update(interview_params)
      redirect_to user_interviews_path
    else
      render 'edit'
    end
  end

  def destroy
    @interview.destroy
    redirect_to user_interviews_path
  end

  def create
    @interview = Interview.create(interview_params)
    if @interview.save
      redirect_to user_interviews_path
    else
      # flash[:alert] = 'failed'
      render 'new'
    end
  end

  private
  def interview_params
    params.permit(:user_id, :begin_at, :allowed, :num)
  end

  def set_interview
    @interview = Interview.find(params[:num])
  end

end
