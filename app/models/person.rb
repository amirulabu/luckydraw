class Person < ApplicationRecord
	validates :petid, uniqueness: true
end
