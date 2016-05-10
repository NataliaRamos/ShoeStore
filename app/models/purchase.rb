class Purchase < ActiveRecord::Base
  belongs_to :seller
  belongs_to :shoe
  belongs_to :buyer, :class_name => "Seller"

end
