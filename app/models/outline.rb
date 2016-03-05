class Outline < ActiveRecord::Base
  belongs_to :entrepreneur_program

  validates_presence_of :entrepreneur_program, :on => [:not_import, :update], :message => 'Select Entrepreneurship Programme'
  validates_presence_of :question, :message => 'Enter a Question'

  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Outline.create! row.to_hash
    end # end CSV.foreach
  end # end self.import(file)
end
