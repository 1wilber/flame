class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :timeoutable, timeout_in: 1.day
end
