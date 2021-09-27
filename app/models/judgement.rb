class Judgement < ApplicationRecord
  belongs_to :contest
  belongs_to :judge
  belongs_to :finalist

  scope :until20_judges, -> (judgements){ where(judge_id: 1).or(judgements.where(judge_id: 2..5)).order(id: :ASC).pluck(:contest_id, :judge_id, :finalist_id, :score).map { |contest_id, judge_id, finalist_id, score | { contest_id: contest_id, judge_id: judge_id, finalist_id: finalist_id, score: score  }} }
  scope :since21_judges, -> (judgements){ where(judge_id: 1).or(judgements.where(judge_id: 6..9)).order(id: :ASC).pluck(:contest_id, :judge_id, :finalist_id, :score).map { |contest_id, judge_id, finalist_id, score | { contest_id: contest_id, judge_id: judge_id, finalist_id: finalist_id, score: score  }} }
  scope :my_judge, -> (set_id){ where(judge_id: set_id).order(id: :ASC).pluck(:contest_id, :judge_id, :finalist_id, :score).map { |contest_id, judge_id, finalist_id, score | { contest_id: contest_id, judge_id: judge_id, finalist_id: finalist_id, score: score  }} }
  scope :other_judges_average, -> { group(:finalist_id).average(:score).map { |finalist_id, score| {finalist_id: finalist_id, score: score.round }} }

  def self.koc_judgements(judgements, current_judge, contest_id)
    my_result = judgements.my_judge(current_judge.id)
    other_results =  [ other_results: judgements.other_judges_average ]

    if (30..35).cover?(contest_id)
      official_results = judgements.until20_judges(judgements)
    elsif 36 == contest_id
      official_results = judgements.since21_judges(judgements)
    end

    official_and_me = [official_results, my_result].flatten!
    all_results = official_and_me + other_results
  end
end
