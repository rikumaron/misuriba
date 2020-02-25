class Question < ApplicationRecord
    has_many :answers, dependent: :destroy
    
    validates :name, presence: true
    validates :title, presence: true
    validates :content, presence: true
    
  def self.search(search)
    if search
      Question.where(['title LIKE ?', "%#{search}%"])
    else
      Question.all
    end
  end
end
