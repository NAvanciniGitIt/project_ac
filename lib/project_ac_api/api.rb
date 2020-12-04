class Api
    def self.load_villagers
        response = RestClient.get("http://acnhapi.com/v1/villagers/")
        data = JSON.parse(response.body)
        
        data.each do |villager_data|
            Villagers.new(villager_data[1]["name"]["name-USen"], villager_data[1]["birthday"], villager_data[1]["personality"], villager_data[1]["species"], villager_data[1]["catch-phrase"])
            # binding.pry
        end
        Villagers.all
    end
end