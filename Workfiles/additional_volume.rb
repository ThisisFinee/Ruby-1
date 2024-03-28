require 'csv'

class AdditionalVolumes # Класс с помощью которого мы получаем дополнительные диски для каждой виртуальной машины

    DATA = CSV.read('./data/volumes.csv') # Считываем дополнительные диски считаются они в формате [[id, type, volume]]

    def self.additionalVolumes(id)
        result = []
        DATA.each do |add_vol| 
            if add_vol[0] == id
                result.push([add_vol[1], add_vol[2].to_i]) # в result пушим type и volume, так как id у нас уже есть в вм
            end
        end    
        return result
    end
end