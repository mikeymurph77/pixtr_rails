class Tag < ActiveRecord::Base
	has_many :tag_lists

	belongs_to :image
end