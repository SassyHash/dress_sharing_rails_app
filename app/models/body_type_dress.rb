class BodyTypeDress <ActiveRecord::Base
  attr_accessible :dress_id, :body_type_id

  belongs_to :dress
  belongs_to :body_type


end