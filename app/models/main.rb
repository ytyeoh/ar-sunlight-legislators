require_relative '../../db/config'
require 'date'

class Queries

  def self.last_name_p
    p Legislator.find(10)

# WHERE last_name, party FROM Legislators
# SORBT BY last_name
# LIMIT 2;

  end





end