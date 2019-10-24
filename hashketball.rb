# Write your code here!
def game_hash
  returnHash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {:player_name => "Alan Anderson",
         :number => 0,
         :shoe => 16,
         :points => 22,
         :rebounds => 12,
         :assists => 12,
         :steals => 3,
         :blocks => 1,
         :slam_dunks => 1
        },
        {:player_name => "Reggie Evans",
         :number => 30,
         :shoe => 14,
         :points => 12,
         :rebounds => 12,
         :assists => 12,
         :steals => 12,
         :blocks => 12,
         :slam_dunks => 7
        },
        {:player_name => "Brook Lopez",
         :number => 11,
         :shoe => 17,
         :points => 17,
         :rebounds => 19,
         :assists => 10,
         :steals => 3,
         :blocks => 1,
         :slam_dunks => 15
        },
        {:player_name => "Mason Plumlee",
         :number => 1,
         :shoe => 19,
         :points => 26,
         :rebounds => 11,
         :assists => 6,
         :steals => 3,
         :blocks => 8,
         :slam_dunks => 5
        },
        {:player_name => "Jason Terry",
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
        {:player_name => "Jeff Adrien",
         :number => 4,
         :shoe => 18,
         :points => 10,
         :rebounds => 1,
         :assists => 1,
         :steals => 2,
         :blocks => 7,
         :slam_dunks => 2
        },
        {:player_name => "Bismack Biyombo",
         :number => 0,
         :shoe => 16,
         :points => 12,
         :rebounds => 4,
         :assists => 7,
         :steals => 22,
         :blocks => 15,
         :slam_dunks => 10
        },
        {:player_name => "DeSagna Diop",
         :number => 2,
         :shoe => 14,
         :points => 24,
         :rebounds => 12,
         :assists => 12,
         :steals => 4,
         :blocks => 5,
         :slam_dunks => 5
        },
        {:player_name => "Ben Gordon",
         :number => 8,
         :shoe => 15,
         :points => 33,
         :rebounds => 3,
         :assists => 2,
         :steals => 1,
         :blocks => 1,
         :slam_dunks => 0
        },
        {:player_name => "Kemba Walker",
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
  game_hash.each do |key, value|
    #puts "key #{key}"
    #puts "  value #{value[:players]}"
    value[:players].each do |player|
      if player[:player_name] == name
        return player[:points]
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |key, value|
    value[:players].each do |player|
      if player[:player_name] == name
        return player[:shoe]
      end
    end
  end
end

def team_colors(teamName)
  game_hash.each do |key, value|
    if value[:team_name] == teamName
      return value[:colors]
    end
  end
end

def team_names()
  teamNames = []
  game_hash.each do |key, value|
    teamNames.push(value[:team_name])
  end
  teamNames
end

def player_numbers(teamName)
  jerseys = []
  game_hash.each do |key, value|
    if value[:team_name] == teamName
      value[:players].each do |player|
        jerseys.push(player[:number])
      end
    end
  end
  return jerseys
end

def player_stats(name)
  stats = {}
  game_hash.each do |key, value|
    value[:players].each do |player|
      if player[:player_name] == name
        player.each do |dataType, data|
          if (data != name)
            stats[dataType] = data
          end
        end
      end
    end
  end
  #puts " Final Stats: #{stats}"
  stats
end

def big_shoe_rebounds()
  biggestShoe = -1
  rebound = -1
  game_hash.each do |key, value|
    value[:players].each do |player|
      if biggestShoe < player[:shoe]
        biggestShoe = player[:shoe]
        rebound = player[:rebounds]
      end
    end
  end
  return rebound
end

def most_points_scored()
  mostPoints = -1
  name = ""
  game_hash.each do |key, value|
    value[:players].each do |player|
      if mostPoints < player[:points]
        mostPoints = player[:points]
        name = player[:player_name]
      end
    end
  end
  return name
end

def winning_team()
  points = {}
  game_hash.each do |key, value|
    value[:players].each do |player|
      if points.key?(value[:team_name])
        points[value[:team_name]] += player[:points]
      else
        points[value[:team_name]] = player[:points]
      end
    end
  end
  
  highestValue = -1
  highestPointHash = ""
  points.each do |teamName, value|
    if highestValue < value
      highestValue = value
      highestPointHash = teamName
    end
  end
  #puts "  Points: #{points}, teamName #{highestPointHash}"
  highestPointHash
end

def player_with_longest_name()
  mostLen = -1
  name = ""
  game_hash.each do |key, value|
    value[:players].each do |player|
      if mostLen < player[:player_name].size
        mostLen = player[:player_name].size
        name = player[:player_name]
      end
    end
  end
  return name
end

def long_name_steals_a_ton?()
  mostLen = -1
  longestName = ""
  mostSteal = -1
  mostStealName = ""
  game_hash.each do |key, value|
    value[:players].each do |player|
      if mostLen < player[:player_name].size
        mostLen = player[:player_name].size
        longestName = player[:player_name]
      end
      if mostSteal < player[:steals]
        mostSteal = player[:steals]
        mostStealName = player[:player_name]
      end
    end
  end
  
  return longestName == mostStealName
end













