class InterviewsController < ApplicationController
  before_action :correct_user, only: [:new, :create, :edit, :update ,:destroy]
  before_action :set_interview, only: [ :update, :allow, :edit, :destroy ]

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

  def allow
    @interview.attributes = others_interview_params
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
    @interview = current_user.interviews.build(interview_params)
    if @interview.save
      redirect_to user_interviews_path
    else
      render 'new'
    end
  end

  private
  def correct_user
    user = User.find(params[:user_id])
    if current_user != user
      redirect_to root_path
    end
  end

  def interview_params
    params.permit(:begin_at, :allowed)
  end

  def others_interview_params
    params.permit(:allowed, :interviewer_id)
  end

  def set_interview
    @interview = Interview.find(params[:id])
  end

end
