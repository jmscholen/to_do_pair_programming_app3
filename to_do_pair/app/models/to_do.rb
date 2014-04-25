class ToDo < ActiveRecord::Base
	belongs_to :assignee

	def self.find_person(person)
		joins(:assignee).where('assignees.assignee_name LIKE ?', person)
	end 

	def self.search(params)
		person = params[:assignee_name]
		start_date = params[:start_date]
		end_date = params[:end_date]
		radio = params[:completed]
	
		search = ToDo.all 
		if params[:start_date].present? && params[:end_date].present?
			search = search.where("due_date >= ? AND due_date <= ?",  start_date, end_date)
		end

		if params[:start_date].present? 
			search = search.where("due_date >= ? ",  start_date)
		end

		if params[:end_date].present?
			search = search.where("due_date <= ? ",  end_date)
		end

		if person.present?
			search = search.find_person(person)
		end

		if radio == "true"
			search = search.where("complete = ?", true)
		end	

		search
	end
end
