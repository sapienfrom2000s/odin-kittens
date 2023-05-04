class Kitten < ApplicationRecord
	validates :name, presence: true, length: { maximum: 20 }
	validates_inclusion_of :age, in: 1..30, message: 'has to be valid'
	validates_inclusion_of :softness, in: 1..10, message: 'has to have a valid index'
	validates_inclusion_of :cuteness, in: 1..10, message: 'has to have a valid index'
end
