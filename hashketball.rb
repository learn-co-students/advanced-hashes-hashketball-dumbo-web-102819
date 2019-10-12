# Write your code here!
def game_hash
    hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
          { :player_name => "Alan Anderson",
            :number => 0,
            :shoe => 16,
            :points => 22,
            :rebounds => 12,
            :assists => 12,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 1
          },
          { :player_name => "Reggie Evans",
            :number => 30,
            :shoe => 14,
            :points => 12,
            :rebounds => 12,
            :assists => 12,
            :steals => 12,
            :blocks => 12,
            :slam_dunks => 7
          },
          { :player_name => "Brook Lopez",
            :number => 11,
            :shoe => 17,
            :points => 17,
            :rebounds => 19,
            :assists => 10,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 15
          },
          { :player_name => "Mason Plumlee",
            :number => 1,
            :shoe => 19,
            :points => 26,
            :rebounds => 11,
            :assists => 6,
            :steals => 3,
            :blocks => 8,
            :slam_dunks => 5
          },
          { :player_name => "Jason Terry",
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
          { :player_name => "Jeff Adrien",
            :number => 4,
            :shoe => 18,
            :points => 10,
            :rebounds => 1,
            :assists => 1,
            :steals => 2,
            :blocks => 7,
            :slam_dunks => 2
          },
          { :player_name => "Bismack Biyombo",
            :number => 0,
            :shoe => 16,
            :points => 12,
            :rebounds => 4,
            :assists => 7,
            :steals => 22,
            :blocks => 15,
            :slam_dunks => 10
          },
          { :player_name => "DeSagna Diop",
            :number => 2,
            :shoe => 14,
            :points => 24,
            :rebounds => 12,
            :assists => 12,
            :steals => 4,
            :blocks => 5,
            :slam_dunks => 5
          },
          { :player_name => "Ben Gordon",
            :number => 8,
            :shoe => 15,
            :points => 33,
            :rebounds => 3,
            :assists => 2,
            :steals => 1,
            :blocks => 1,
            :slam_dunks => 0
          },
          { :player_name => "Kemba Walker",
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


def num_points_scored(name)
  data = game_hash
  points = 0
  data.each do |k, v|
    stats = v[:players]
    stats.each do |stat|
      if stat[:player_name] === name
        points = stat[:points]
      end
    end
  end
  points
end


def shoe_size(name)
  data = game_hash
  size = 0
  data.each do |k, v|
    stats = v[:players]
    stats.each do |stat|
      if stat[:player_name] === name
        size = stat[:shoe]
      end
    end
  end
  size
end

def team_colors(team)
  data = game_hash
  colors = []
  data.each do |k, v|
    if data[k][:team_name] == team
      colors = v[:colors]
    end
  end
  colors
end


def team_names
  data = game_hash
  home_team = data[:home][:team_name]
  away_team = data[:away][:team_name]
  
  [home_team, away_team]
end


def player_numbers(team)
  data = game_hash
  numbers = []
  data.each do |k, v|
    team_name = v[:team_name]
    if team_name == team
      team_stats = v[:players]
      team_stats.each do |stat|
        numbers.push(stat[:number])
      end
    end
  end
  numbers
end


def player_stats(player)
  data = game_hash
  player_stat = {}
  data.each do |k, v|
    stats = v[:players]
    stats.each do |stat|
      if stat[:player_name] == player
        player_stat = {
          :number => stat[:number],
          :shoe => stat[:shoe],
          :points => stat[:points],
          :steals => stat[:steals],
          :rebounds => stat[:rebounds],
          :assists => stat[:assists],
          :blocks => stat[:blocks],
          :slam_dunks => stat[:slam_dunks]
          }
      end
    end
  end
  player_stat
end


def find_max_score
  data= game_hash
  scores = []
  data.each do |k, v|
    stats = v[:players]
    stats.each do |stat|
      scores.push(stat[:points])
    end
  end
  max = scores.max
end

def biggest_shoe_size
  data = game_hash
  size = []
  data.each do |k, v|
    stats = v[:players]
    stats.each do |stat|
      size.push(stat[:shoe])
    end
  end
  max = size.max
end

def big_shoe_rebounds
  data = game_hash
  max = biggest_shoe_size
  rebounds = 0
  data.each do |k, v|
    stats = v[:players]
    stats.each do |stat|
      if stat[:shoe] == max
        rebounds = stat[:rebounds]
      end
    end
  end
  rebounds
end

def most_points_scored
  data = game_hash
  max_score = find_max_score
  
  player = nil
  data.each do |k, v|
    stats = v[:players]
    stats.each do |stat|
      if stat[:points] == max_score
        player = stat[:player_name]
      end
    end
  end
  player
end


def total_team_score(team)
  total = 0
  team[:players].each do |k|
    total += k[:points]
  end
  total
end


def winning_team
  data = game_hash
  home_team = data[:home]
  away_team = data[:away]
  
  home_score = total_team_score(home_team)
  away_score = total_team_score(away_team)

  if home_score > away_score
    data[:home][:team_name]
  else
    data[:away][:team_name]
  end
end

def player_with_longest_name
  data = game_hash
  min = 0
  longest_name = nil
  data.each { |k, v|
    v[:players].each do |stat|
      if stat[:player_name].length > min
        min = stat[:player_name].length
        longest_name = stat[:player_name]
      end
    end
  }
  longest_name
end

def get_most_steals
  data = game_hash
  min = 0
  max = 0
  data.each do |k, v|
    stats = v[:players]
    stats.each do |k|
      if k[:steals] > min
        min = k[:steals]
        max = k[:steals]
      end
    end
  end
  max
end

def long_name_steals_a_ton?
  data = game_hash
  most_steals = get_most_steals
  longest_name = player_with_longest_name
  
  result = nil;
  data.each do |k, v|
    v[:players].each do |stat|
      if stat[:player_name][longest_name]
        if stat[:steals] == most_steals
          result = true
        else
          result = false
        end
      end
    end
  end
  result
end







