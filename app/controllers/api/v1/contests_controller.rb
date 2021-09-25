class Api::V1::ContestsController < ApplicationController
  skip_before_action :set_judge
  
  def m_1gp
    contests = Contest.where(name: 0).contest_all
    render json: contests
  end

  def king_of_conte
    contests = Contest.where(name: 1).contest_all
    render json: contests
  end

  def r_1gp
    contests = Contest.where(name: 2).contest_all
    render json: contests
  end
end
