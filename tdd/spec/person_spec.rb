require 'spec_helper'
describe "Person class - entry in phonebook" do
	it "should store and return personal information" do
		person = Person.new("joe", "bloggs", "1 Jan 1996")

		#Expected Outcomes
		expect(person.dob.to_s).to eq "1996-01-01"
		expect(person.first_name).to eq "Joe"
		expect(person.surname).to eq "Bloggs"
		expect(person.fullname).to eq "Joe Bloggs"
	end
end

describe "Person class - add email for someone" do
	it "should store and return email" do
		person = Person.new("joe", "bloggs", "1 Jan 1996")

		#Expected Outcomes
		expect(person.emails).to eq []

		person.add_email "joe@foo.com"
		person.add_email "joe.bloggs@work.com"

		#Expected Outcomes
		expect(person.emails).to eq ["joe@foo.com", "joe.bloggs@work.com"]
	end
end

describe "Person class - add phone number for someone" do
	it "should store and return phone numbers" do
		person = Person.new("joe", "bloggs", "1 Jan 1996")

		#Expected Outcomes
		expect(person.phone_numbers).to eq []

		person.add_phone "07712345678"
		person.add_phone "02012345678"

		#Expected Outcomes
		expect(person.phone_numbers).to eq ["07712345678", "02012345678"]
	end
end

describe "Person class - remove email for someone" do
	it "should remove that email from that entry" do
		person = Person.new("joe", "bloggs", "1 Jan 1996")
		person.add_email "joe@foo.com"
		person.add_email "joe.bloggs@work.com"
		person.remove_email(0)

		#Expected Outcomes
		expect(person.emails).to eq ["joe.bloggs@work.com"]
	end
end

describe "Person class - remove phone number for someone" do
	it "should remove that phone number from that entry" do
		person = Person.new("joe", "bloggs", "1 Jan 1996")
		person.add_phone "07712345678"
		person.add_phone "02012345678"
		person.remove_phone(0)

		#Expected Result
		expect(person.phone_numbers).to eq ["02012345678"]
	end
end

describe "Person class - describe person" do
	it "should show a message with fullname, dob, email address and phone number for the entry" do
		person = Person.new("joe", "bloggs", "1 Jan 1996")
		person.add_email "joe.bloggs@work.com"
		person.add_phone "07712345678"
		person.add_phone "02012345678"

		#Expected Result
		expect(person.message).to eq "Joe Bloggs was born on 1996-01-01. Their email address(es) are: [\"joe.bloggs@work.com\"]. Their phone number(s) are [\"07712345678\", \"02012345678\"]"
	end
end

describe "FamilyMember class - inherits from Person and has relationship instance variable" do
	it "should inherit from Person class and initialize a relationship variable" do
		person = FamilyMember.new("joe", "bloggs", "1 Jan 1996", "father")

		#Expected Result
		expect(person.class).to eq FamilyMember
		expect(person.relationship).to eq "father"
	end
end

describe "AddressBook class - entry in AddressBook" do
	it "should store entries into an AddressBook list" do
		person1 = Person.new("joe", "blogs", "1 Jan 1990")
		person2 = Person.new("andy", "nother", "2 Jan 1995")
		book = AddressBook.new
		book.add person1
		book.add person2

		#Expected Result
		expect(book.list).to eq ["Joe Blogs", "Andy Nother"]
	end
end







