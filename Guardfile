group :jasmine do
  guard :jasmine, :jasmine_url => 'http://localhost:8888/' do
    watch(%r{spec/javascripts/.+_spec.js})
  end
end

group :coffeescripts do
  guard 'coffeescript', :input => 'vendor/assets/javascripts',  :output => 'spec/compiled_js'
  guard 'coffeescript', :input => 'spec/javascripts/coffeescripts',  :output => 'spec/javascripts'
end
