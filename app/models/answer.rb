class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  validates :content, presence: true

  def self.count_today
    Answer.where('created_at >= ?', Time.zone.now.beginning_of_day).count
  end
end
