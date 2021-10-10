class Judgement < ApplicationRecord
  belongs_to :contest
  belongs_to :judge
  belongs_to :finalist
  
  validates :score, presence: true, numericality: { in: 70..100 }

  scope :until20_koc_judges, -> (judgements){ where(judge_id: 1).or(judgements.where(judge_id: 2..5)).order(id: :ASC).pluck(:judge_id, :finalist_id, :score).map { |judge_id, finalist_id, score | { judge_id: judge_id, finalist_id: finalist_id, score: score  }} }
  scope :since21_koc_judges, -> (judgements){ where(judge_id: 1).or(judgements.where(judge_id: 6..9)).order(id: :ASC).pluck(:judge_id, :finalist_id, :score).map { |judge_id, finalist_id, score | { judge_id: judge_id, finalist_id: finalist_id, score: score  }} }
  scope :my_judge, -> (set_id){ where(judge_id: set_id).order(id: :ASC).pluck(:judge_id, :finalist_id, :score).map { |judge_id, finalist_id, score | { judge_id: judge_id, finalist_id: finalist_id, score: score  }} }
  scope :other_judges_average, -> (finalist_ids){ order("field(finalist_id, #{finalist_ids.join(',')})").group(:finalist_id).average(:score).map { |finalist_id, score| {finalist_id: finalist_id, score: score.round }} }

  def self.judgements_res(judgements, current_judge, contest_id)
    my_result = judgements.my_judge(current_judge.id)
    finalist_ids = judgements.distinct.pluck(:finalist_id)
    other_results =  [ other_results: judgements.other_judges_average(finalist_ids) ]
    finalists_name = [ finalists_name: Finalist.where(id: finalist_ids).order("field(id, #{finalist_ids.join(',')})").map { |finalist| {id: finalist.id, name: finalist.name} } ]
    judges_count = [ count: judgements.distinct.pluck(:judge_id).length ]

    if (30..35).cover?(contest_id)
      judges_name = [ judges_name: Judge.where(id: 1..5).map { |judge| {id: judge.id, name: judge.name} } ]
      official_results = judgements.until20_koc_judges(judgements)
    elsif 36 == contest_id
      judges_name = [ judges_name: Judge.where(id: 1).or(Judge.where(id: 6..9)).map { |judge| {judge_id: judge.id, name: judge.name} } ]
      official_results = judgements.since21_koc_judges(judgements)
    end

    official_and_me = [official_results, my_result].flatten!
    all_results = other_results + finalists_name + judges_name + official_and_me + judges_count
  end
end
