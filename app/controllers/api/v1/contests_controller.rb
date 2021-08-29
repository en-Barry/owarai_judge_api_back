class Api::V1::ContestsController < ApplicationController

  def m_1gp
    generation = Contest.where(name: 0).order(id: :DESC).map { |g| g.year }
    render json: generation
  end

  def king_of_conte
    generation = Contest.where(name: 1).order(id: :DESC).map { |g| g.year }
    render json: generation
  end

  def r_1gp
    generation = Contest.where(name: 2).order(id: :DESC).map { |g| g.year }
    render json: generation
  end
end
