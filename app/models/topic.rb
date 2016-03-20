class Topic < ActiveRecord::Base
  belongs_to :section
  belongs_to :sample_business_plan

  validates_presence_of :section, :on => [:not_import, :update], :message => 'Choose a Section'
  validates_presence_of :number, :message => 'Input a number'
  validates_format_of :number, :with => /\A[+-]?\d.+\Z/, :message => 'Only allows numbers'

  require 'csv'

  def self.import(file, sample_business_plan_id, section_id)
    CSV.foreach(file.path, headers: true) do |row|
      record = Topic.where(sample_business_plan_id: sample_business_plan_id, section_id: section_id, number: row[0], title: row[1]).first_or_create
    end
  end
end
