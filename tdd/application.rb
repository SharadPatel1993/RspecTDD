require 'date'

#----------------------------------------#

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

	def remove_email(index)
		@emails.delete_at(index)
	end

	def add_phone (phone)
		@phone_numbers << phone
	end

	def remove_phone (index)
		@phone_numbers.delete_at(index)
	end

	def message
		"#{@fullname} was born on #{@dob}. Their email address(es) are: #{@emails}. Their phone number(s) are #{@phone_numbers}"
	end

end

class FamilyMember < Person

	#Initializer

	def initialize (f_name = "", s_name = "", date = nil, relationship)
		super(f_name, s_name, date)
		@relationship = relationship
	end

	#Getter

	def relationship
		@relationship
	end

end

#----------------------------------------#

class AddressBook

	#Initializer
	def initialize
		@list = []
	end

	#Setters

	def add (person)
		person.is_a?(FamilyMember) || person.is_a?(Person) ? @list << person.fullname : "Not a Person or FamilyMember object!"
	end

	#Getters

	def list
		@list
	end

end
