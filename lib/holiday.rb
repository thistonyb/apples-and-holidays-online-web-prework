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
  holiday_hash[:winter][:christmas] = supply
  holiday_hash[:winter][:new_years] = supply
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] = supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  supplies_array = holiday_hash[:winter].collect {|key, value| value}
  supplies_array.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season_key, holiday_hash_value|
    output_season_key = season_key.to_s.capitalize!
    puts "#{output_season_key}:"
    holiday_hash_value.each do |holiday_key, supply_array_value|
      holiday_string_array = holiday_key.to_s.split('_')
      capital_holiday_string_array = holiday_string_array.collect {|element| element.capitalize!}
      holiday_string = capital_holiday_string_array.join(' ')
      output_holiday_string = "#{  holiday_string}: "
      output_supply = supply_array_value.join(", ")
      puts "  #{output_holiday_string + output_supply}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  output_array = []
  holiday_hash.each do |season_key, holiday_hash_value|
    holiday_hash_value.each do |holiday_key, supply_array|
      if supply_array.include?("BBQ")
        output_array.push(holiday_key)
      end
    end
  end
  output_array
end
