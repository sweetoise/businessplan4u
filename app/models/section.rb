class Section < ActiveRecord::Base
  belongs_to :sample_business_plan
  has_many :topics, dependent: :destroy
  accepts_nested_attributes_for :sample_business_plan

  #  validates_presence_of :number, :message => 'Please enter a Number', :length => 16
  # validates_presence_of :serial, :message => 'Please enter a Serial', :length => 20
  # validates_format_of (:number and :serial), :with => /\A[+-]?\d+\Z/, :message => 'Only allows numbers'

  validates_presence_of :sample_business_plan, :on => [:not_import, :update], :message => 'Choose a Business Plan'
  validates_presence_of :name, :message => 'Enter a Name'

  require 'csv'

  def self.import(file, sample_business_plan_id)
    CSV.foreach(file.path, headers: true) do |row|
      record = Section.where(sample_business_plan_id: sample_business_plan_id, name: row[0]).first_or_create
    end
  end

end
