File.stream!("region_seed_dir/cities.txt") 
|> Stream.map(&String.strip/1)
|> Stream.with_index
|> Stream.map(fn ({line, index}) -> IO.puts "#{index + 1} #{line}" end)
|> Stream.run