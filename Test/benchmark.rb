describe "Meme Benchmark" do
  if ENV["BENCH"] then
    bench_performance_linear "my_algorithm", 0.9999 do |n|
      100.times do
        @obj.my_algorithm(n)
      end
    end
  end
end