require_relative '../../db/config'
require 'date'


class Legislator < ActiveRecord::Base
   validates_format_of :bioguide_id, :with => /[A]\d{6}/
   validates :bioguide_id, uniqueness: true
   validates :age, :numericality => { :greater_than_or_equal_to => 18 }
   validates :phone, :length => { :minimum => 10 }

   def age
    age = Time.now.year - birthday.year
  end

  def name
    "#{first_name} #{middlename} #{last_name}"
  end


end


# test in IRB
#1. load 'db/config.rb' => true
# 2. Legislator.all =>all table
# 3. l = Legislator.new => empty data
# 4. l.bioguide_id = "A333521" => "A333521"
# 5. l.email = Faker::Internet.email => "dsfds@emial.com" use require Faker to random email
# 6.l.birthday = 38 years.ago => 1977-201-01 11:06:52
# 7.l.phone = "124558512" =>"124558512"
# l.save=> true if not fill in all according validates condition, l.save return error