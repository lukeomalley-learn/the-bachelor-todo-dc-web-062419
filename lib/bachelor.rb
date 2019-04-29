def get_first_name_of_season_winner(data, season)
  data.each do |season_number, contestants_array|
    if season_number.to_s == season.to_s
      contestants_array.each do |contestant|
        if contestant[:status] == 'Winner'
          return contestant[:name].split(' ')[0]
        end
      end
    end
  end
end

def get_contestant_name(data, occupation)
  data.each do |season_number, contestants_array|
    contestants_array.each do |contestant|
      if contestant[:occupation] == occupation
        return contestant[:name]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  count = 0
  data.each do |season_number, contestants_array|
    contestants_array.each do |contestant|
      if contestant[:hometown] == hometown
        count += 1
      end
    end
  end
  return count
end

def get_occupation(data, hometown)
  data.each do |season_number, contestants_array|
    contestants_array.each do |contestant|
      if contestant[:hometown] == hometown
        return contestant[:occupation]
      end
    end
  end
end

def get_average_age_for_season(data, season)
  ages = []
  data.each do |season_number, contestants_array|
    if season_number.to_s == season.to_s
      contestants_array.each do |contestant|
        ages.push(contestant[:age].to_f)
      end
    end
  end
  return ages.inject(0){|sum,x| sum + x } / ages.length
end

test_data = { 
  "season 30": [
    {
      "name":      "Beth Smalls",
      "age":       "26",
      "hometown":  "Great Falls, Virginia",
      "occupation":"Nanny/Freelance Journalist",
      "status":    "Winner"
    },
    {
      "name":       "Becca Tilley",
      "age":        "27",
      "hometown":   "Shreveport, Louisiana",
      "occupation": "Chiropractic Assistant",
      "status":     "Eliminated Week 8"
    }
  ],
  "season 29": [
    {
      "name":      "Ashley Yeats",
      "age":       "24",
      "hometown":  "Denver, Colorado",
      "occupation":"Dental Assitant",
      "status":    "Winner"
    },
    {
      "name":       "Sam Grover",
      "age":        "29",
      "hometown":   "New York, New York",
      "occupation": "Entertainer",
      "status":     "Eliminated Week 6"
    }
  ]
}

puts get_average_age_for_season(test_data, "season 30")