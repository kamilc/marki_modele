# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class MarkiModeleExtension < Spree::Extension
  version "1.0"

  # Please use marki_modele/config/routes.rb instead for extension routes.

  # def self.require_gems(config)
  #   config.gem "gemname-goes-here", :version => '1.2.3'
  # end
  
  def activate

    # Add your extension tab to the admin.
    # Requires that you have defined an admin controller:
    # app/controllers/admin/yourextension_controller
    # and that you mapped your admin in config/routes
    
    Product.class_eval do
      has_many :compatibilities
      has_many :marka_models, :through => :compatibilities
      
      named_scope :of_marka_model, lambda { |marka_model|
        ids = marka_model != nil ? marka_model.products.map { |p| p.id } : []
        { :conditions => [ 'products.id in (?)', ids ] }
      }
    end

    Admin::BaseController.class_eval do
     before_filter :add_marki_models_tab
    
      def add_marki_models_tab
        # add_extension_admin_tab takes an array containing the same arguments expected
        # by the tab helper method:
        #   [ :extension_name, { :label => "Your Extension", :route => "/some/non/standard/route" } ]
        add_extension_admin_tab [ :marka_models ]
        @product_admin_tabs << { :name => t(:marka_models), :url => 'admin_product_compatibilities_url' }
      end
    end

    # make your helper avaliable in all views
    # Spree::BaseController.class_eval do
    #   helper YourHelper
    # end
  end
end
