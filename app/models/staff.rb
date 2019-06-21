class Staff < ApplicationRecord
  belongs_to :user
  belongs_to :staff, class_name: 'User'
end
