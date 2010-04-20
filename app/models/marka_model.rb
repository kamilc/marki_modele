class MarkaModel < ActiveRecord::Base
  has_many :compatibilities
  has_many :products, :through => :compatibilities
  
  named_scope :of_marka, lambda { |marka_name|
    { :conditions => ['marka LIKE ?', marka_name] }
  }
  
  named_scope :of_model, lambda{ |model_name|
    { :conditions => ['model LIKE ?', model_name] }
  }
end
