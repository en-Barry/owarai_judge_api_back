class Api::V1::FinalistsController < ApplicationController

  def m_1gp
    contest = Contest.find_by(name: 0, year: params[:id])
    finalist_ids = Judgement.where(contest_id: contest).distinct.pluck(:finalist_id)
    finalists = Finalist.where(id: finalist_ids).finalist_all
    render json: finalists
  end

  def king_of_conte
    contest = Contest.find_by(name: 1, year: params[:id])
    finalist_ids = Judgement.where(contest_id: contest).distinct.pluck(:finalist_id)
    finalists = Finalist.where(id: finalist_ids).finalist_all
    render json: finalists
  end

  def r_1gp
    contest = Contest.find_by(name: 2, year: params[:id])
    finalist_ids = Judgement.where(contest_id: contest).distinct.pluck(:finalist_id)
    finalists = Finalist.where(id: finalist_ids).finalist_all
    render json: finalists
  end
end
