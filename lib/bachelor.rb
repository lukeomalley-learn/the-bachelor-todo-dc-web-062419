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
        return contestant[:occupation].to_s
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
  return (ages.inject(0){|sum,x| sum + x } / ages.length).round
end