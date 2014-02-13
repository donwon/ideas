class Voters < ActiveRecord::Base
  belongs_to :vote
  belongs_to :user
end
