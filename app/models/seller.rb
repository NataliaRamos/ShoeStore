class Seller < ActiveRecord::Base
  has_secure_password
  has_many :shoes
  has_many :sales, :class_name =>"Purchase", :foreign_key => "seller_id"
  has_many :purchases, :class_name => "Purchase", :foreign_key => "buyer_id"


  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name,:last_name, :email, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

  def name
    "#{self.first_name} #{self.last_name} "
  end
end
