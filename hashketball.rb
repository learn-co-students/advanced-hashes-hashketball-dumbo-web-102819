# Write your code here!

ef game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
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
          :rebounds => 12,
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
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
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
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
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
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

#First defined method which goes into the created array
#And goes through the layer of data in order to find
#Necessary data components to compute the total number
#of points scored.
  
def num_points_scored(name)
  hash = game_hash
  hash.each do |location, info| 
    info.each do |attribute, stuff| 
      if stuff.include?(name) 
       return hash[location][attribute][name][:points]
      end
    end
  end
end

def team_names
    hash = game_hash
    array = []
    hash.each do |location, attributes|
        attributes.each do |attribute, info|
            if attribute == :team_name
                array << info
            end
        end
    end
    return array
end

def player_numbers(team_name)
    #Firstly, a new hash called game hash is created
    hash = game_hash
    array = []
    hash.each do |location, attributes|
        if hash[location]
            .values.include?(team_name)
            attributes.each do |attribute, info|
                if info.class == Hash
                    info.each do |player, stats|
                        if stat == :number
                            array << int.to_i
                        end
                    end
                end
            end
        end
    end
end
return array
end

#What this method attemots to do is go deep within the
#nested array by using conditionals and enumerables to transfer
#player number data into a newly created
#array which will hold that information.

def player_stats (name)
    hash = game_hash
    hash.each do |location, attributes|
        if hash [location]
            .values[include?(team_name)
                attributes.each do |attribute, info|
                    if info.include?(name)
                        return hash [location]
                        [attribute][name]
                    end
                end
            end
        end


        def big_shoe_rebounds
            hash = game_hash
            player_name = ""
            shoe_size = 0
            hash.each do |location, attributes|
              attributes.each do |attribute, info|
                if info.class == Hash
                  info.each do |player, stats|
                      stats.each do |stat, int|
                        if stat == :shoe
                          if int > shoe_size
                            shoe_size = int
                            player_name = player
                          end
                        end
                      end
                    end
                  return hash[location][attribute][player_name][:rebounds]
                end
              end
            end
          end
          










