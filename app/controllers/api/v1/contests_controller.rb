class Api::V1::ContestsController < ApplicationController
  skip_before_action :set_judge

  def index
    contests = Contest.where(name: params[:id]).contest_all
    render json: contests
  end
end
