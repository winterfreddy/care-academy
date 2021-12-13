class Course < ApplicationRecord
    validates :name, presence: true
    validate :check_name_length
    validates :release_date, presence: true
    validate :check_release_date_format

    def check_name_length
        if self.name.length < 5
            errors[:name] << "is too short, must be at least 5 characters long"
        end
    end

    def check_release_date_format
        date = self.release_date.split("-")
        if(date[0].length != 2)
            errors[:release_date] << "has an invalid month length"
        elsif (date[0].to_i < 1 || date[0].to_i > 12)
            errors[:release_date] << "has an invalid month date"
        end

        if(date[1].length != 2)
            errors[:release_date] << "has an invalid day length"
        elsif (date[1].to_i < 1 || date[1].to_i > 31)
            errors[:release_date] << "has an invalid day date"
        end

        if(date[2].length != 4)
            errors[:release_date] << "has an invalid year length"
        end
    end

end