class Api::V1::JudgementsController < ApplicationController
  skip_before_action :set_judge
  before_action :set_judgement, only: %i[update destroy]

  def create
    judgements = judgements_params.to_h
    
    if Judgement.find_by(judge_id: current_judge.id, contest_id: judgements[:judgements][0][:contest_id]).present?
      render json: { errors: { title: '既に審査済みです。複数回の審査はアップデートで対応予定です。'}, status: :not_found }
    else
      ActiveRecord::Base.transaction do
        register_judge = judgements[:judgements].map do |judgement|
          judgement[:judge_id].present? ? new_judge = Judgement.new(judge_id: judgement[:judge_id]) : new_judge = Judgement.new(judge_id: current_judge.id) 
          new_judge.update_attributes(contest_id: judgement[:contest_id],
                                      finalist_id: judgement[:finalist_id],
                                      score: judgement[:score])
        end
      end
    end
  end

  def update
    if @judgement.update(judgements_params)
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

  def judgements_params
    params.permit(judgements: [:contest_id, :judge_id, :finalist_id, :score])
  end
end
