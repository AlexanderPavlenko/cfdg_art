require './template.rb'

@test = false
@one = false

template = Template.new(:file => './02_filaments.cfdgrb')
template.dry_run = true if @test
enumerators = {}
enumerators[:Nerves_Curly] =
  (0..Math::PI).step(0.0131).lazy.map{|x| Math.sin(x) * 18 + 2 }
enumerators[:NerveSegment_ColorOffset] =
  (0..360).step(360.0 / enumerators[:Nerves_Curly].size)

begin
  while true
    params = enumerators.inject({}) do |a, (k, v)|
      a[k] = v.next
      a
    end
    params[:Nerves_Curly] = 20 if @one
    template.render(params, ['-s 800'] + Template::CFDG_PARAMS)
    raise StopIteration if @one
  end
rescue StopIteration
end
