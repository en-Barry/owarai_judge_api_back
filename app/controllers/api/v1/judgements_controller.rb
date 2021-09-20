class Api::V1::JudgementsController < ApplicationController
  skip_before_action :set_judge
  before_action :set_judgement, only: %i[update destroy]

  def create
    judgement = Judgement.new(judge_id: current_judge.id) if current_judge.present?
    judgement.attributes = judgement_params
    
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

  def m_1gp
    
  end

  def king_of_conte
    judgements = Judgement.where(contest_id: params[:id]).order(id: :ASC).pluck(:contest_id, :judge_id, :finalist_id, :score).map { |contest_id, judge_id, finalist_id, score | { contest_id: contest_id, judge_id: judge_id, finalist_id: finalist_id, score: score  }}
    render json: judgements
  end

  def r_1gp
    
  end

  private

  def set_judgement
    @judgement = Judgement.find(params[:id])
  end

  def judgement_params
    params.require(:judgement).permit(:contest_id, :judge_id, :finalist_id, :score)
  end
end
