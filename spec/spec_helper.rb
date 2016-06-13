$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'julby'

def julia_path
  if ENV['JULIA_DYLIB']
    "#{ENV['JULIA_DYLIB']}/../../"
  else
    nil
  end
end
