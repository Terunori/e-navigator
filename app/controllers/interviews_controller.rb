class InterviewsController < ApplicationController
  before_action :set_interview, only: [ :update, :edit, :destroy ]

  def new
    @interview = Interview.new
  end

  def edit

  end

  def index

  end

  def update
    p = interview_params.to_h
    if interview_params[:init].to_i == 1
      p[:allowed] = 0
      p[:interviewer_id] = nil
    end
    p.delete :init

    if @interview.update(p)
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
      render 'new'
    end
  end

  private
  def interview_params
    params.permit(:id, :user_id, :begin_at, :allowed, :interview_id, :init)
  end

  def set_interview
    @interview = Interview.find(params[:id])
  end

end
