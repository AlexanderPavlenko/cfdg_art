require './template.rb'

@test = false
@one = false

template = Template.new(:file => './04_dreamy.cfdgrb')
template.dry_run = true if @test
enumerators = {}
enumerators[:Drop_T] =
  (0..359).step(1.5)

begin
  while true
    params = enumerators.inject({}) do |a, (k, v)|
      a[k] = v.next
      a
    end
    template.render(params, ['-s400', '-vIUYCZS'] + Template::CFDG_PARAMS)
    raise StopIteration if @one
  end
rescue StopIteration
end
