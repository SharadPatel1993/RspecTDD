require 'date'

class Person

	#Initializer
	def initialize(f_name, s_name, date)
		@first_name = f_name.capitalize!
		@surname = s_name.capitalize!
		@dob = Date.parse(date)
		@fullname = "#{@first_name} #{@surname}"
	end

	attr_reader :dob, :first_name, :surname, :fullname

end