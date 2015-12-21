require_relative '../config'

class CreateLegislators  < ActiveRecord::Migration
  def change
    create_table :legislators do |t|
      t.string :title
      t.string :first_name
      t.string :middlename
      t.string :last_name
      t.string :name_suffix
      t.string :nickname
      t.string :party
      t.string :state
      t.integer :district
      t.integer :in_office
      t.string :gender
      t.string :phone
      t.integer :fax
      t.string :website
      t.string :email
      t.string :congress_office
      t.string :bioguide_id
      t.integer :votesmart_id
      t.string :fec_id
      t.integer :govtrack_id
      t.integer :crp_id
      t.string :twitter_id
      t.string :congresspedia_url
      t.string :youtube_url
      t.string :facebook_id
      t.string :official_rss
      t.string :senate_class
      t.date :birthday
    end
  end
end








