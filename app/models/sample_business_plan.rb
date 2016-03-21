class SampleBusinessPlan < ActiveRecord::Base
  has_many :sections, dependent: :destroy
  has_many :topics, :through => :sections
  
  has_attached_file :image,
                    :storage => :dropbox,
                    :dropbox_credentials => "#{Rails.root}/config/dropbox_config.yml",
                    :styles => { :medium => "300x300>", :thumb => "100x300>", :small => "40x50>" },
                    :default_url => "",
                    :dropbox_options => {
                    :path => proc { |style| "#{style}/#{id}_#{image.original_filename}" }
  }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/, :message => 'Invalid Image Format e.g [ image.jpeg/jpg/png ]'

  validates_presence_of :title, :on => [:create, :update], :message => 'Enter a Title'

  require 'csv'


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      business_plan = SampleBusinessPlan.where(title: row.to_hash["title"])
      if business_plan.count == 1
        business_plan.first.update_attributes(row.to_hash)
      else
        SampleBusinessPlan.create!(row.to_hash)
      end # end if !product.nil?
    end # end CSV.foreach
  end # end self.import(file)

end
