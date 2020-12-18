class User < ApplicationRecord
  # self.abstract_class = true

  belongs_to :account
end
