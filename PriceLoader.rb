require 'csv'

class PriceLoader # класс, собирающий цены памяти и высчитывающий полную цену виртуальной машины
    Data = CSV.read('prices.csv')
    @hash_data = {}

    def self.PriceCalculate(combination)
        Data.each do |info| # сбор всех цен в хеш
            @hash_data[:"#{info[0]}"] = info[1].to_i
        end

        result = 0
        combination.each do |vol_info| # проходим массив и выбирая из хеша цену(по типу памяти) умножаем на размер памяти 
            result += @hash_data[:"#{vol_info[0]}"]*vol_info[1] # после чего всё это суммируем в result
        end
        return result
    end
end
