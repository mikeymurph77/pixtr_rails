class TagsController < ApplicationController
	def new
		@tag = Tag.new
		@tags = Tag.all
	end

	def create
		@tag = Tag.new(tag_params)

		if @tag.save
			GroupMembership.join(
				tag_id: @tag.id,
				image_id: @image.id
			)

			redirect_to [:new, :tag]
		else
			@tags = Tag.all
			render :new
		end
	end

	private

	def tag_params
		params.require(:tag).permit(:tag_name)
	end
end