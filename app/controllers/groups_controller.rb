class GroupsController < ApplicationController

	def new
		@group = Group.new
	end

	def create
		@group = Group.new(group_params)

		if @group.save
			GroupMembership.create(
				user_id: current_user.id,
				group_id: @group.id
			)

			redirect_to :groups
		else
			render :new
		end
	end

	def index
		all_groups = Group.all
		@my_groups = current_user.groups
		@other_groups = []
		all_groups.each do |group|
			@other_groups << group unless @my_groups.include?(group)
		end
	end

	def show
		@group = Group.find(params[:id])
	end

	private

	def group_params
		params.require(:group).permit(:name, :description)
	end
end