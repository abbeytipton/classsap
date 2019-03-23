class Product < ApplicationRecord

  belongs_to :user, optional: true, foreign_key: "id"
  
end
