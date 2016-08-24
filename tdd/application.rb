require 'date'

class Person

	#Initializer
	def initialize(f_name, s_name, date)
		@first_name = f_name.capitalize!
		@surname = s_name.capitalize!
		@dob = Date.parse(date)
		@fullname = "#{@first_name} #{@surname}"
		@emails = []
		@phone_numbers = []

	end

	attr_reader :dob, :first_name, :surname, :fullname, :emails, :phone_numbers

	def add_email (email)
		@emails << email
	end

	def add_phone (phone)
		@phone_numbers << phone
	end

end