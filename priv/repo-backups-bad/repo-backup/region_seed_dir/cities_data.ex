# data = 
  
# File.open("cities.txt", [:read], fn file ->
#   IO.read(file, :line)
#   data = file
#   IO.puts data
#   end)

  data = []
  File.stream!("cities.txt")
  |> Stream.map(() {line}, -> IO.puts "User#{i+1} #{line}" end)
  |> Stream.run
  # |> Data + line

  # IO.read(file, :line)

  # |> CSV.parse_string()
  # |> Enum.map(fn [_, name, price, sku, is_seasonal, image, pack_size, category] ->
  #   is_seasonal = String.to_existing_atom(is_seasonal)
  #   price = Decimal.new(price)

  #   %{
  #     name: name,
  #     price: price,
  #     sku: sku,
  #     is_seasonal: is_seasonal,
  #     image: image,
  #     pack_size: pack_size,
  #     category: category
  #   }
  # end)

# Repo.insert_all("products", data)