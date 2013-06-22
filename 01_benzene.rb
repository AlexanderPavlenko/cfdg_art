require './template.rb'

template = Template.new(:file => './01_benzene.cfdg')
80.times do
  template.render(nil, ['-s 800'] + Template::CFDG_PARAMS)
end
