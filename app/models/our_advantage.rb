class OurAdvantage < ActiveRecord::Base
  validates_presence_of :title, :message => 'Enter a Title'
  validates_presence_of :description, :message => 'Enter a Description'
end
