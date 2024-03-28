require 'csv'

class PriceLoader # класс, собирающий цены памяти и высчитывающий полную цену виртуальной машины
    Data = CSV.read('./data/prices.csv')
    @@hash_data = {}

    Data.each {|info| @@hash_data[:"#{info[0]}"] = info[1].to_i} # сбор всех цен в хеш

    def self.PriceCalculate(combination)
        combination.reduce(0) {|sum, vol_info| sum+@@hash_data[:"#{vol_info[0]}"]*vol_info[1]}
    end
end

#puts PriceLoader.PriceCalculate([["cpu", 16], ["ram", 12], ["sas", 1000]])