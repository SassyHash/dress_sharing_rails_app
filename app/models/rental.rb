class Rental <ActiveRecord::Base
  attr_accessible :start_date, :end_date, :user_id, :dress_id
  belongs_to :user
  belongs_to :dress

  validates :user_id, :presence => true
  validates :dress_id, :presence => true
  validates :start_date, :presence => true
  validates :end_date, :presence => true
  validate :validate_end_date_before_start_date

  def validate_end_date_before_start_date
    if end_date && start_date
      errors.add(:end_date, "Your start and end date don't make sense") if end_date < start_date
    end
  end

end
