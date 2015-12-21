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
    array = []
    Legislator.all.each do |legislator|
      @sen = Legislator.where(in_office: 1, state: legislator.state, title: "Sen").count
      # @sen1 = @sen.order('count_in_office desc')
      @rep = Legislator.where(in_office: 1, state: legislator.state, title: "Rep").count
      i = "#{legislator.state}:  #{@sen} Senators, #{@rep} Representative(s)"
      array << i.split(" ")
    end


    array.each_with_index do |x, index|

      array[index][3] <=> array[index][3]
    end
    p array

  end


  def total
    @sen = Legislator.where(title: "Sen").count(:in_office)
    @rep = Legislator.where(title: "Rep").count(:in_office)
    puts " Senators: #{@sen}"
    puts " Representatives: #{@rep}"
  end

  def self.delete_out
    sen = Legislator.where(title: "Sen", in_office: 0)
    rep = Legislator.where(title: "Rep", in_office: 0)
    sen1 = Legislator.where(title: "Sen", in_office: 1)
    rep1 = Legislator.where(title: "Rep", in_office: 1)
    Legislator.delete(sen)
    Legislator.delete(rep)

    puts "Senators :#{sen1.count}"
    puts "Representatives :#{rep1.count}"

  end
  # def senator(state)
  #   @sen = Legistator.selet(:in_office).count.where(title: "Sen"  state: state)
  # end

  Queries.delete_out




    #SELECT state count(sen) count(rep)
    #ORDER BY rep






end