require 'spud_core'
require 'rghost'
require 'paperclip'
require 'rabl'
module Spud
	module Reports
	  class Engine < ::Rails::Engine
	    engine_name :spud_reports

	    initializer :reports_admin do
	    	Spud::Core.configure do |config|
	    		config.admin_applications += [{:name => "Printers",:thumbnail => "spud/admin/printers_thumb.png",:url => "/spud/admin/printers",:order => 98}]
	    	end
	    	
	    end
	  end
	end
end
