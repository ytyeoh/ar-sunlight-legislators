require_relative '../db/config'
require 'date'

class Queries

  def self.last_name_p(state)
    @senators = Legislator.where(title: "Sen", state: state).order(last_name: :asc)
      puts "Senators:"
    @senators.each do |senator|
      puts "  #{senator.name} (#{senator.party})"
    end
    @representatives = Legislator.where(title:"Rep", state: state).order(last_name: :asc)
    puts "Representatives:"
    @representatives.each do |rep|
      puts "  #{rep.name} (#{rep.party})"
    end
  end

    def self.gender
      @senators = Legislator.where(gender: "M", title: "Sen").count
      @count = Legislator.where(title: "Sen").select(:gender).count
      x= (@senators.to_f/ @count.to_f)*100.0


      puts "Male Senators: #{@senators} (#{x.to_i}%)"

      @representatives = Legislator.where(gender: "M", title: "Rep").count
      @count2 = Legislator.where(title: "Rep").select(:gender).count
      y= (@representatives.to_f/ @count2.to_f)*100.0


      puts "Male Representives: #{@representatives} #{y.to_i}%)"
    end

  def self.active

    Legislator.last_name_p(state)


  end
  # def senator(state)
  #   @sen = Legistator.selet(:in_office).count.where(title: "Sen"  state: state)
  # end




    #SELECT state count(sen) count(rep)
    #ORDER BY rep






end