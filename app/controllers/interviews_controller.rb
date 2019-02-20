class InterviewsController < ApplicationController
  before_action :set_user, only: [:index]
  before_action :correct_user, only: [:new, :create, :edit, :update ,:destroy]
  before_action :set_interview, only: [ :update, :allow, :edit, :destroy ]

  def new
    @interview = Interview.new
    @now_dt = DateTime.now
  end

  def edit

  end

  def index
    @interviews = @user.interviews.includes(:interviewer).order(begin_at: :asc)
  end

  def update
    @interview.attributes = update_interview_params
    @interview.interviewer_id = nil if update_interview_params[:allowed] == 'undecided'

    if @interview.save
      redirect_to user_interviews_path
    else
      render 'edit'
    end
  end

  def allow
    @interview.attributes = allow_interview_params
    @interview.interviewer_id = nil if allow_interview_params[:allowed] == 'undecided'

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
    @interview = current_user.interviews.build(create_interview_params)
    @interview.allowed = 'undecided'
    if @interview.save
      redirect_to user_interviews_path
    else
      render 'new'
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_interview
    @interview = Interview.find(params[:id])
  end

  def correct_user
    set_user
    redirect_to user_interviews_path if current_user != @user
  end

  def create_interview_params
    params.permit(:begin_at)
  end

  def update_interview_params
    params.permit(:begin_at, :allowed)
  end

  def allow_interview_params
    params.permit(:allowed, :interviewer_id)
  end

end
