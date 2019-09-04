defmodule Loop do
    # len => 143
    @products ["Acerola","Amaranth Leaf","Apple","Apricot","Arrowroot","Artichoke","Arugula","Asparagus","Avocado","Bamboo Shoot","Banana","Beet","Belgian Endive","Bitter Melon","Blackbery","Blackcurrant","Blueberry","Bok Choy","Breadfruit","Broccoli","Broccoli Rabe","Brussel Sprout","Butternut Squash","Cantaloupe","Carambola","Carrot","Cauliflower","Celery","Celery Root","Chayote","Cherimoya","Cherries","Chicory","Clementine","Coconut Meat","Collard","Corn","Cranberries","Crookneck","Cucumber","Custard-Apple","Date","Daikon","Dandelion Greens","Durian","Edamame","Eggplant","Elderberries","Fava Bean","Feijoa","Fennel","Fiddlehead","Figs","Ginger Root","Gooseberry","Grapefruit","Grape","Green Bean","Green Cabbage","Green Pea","Green Pepper","Guava","Honeydew Melon","Horseradish","Jackfruit","Java-Plum","Jicama","Jujube","Kale","Kiwi","Kohlrabi","Kumquat","Leeks","Lemon","Lime","Longan","Loquat","Lychee","Mandarin Orange","Mango","Mangosteen","Mulberry","Mushroom","Mustard Green","Nectarine","Okra","Olive","Onion","Orange","Papaya","Parsnip","Passion Fruit","Peach","Pear","Persimmon","Pineapple","Pitanga","Plantain","Plum","Pomegranate","Prickly Pear","Prune","Pummelo","Pumpkin","Quince","Radicchio","Radish","Raspberry","Red Cabbage","Red Onion","Red Pepper","Red Potato","Rhubarb","Romaine Lettuce","Rose-Apple","Rutabaga","Salsify","Sapodilla","Sapote","Shallot","Snow Pea","Sorrel","Soursop","Spaghetti Squash","Spinach","Strawberry","Sugar-Apple","Sugar Snap Pea","Sweet Potato","Swiss Chard","Tamarind","Tangerine","Tomatillo","Tomato","Turnip","Water Chestnut","Watercress","Watermelon","White Potato","Yam Root","Yellow Potato","Yuca Root","Zucchini"]
    def insert_product(n,n_stop) do
        product_name = Enum.at(@products, n)
        quantity = rem(n,99)
        IO.puts (
        "product_id:   #{n}\n
        quantity:     #{quantity}\n
        product_name: #{product_name}\n
        user_id:      #{n}\n"
        )
        if n == n_stop do
            exit(:shutdown)
        end
        insert_product(n+1,n_stop)
    end
end
Loop.insert_product(0,142)