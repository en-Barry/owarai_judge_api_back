class Judge < ApplicationRecord
  has_many :judgements, foreign_key: "reference_id"
  has_one :profile, dependent: :destroy

  enum category: { general: 0, official: 1 }

  attr_accessor :uuid

  def authenticated?(uuid)
    BCrypt::Password.new(judge_digest)  == uuid
  end
  
  class << self
    def create_anonymous!
      uuid = new_uuid
      judge = new(
        name: '',
        uuid: uuid,
        judge_digest: digest(uuid)
      )
      judge.save!
      judge
    end    

    private

    def new_uuid
      SecureRandom.urlsafe_base64
    end

    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
  end
end
