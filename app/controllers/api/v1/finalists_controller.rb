class Api::V1::FinalistsController < ApplicationController

  def index
    contest = Contest.find(params[:id])
    finalist_ids = Judgement.where(contest_id: contest).distinct.pluck(:finalist_id)
    finalists = Finalist.where(id: finalist_ids).finalist_all(finalist_ids)
    render json: finalists
  end
end
