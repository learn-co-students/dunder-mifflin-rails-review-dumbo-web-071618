class Employee < ApplicationRecord
    validates :alias, uniqueness: true
    validates :title, uniqueness: true
    belongs_to :dog

    def name
      "#{self.first_name} #{self.last_name}"
    end

    def dog_name
      self.dog ? self.dog.name : nil
    end
end
