require 'csv'
require 'byebug'
class SunlightLegislatorsImporter

  # def initialize
  #   @filename = legislators.csv
  # end

  def self.import(filename)
    x=[]
    csv = CSV.new(File.open(filename), :headers => true)
    csv.each do |row|
      row.each do |field, value|
        if field == 'firstname'
          field = 'first_name'
        elsif field == 'lastname'
          field = 'last_name'
        elsif field == 'webform'
          field = 'email'
        elsif field == 'birthdate'
          field = 'birthday'
        end
        x << [field, value]
        # TODO: begin
        #raise NotImplementedError,
        # "TODO: figure out what to do with this row and do it!"
        # row.save
        # TODO: end
      end
      Legislator.create(Hash[x])#first_name: name,

    end
  end
end

# IF YOU WANT TO HAVE THIS FILE RUN ON ITS OWN AND NOT BE IN THE RAKEFILE, UNCOMMENT THE BELOW
# AND RUN THIS FILE FROM THE COMMAND LINE WITH THE PROPER ARGUMENT.
# begin
#   raise ArgumentError, "you must supply a filename argument" unless ARGV.length == 1
#   SunlightLegislatorsImporter.import(ARGV[0])
# rescue ArgumentError => e
#   $stderr.puts "Usage: ruby sunlight_legislators_importer.rb <filename>"
# rescue NotImplementedError => e
#   $stderr.puts "You shouldn't be running this until you've modified it with your implementation!"
# end
