class User <ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :session_token
  attr_protected :points

  has_secure_password

  has_many :dresses
  belongs_to :rental

  before_save { |user| user.email = email.downcase }

  validates :email, :presence => true, uniqueness: {case_sensitive: false},
            format: { with: /\A([^@\s]+)@dartmouth.edu/i, :message => "That is not a valid Dartmouth email."}
  validates :password, :length => { :minimum => 4, :maximum => 20 }, :if => :update_password
  validates :last_name, :presence => true

  def log_out
    self.session_token = nil
  end

  def update_password

  end

end
