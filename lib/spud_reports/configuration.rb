module Spud
  module Reports
    include ActiveSupport::Configurable

    config_accessor :temp_option

    self.temp_option = nil
  end
end