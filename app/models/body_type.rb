class BodyType <ActiveRecord::Base
  attr_accessible :label
  LABELS = ["Petite", "Athletic", "Lean", "Busty", "Pear", "Tall", "Hourglass", "Curvy"]
  has_many :body_type_dress
  has_many :dresses, :through => :body_type_dresses

end
