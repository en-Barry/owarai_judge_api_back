class Api::V1::ContestsController < ApplicationController
  before_action :set_contest, only: %i[update destroy]

  def index
    contests = Contest.all
    render json: contests
  end

  def create
    contest = Contest.new(contest_params)
    if contest.save
      render json: contest
    else
      render json: contest.errors
    end
  end

  def update
    if @contest.update(contest_params)
      render json: @contest
    else
      render json: @contest.errors
    end
  end

  def destroy
    if @contest.destroy
      render json: @contest
    else
      render json: @contest.errors
    end
  end

  private

  def set_contest
    @contest = Contest.find(params[:id])
  end

  def contest_params
    params.require(:contest).permit(:name, :year, :judge, :finalist, :score)
  end
end
