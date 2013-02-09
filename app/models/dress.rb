class Dress <ActiveRecord::Base
  SIZES = ["0","2","4","6","8","10","12","14+"]
  attr_accessible :body_type_ids, :owner_id, :brand, :color, :size, :notes, :rent, :photo_blob

  belongs_to :owner, :class_name => "User"
  has_many :body_type_dresses
  has_many :body_types, :through => :body_type_dresses
  before_save {|dress| dress.color = dress.color.downcase}

  validates :owner_id, :presence => true
  validates :size, :presence => true
  validates :color, :presence => true
  validates :rent, :presence => true


  def body_types_string
    labels = []
    self.body_types.each do |body_type|
      labels << body_type.label
    end
    labels.join(", ")
  end
end
