class InterviewsController < ApplicationController
  before_action :set_interview, only: [ :update, :edit, :destroy ]

  def new
    @interview = Interview.new
    @now_dt = DateTime.now
  end

  def edit

  end

  def index
    @user = User.find(params[:user_id])
    @interviews = User.find(params[:user_id]).interviews.includes(:interviewer).order(begin_at: :asc)
  end

  def update
    @interview.attributes = interview_params
    @interview.interviewer_id = nil if interview_params[:allowed] == 'undecided'

    if @interview.save
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
    @interview = Interview.new(interview_params)
    if @interview.save
      redirect_to user_interviews_path
    else
      render 'new'
    end
  end

  private
  def interview_params
    params.permit(:user_id, :begin_at, :allowed, :interviewer_id)
  end

  def set_interview
    @interview = Interview.find(params[:id])
  end

end
