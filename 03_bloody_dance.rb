require './template.rb'

@test = false
@one = false

template = Template.new(:file => './03_bloody_dance.cfdgrb')
template.dry_run = true if @test
enumerators = {}
enumerators[:Drop_T] =
  (0..360).step(3)

begin
  while true
    params = enumerators.inject({}) do |a, (k, v)|
      a[k] = v.next
      a
    end
    template.render(params, ['-s800', '-vIUYCZS'] + Template::CFDG_PARAMS)
  end
rescue StopIteration
end

