require "pry"
def game_hash
  game_stats = Hash.new
  game_stats = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismack Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Kemba Walker" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      ]
    }
  }
end

def num_points_scored(player_name)
  game_hash.each do |location, team|
    team.each do |category, teamcolorplayer|
      if category == :players
        teamcolorplayer.each do |players_array|
          players_array.each do |player_key, player_value|
            if player_name == player_key
              return player_value[:points]
            end
          end
        end
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |location, team|
    team.each do |category, teamcolorplayer|
       if category == :players
          teamcolorplayer.each do |players_array|
            players_array.each do |player_key, player_value|
              if player_name == player_key
                return player_value[:shoe]
              end
            end
          end
       end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, team|
    if team[:team_name] == team_name
      return team[:colors]
    end
  end
end

def team_names
  team_names_array = []
  game_hash.each do |location, team|
    if team_names_array[0] != team[:team_name] && team_names_array[1] != team[:team_name]
    team_names_array.push(team[:team_name])
    end
  end
  team_names_array
end

def player_numbers(team_name)
  array_of_jeresy_number = []
  game_hash.each do |location, team|
    team.each do |category, teamcolorplayer|
      if category == :players
         teamcolorplayer.each do |players_array|
           players_array.each do |player_key, player_value|
             if team[:team_name] == team_name
               array_of_jeresy_number.push(player_value[:number])
             end
           end
         end
      end
    end
  end
  array_of_jeresy_number
end

def player_stats(player_name)
  game_hash.each do |location, team|
    team.each do |category, teamcolorplayer|
      if category == :players
        teamcolorplayer.each do |players_array|
          players_array.each do |player_key, player_value|
            if player_key == player_name
              return player_value
            end
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  biggest_shoe_rebounds = 0
  largest_shoe = 0
  game_hash.each do |location, team|
    team.each do |category, teamcolorplayer|
       if category == :players
          teamcolorplayer.each do |players_array|
            players_array.each do |player_key, player_value|
              if largest_shoe < player_value[:shoe]
                largest_shoe = player_value[:shoe]
                biggest_shoe_rebounds = player_value[:rebounds]
              end
            end
          end
       end
    end
  end
  biggest_shoe_rebounds
end

def most_points_scored
  player_temp = ""
  points_temp = 0
  game_hash.each do |location, team|
    team.each do |category, teamcolorplayer|
      if category == :players
        teamcolorplayer.each do |players_array|
          players_array.each do |player_key, player_value|
            if points_temp < player_value[:points]
              points_temp = player_value[:points]
              player_temp = player_key
            end
          end
        end
      end
    end
  end
  player_temp
end

def winning_team
  home_total = 0
  away_total = 0
  game_hash.each do |location, team|
    team.each do |category, teamcolorplayer|
      if category == :players
        teamcolorplayer.each do |players_array|
          players_array.each do |player_key, player_value|
            if location == :home
              home_total += player_value[:points]
            elsif location == :away
              away_total += player_value[:points]
            end
          end
        end
      end
    end
  end
  if home_total > away_total
    return game_hash[:home][:team_name]
  elsif home_total < away_total
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  player_temp = ""
  length_temp = 0
  game_hash.each do |location, team|
    team.each do |category, teamcolorplayer|
      if category == :players
        teamcolorplayer.each do |players_array|
          players_array.each do |player_key, player_value|
            if length_temp < player_key.length
              length_temp = player_key.length
              player_temp = player_key
            end
          end
        end
      end
    end
  end
  player_temp
end

def long_name_steals_a_ton?
  compare_1 = player_with_longest_name
  player_temp = ""
  steals_temp = 0
  game_hash.each do |location, team|
    team.each do |category, teamcolorplayer|
      if category == :players
        teamcolorplayer.each do |players_array|
          players_array.each do |player_key, player_value|
            if steals_temp < player_value[:steals]
              steals_temp = player_value[:steals]
              player_temp = player_key
            end
          end
        end
      end
    end
  end
  if compare_1 == player_temp
    return true
  else
    return false
  end
end
