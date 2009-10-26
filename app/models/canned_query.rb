class CannedQuery < ActiveRecord::Base
  belongs_to :idea
  belongs_to :endpoint
end
