class ApplicationController < ActionController::API
  include ActionController::Cookies
  include SessionsHelper

  before_action :set_judge

  private
  
  def set_judge
    unless current_judge
      judge = Judge.create_anonymous!
      remember(judge)
    end
  end
end
