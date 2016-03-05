class Section < ActiveRecord::Base
  belongs_to :sample_business_plan
  has_many :topics, dependent: :destroy

  #  validates_presence_of :number, :message => 'Please enter a Number', :length => 16
  # validates_presence_of :serial, :message => 'Please enter a Serial', :length => 20
  # validates_format_of (:number and :serial), :with => /\A[+-]?\d+\Z/, :message => 'Only allows numbers'

  validates_presence_of :sample_business_plan, :on => [:not_import, :update], :message => 'Choose a Business Plan'
  validates_presence_of :name, :message => 'Enter a Name'

  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Section.create! row.to_hash
    end # end CSV.foreach
  end # end self.import(file)

end
