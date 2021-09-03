class Api::V1::ContestsController < ApplicationController

  def m_1gp
    contests = Contest.where(name: 0).order(id: :DESC).pluck(:id, :name, :year).map { |id, name, year| { id: id, name: name, year: year }}
    render json: contests
  end

  def king_of_conte
    contests = Contest.where(name: 1).order(id: :DESC).pluck(:id, :name, :year).map { |id, name, year| { id: id, name: name, year: year }}
    render json: contests
  end

  def r_1gp
    contests = Contest.where(name: 2).order(id: :DESC).pluck(:id, :name, :year).map { |id, name, year| { id: id, name: name, year: year }}
    render json: contests
  end
end
