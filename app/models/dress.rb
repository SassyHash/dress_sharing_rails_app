class Dress <ActiveRecord::Base
  attr_accessible :owner_id, :brand, :color, :size, :body_type, :notes, :rent

  belongs_to :owner, :class_name => "User"
  before_save {|dress| dress.color = dress.color.downcase}

  validates :owner_id, :presence => true
  validates :size, :presence => true
  validates :color, :presence => true
  validates :rent, :presence => true

end
