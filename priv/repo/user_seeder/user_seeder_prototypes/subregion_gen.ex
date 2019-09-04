defmodule Loop do

    @subregions ["Aguascalientes","Baja California","Baja California Sur","Campeche","Chiapas","Chihuahua","Coahuila","Colima","Federal District","Durango","Guanajuato","Guerrero","Hidalgo","Jalisco","Mexico","Morelos","Nayarit","Oaxaca","Puebla","Quintana Roo","Sinaloa","Sonora","Tabasco","Tamaulipas","Veracruz","Zacatecas","Avon","Bedfordshire","Berkshire","Borders","Bristol","Buckinghamshire","Cambridgeshire","Channel Islands","Cheshire","Cleveland","Cornwall","Cumbria","Derbyshire","Devon","Dorset","Durham","East Riding of Yorkshire","East Sussex","Essex","Gloucestershire","Greater Manchester","Hampshire","Herefordshire","Hertfordshire","Humberside","Isle of Man","Isle of Wight","Isles of Scilly","Kent","Lancashire","Leicestershire","Lincolnshire","London","Merseyside","Middlesex","Norfolk","North Yorkshire","Northamptonshire","Northumberland","Nottinghamshire","Oxfordshire","Rutland","Shropshire","Somerset","South Yorkshire","Chachapoyas","Bagua","Condorcanqui","Luya","Utcubamba","Huaraz","Aija","Antonio Raymondi","Bolognesi","Carhuaz","Carlos Fermín Fitzcarrald","Casma","Corongo","Huari","Huarmey","Huaylas","Mariscal Luzuriaga","Ocros","Pallasca","Pomabamba","Recuay","Yungay","Abancay","Antabamba","Aymaraes","Cotabambas","Chincheros","Grau","Arequipa","Castilla","Caylloma","Condesuyos","Islay","Huamanga","Cangallo","Huanta","La Mar","Lucanas","Parinacochas","Sucre","Cajamarca","Cajabamba","Chota","Cutervo","San Ignacio","San Marcos","San Miguel","San Pablo","Santa Cruz","Callao","Cusco","Acomayo","Anta","Calca","Canas","Canchis","Chumbivilcas","Espinar","Paruro","Paucartambo","Quispicanchi","Urubamba","Huancavelica","Acobamba","Angaraes","Castrovirreyna","Churcampa","Tayacaja","Ambo","Dos de Mayo","Huacaybamba","Leoncio Prado","Pachitea","Puerto Inca","Lauricocha","Yarowilca","Ica","Chincha","Nazca","Palpa","Pisco","Huancayo","Chanchamayo","Jauja","Satipo","Tarma","Yauli","Chupaca","Trujillo","Ascope","Otuzco","Lima","Huaura","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Maine","Maryland","Massachusetts","Michigan","Minnesota","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma","Oregon","Pennsylvania","South Dakota","Texas","Utah","Vermont","Virginia","Washington","Wisconsin","Wyoming"]

    def insert_subregion(n,n_global,n_stop) do
        subregion = Enum.at(@subregions, n)
        IO.puts subregion
        if n_global == n_stop do
            exit(:shutdown)
        end
        # 0..203 = 204, the number of countries, subregions, and cities
        # given that when seeded, there will be a relatively even number
        # of users with the same country, subregion, and city
        # but that they will be spread throughout the database every 204th user_id
        if n == 203 do
            insert_subregion(0,n_global+1,n_stop)
        end
        insert_subregion(n+1,n_global+1,n_stop)
    end
end
Loop.insert_subregion(0,0,10)