module SessionsHelper
  def remember(judge)
    cookies.permanent.signed[:judge_id] = judge.id
    cookies.permanent[:uuid] = judge.uuid
  end

  def current_judge
    if (judge_id = cookies.signed[:judge_id])
      judge = Judge.find_by(id: judge_id)
      @current_judge ||= judge if judge && judge.authenticated?(cookies[:uuid])
    end
  end
end