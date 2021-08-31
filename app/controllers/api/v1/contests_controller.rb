class Api::V1::ContestsController < ApplicationController

  def m_1gp
    years = Contest.where(name: 0).order(id: :DESC).map { |g| g.year }
    render json: years
  end

  def king_of_conte
    years = Contest.where(name: 1).order(id: :DESC).map { |g| g.year }
    render json: years
  end

  def r_1gp
    years = Contest.where(name: 2).order(id: :DESC).map { |g| g.year }
    render json: years
  end
end
