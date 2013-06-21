cfdg = File.read('./02_rays.cfdg.rb')
(0..Math::PI).step(0.05).each_with_index do |x, i|
  IO.popen("cfdg -s 800 - /tmp/#{'%03i' % i}.png", "r+") do |f|
    parameterized_cfdg = cfdg % {:curl => Math.sin(x) * 22}
    f.puts parameterized_cfdg
    f.close_write
    f.gets
  end
end
