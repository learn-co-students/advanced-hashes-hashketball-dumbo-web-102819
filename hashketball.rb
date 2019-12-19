def game_hash
  hash = {
    :home => {
      :team_name => 'Brooklyn Nets',
      :colors => ['Black','White'],
      :players => [
        {
          :player_name => 'Alan Anderson',
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        {
          :player_name => 'Reggie Evans',
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        {
          :player_name => 'Brook Lopez',
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        {
          :player_name => 'Mason Plumlee',
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        {
          :player_name => 'Jason Terry',
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
      :team_name => 'Charlotte Hornets',
      :colors => ['Turquoise','Purple'],
      :players => [
        {
          :player_name => 'Jeff Adrien',
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        {
          :player_name => 'Bismack Biyombo',
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        },
        {
          :player_name => 'DeSagna Diop',
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        {
          :player_name => 'Ben Gordon',
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        {
          :player_name => 'Kemba Walker',
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

def num_points_scored(player)
  get_player_stat_from_key(player, :points)
end


def shoe_size(player)
  get_player_stat_from_key(player, :shoe)
end

def team_colors(team_name)
  game = game_hash
  if game[:home][:team_name] == team_name
    return game[:home][:colors]
  else
    return game[:away][:colors]
  end
end

def team_names
  game = game_hash
  names = []
  names.push(game[:home][:team_name]).push(game[:away][:team_name])
  names
end

def player_numbers(team_name)
  game = game_hash
  player_numbers = []
  if game[:home][:team_name] == team_name
    game[:home][:players].length.times{|i|
      player_numbers.push(game[:home][:players][i][:number])
    }
  else
    game[:away][:players].length.times{|i|
      player_numbers.push(game[:away][:players][i][:number])
    }
  end
  player_numbers
end


def player_stats(player_name)
  get_player_stat_from_key(player_name)
end

def big_shoe_rebounds
  biggest_player_hash = nil
  size = 0
  game = game_hash
  game[:home][:players].each{|player_hash|
    if player_hash[:shoe] > size 
      size = player_hash[:shoe]
      biggest_player_hash = player_hash
    end
  }
  game[:away][:players].each{|player_hash|
    if player_hash[:shoe] > size 
      size = player_hash[:shoe]
      biggest_player_hash = player_hash
    end
  }
  biggest_player_hash[:rebounds]
end

def most_points_scored
  game = game_hash
  most_scored_hash = nil
  score = 0
  
  game.each{ |key, value|
    value[:players].each{ |player_hash|
      if player_hash[:points] > score
        score = player_hash[:points]
        most_scored_hash = player_hash
      end
    }
  }
  most_scored_hash[:player_name]
end

def winning_team
  game = game_hash
  team_scores = game.reduce({}){|memo, (key, value)|
    team_score = 0
    value[:players].length.times{|i|
      team_score += value[:players][i][:points]
    }
    memo[key] = team_score
    memo
  }
  if team_scores[:home] > team_scores[:away]
    return game[:home][:team_name]
  else
    return game[:away][:team_name]
  end
end

def player_with_longest_name
  game = game_hash
  longest_name = 0
  long_name_hash = 'yeet'
  game.each{|key, value|
    value[:players].length.times{|i|
      if value[:players][i][:player_name].length > longest_name
        longest_name = value[:players][i][:player_name].length
        long_name_hash = value[:players][i][:player_name]
      end
    }
  }
  long_name_hash
end

def long_name_steals_a_ton?
  game = game_hash
  longest_name_player = player_with_longest_name
  
  most_steals = 0
  most_steals_name = nil
  game.each{|key, value|
    value[:players].length.times{|i|
      if value[:players][i][:steals] > most_steals
        most_steals = value[:players][i][:steals]
        most_steals_name = value[:players][i][:player_name]
      end
    }
  }
  
  if longest_name_player == most_steals_name
    return true
  else
    return false
  end
end








def get_player_stat_from_key(player, key=nil)
  game = game_hash
  home_players = game[:home][:players]
  away_players = game[:away][:players]
  home_players.length.times{|i|
    if home_players[i][:player_name] == player
      if key == nil
        home_players[i].delete(:player_name)
        return home_players[i]
      else
        return home_players[i][key]
      end
    end
  }
  away_players.length.times{|i|
    if away_players[i][:player_name] == player
      if key == nil
        away_players[i].delete(:player_name)
        return away_players[i]
      else
        return away_players[i][key]
      end
    end
  }
  nil
end







