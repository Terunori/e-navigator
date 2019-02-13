class InterviewsController < ApplicationController
  before_action :set_interview, only: [ :update, :edit, :destroy ]

  def new
    @interview = Interview.new
    @now_dt = DateTime.now
  end

  def edit

  end

  def index

  end

  def update
    int_params = interview_params.to_h
    if interview_params[:allowed].to_s == 'undecided'
      int_params[:interviewer_id] = nil
    end
    if @interview.update(int_params)
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
