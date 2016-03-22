class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  validates :content, presence: true

  def self.count_today
    Question.where('created_at >= ?', Time.zone.now.beginning_of_day).count
  end
end
