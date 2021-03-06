require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays

  holiday_hash.each do |season, season_data|
    if season == :winter
      season_data.each do |holiday, supply_list|
        supply_list << supply
      end
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |season, season_data|
    season_data.each do |holiday, supply_list|
      if holiday == :memorial_day
        supply_list << supply
      end
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash.each do |season_key, season_data|
    if season_key == season
      season_data[holiday_name] = supply_array
    end
  end
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season_key, season_data|
      puts "#{season_key.to_s.capitalize}:"
      season_data.each do |holiday, supplies|
        new_holiday = holiday.to_s.split("_") #put into array

        new_holiday.each do |word|
          word.capitalize!
        end
        new_string = new_holiday.join(" ")

        puts "  #{new_string}: #{supplies.join(", ")}"
      end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"

  #### USING EACH #######################################################
  #return_array = []

  #holiday_hash.each do |season_key, season_data|
  #  season_data.each do |holiday, supplies|
  #    if supplies.include?("BBQ")
  #      return_array << holiday
  #    end
  #  end
  #end
  #return_array

  #### USING COLLECT ####################################################
  holiday_hash.collect do |season_key, season_data|
    season_data.collect do |holiday, supplies|
        holiday if supplies.include?("BBQ")
    end
  end.flatten.compact
end
