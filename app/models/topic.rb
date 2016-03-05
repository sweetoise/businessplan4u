class Topic < ActiveRecord::Base
  belongs_to :section
  belongs_to :sample_business_plan

  validates_presence_of :sample_business_plan, :on => [:not_import, :update], :message => 'Choose a Business Plan'
  validates_presence_of :section, :on => [:not_import, :update], :message => 'Choose a Section'
  validates_presence_of :title, :message => 'Enter a Title'
  validates_presence_of :number, :message => 'Input a number'
  validates_format_of :number, :with => /\A[+-]?\d.+\Z/, :message => 'Only allows numbers'

  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Topic.create! row.to_hash
    end # end CSV.foreach
  end # end self.import(file)
end
