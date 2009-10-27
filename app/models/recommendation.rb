class Recommendation < ActiveRecord::Base
  belongs_to :canned_query
  belongs_to :source, :class_name => 'Resource'
  belongs_to :destination, :class_name => 'Resource'
end
