class ToDo < ActiveRecord::Base
	belongs_to :assignee



	def self.search(params)
		name = params[:assignee_id]
		start = params[:start_date]
		end_date = params[:end_date]

		search = ToDo.all 

		search.where('SELECT task_names WHERE start_date > "#{start}" and end_date < "#{end_date}"')

		search
	end
end
