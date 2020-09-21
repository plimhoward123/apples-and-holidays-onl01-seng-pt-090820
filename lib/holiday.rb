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
  return holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter][:christmas] << supply
  holiday_hash[:winter][:new_years] << supply

  holiday_hash
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array

  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  tmparry = []
  xmas = ""
  nye = ""
  strfinal = "Winter:\n"
  holiday_hash[:winter].each do |key, value|
    if (key == :christmas)
      xmas = (" " + key.to_s.capitalize + ": " + value.join(", ").to_s)
    elsif (key == :new_years)
      tmparry = key.to_s.split("_")
      tmparry.each_with_index {|val,index| tmparry[index] = val.capitalize}
      nye = (" " + tmparry.join(" ") + ": " +  value.join().to_s)
    end
  end
  return (strfinal + xmas + "\n" + nye)
end

def all_supplies_in_holidays(holiday_hash)
  finl_string = "Winter:\n"
  holiday_hash.each do |key, value|
    if (key == :winter)
      wntrstring = ""
        value.each do |holiday, item|
          if (holiday == :christmas)
            wntrstring += ("  " + holiday.to_s.capitalize + ": " + item.join(", ").to_s + "\n")
          elsif (holiday == :new_years)
            tmparry = holiday.to_s.split("_")
            tmparry.each_with_index {|val,index| tmparry[index] = val.capitalize}
            wntrstring += ("  " + tmparry.join(" ") + ": " +  item.join().to_s + "\n")
          end
        end
        finl_string += wntrstring
    elsif (key == :summer)
      smrstring = "Summer:\n"
      value.each do |holiday, item|
        tmparry = holiday.to_s.split("_")
        tmparry.each_with_index {|val,index| tmparry[index] = val.capitalize}
        smrstring += ("  " + tmparry.join(" ") + ": " +  item.join(", ").to_s + "\n")
      end
      finl_string += smrstring

    elsif (key == :fall)
      fllstring = "Fall:\n"
      value.each do |holiday,item|
        fllstring +=  ("  " + holiday.to_s.capitalize + ": " + item.join(", ").to_s + "\n")
      end
      finl_string += fllstring

    elsif (key == :spring)
      spngstring = "Spring:\n"
      value.each do |holiday,item|
        tmparry = holiday.to_s.split("_")
        tmparry.each_with_index {|val,index| tmparry[index] = val.capitalize}
        spngstring += ("  " + tmparry.join(" ") + ": " +  item.join(", ").to_s + "\n")
      end
      finl_string += spngstring
    end
  end
  puts finl_string
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  symbl_array = []

  holiday_hash.each do |season, holidays|
    holidays.each do |holiday, activites|
      activites.each do |dep|
        if (dep == "BBQ")
          symbl_array << holiday
        end
      end
    end
  end
    symbl_array
end
