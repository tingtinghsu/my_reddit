class Link < ApplicationRecord
  acts_as_votable
  belongs_to :user
  has_many :comments

  scope :alive, -> { where( switch: true ) }

  def delete!
    self.switch = false
    self.save
  end
end
