class Like < ApplicationRecord
  belong_to :user
  belong_to :restaurant
end
