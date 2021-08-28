class Api::V1::JudgementsController < ApplicationController
  before_action :set_judgement, only: %i[update destroy]

  def index
    judgements = Judgement.all
    render json: judgements
  end

  def create
    judgement = Judgement.new(judgement_params)
    if judgement.save
      render json: judgement
    else
      render json: judgement.errors
    end
  end

  def update
    if @judgement.update(judgement_params)
      render json: @judgement
    else
      render json: @judgement.errors
    end
  end

  def destroy
    if @judgement.destroy
      render json: @judgement
    else
      render json: @judgement.errors
    end
  end

  private

  def set_judgement
    @judgement = Judgement.find(params[:id])
  end

  def judgement_params
    params.require(:judgement).permit(:contest_id, :judge_id, :finalist_id, :score)
  end
end
