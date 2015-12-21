require 'rspec'
require 'date'
require_relative '../db/config'
describe Legislator, "validations" do

  before(:all) do
    raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless expect(ActiveRecord::Base.connection.table_exists?(:legislators)).to eq(true)
    Legislator.delete_all
  end

  before(:each) do
    @legislator = Legislator.new
    @legislator.assign_attributes(
      :first_name => "Kreay",
      :last_name => "Shawn",
      :birthday => Date.new(1989,9,24),
      :gender => 'female',
      :email => 'kreayshawn@oaklandhiphop.net',
      :phone => '(510) 555-1212 x4567',
      :bioguide_id => 'A000359'
    )
  end



  it "shouldn't accept bioguide_id" do
    @legislator.save #save before data
    @second_legislator = Legislator.new
    @second_legislator.assign_attributes(
      :first_name => "Kreay",
      :last_name => "Shawn",
      :birthday => Date.new(1989,9,24),
      :gender => 'female',
      :email => 'kreayshawn@oaklandhiphop.net',
      :phone => '(510) 555-1212 x4567',
      :bioguide_id => 'A000359'
    ) # create new data for compare
    expect(@second_legislator).to_not be_valid
  end
  #

  it "should accept valid bioguide_id" do
    ["A001358", "A524681", "A485692"].each do |i|
      @legislator = Legislator.new
      @legislator.assign_attributes(
        :first_name => "Kreay",
        :last_name => "Shawn",
        :birthday => Date.new(1989,9,24),
        :gender => 'female',
        :email => Faker::Internet.email,#ue faker generate difference random email)
        :phone => '(510) 555-1212 x4567',
        :bioguide_id => i #put value form top to test format valid to regular expression
      )
      expect(@legislator).to be_valid
    end
  end


  it "shouldn't accept toddlers" do
    @legislator.assign_attributes(:birthday => Date.today - 3.years)
    expect(@legislator).to_not be_valid
  end

  it "shouldn't accept invalid phone numbers" do
    @legislator.assign_attributes(:phone => '347-8901')
    expect(@legislator).to_not be_valid
  end

end