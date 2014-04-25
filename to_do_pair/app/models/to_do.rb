class ToDo < ActiveRecord::Base
	belongs_to :assignee



	def self.search(params)
	
		search = ToDo.all 

		search.where('SELECT to_dos WHERE start_date > "#{start}" and end_date < "#{end_date}"')

		search
	end
end
