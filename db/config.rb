require 'active_record'

ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => "#{File.dirname(__FILE__)}/../db/ar-sunlight-legislators.sqlite3")

require 'faker'
require 'byebug'
require_relative '../app/models/legislator'
require_relative '../app/main'