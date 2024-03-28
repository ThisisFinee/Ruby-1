require './Workfiles/price_loader.rb'
require './Workfiles/additional_volume.rb'

class VirtualMachine #Этот класс содержит всю необходимую информацию об виртуальной машине
    attr_reader :full_price, :additional_volumes, :hdd_type, :hdd_capacity, :sum_add_volumes, :id

    def initialize(vm) # Передаём hash со всеми данными из vms.csv(по id)
        @id = vm[:id]
        @cpu = vm[:cpu].to_i
        @ram = vm[:ram].to_i
        @hdd_type = vm[:hdd_type]
        @hdd_capacity = vm[:hdd_capacity].to_i
        @additional_volumes = additionalVolumes #Массив дополнительных дисков
        @sum_add_volumes = sumAdditionalVolumes #Суммарный объём дополнительных дисков
        @full_price = loadFullPrice #Рассчёт полной цены виртуальной машины(с учётом дополнительных дисков)
        
    end

    private

    def additionalVolumes # Возвращает массив дополнительных дисков
        AdditionalVolumes.additionalVolumes(@id)
    end

    def sumAdditionalVolumes # Возвращает суммарный объём доп дисков
        @additional_volumes.reduce(0) {|sum, vol_info| sum + vol_info[1]}
    end

    def allVolumes # Возвращает массив всех необходимых объёмов
        [["cpu", @cpu], ["ram", @ram], [@hdd_type, @hdd_capacity]] + @additional_volumes
    end

    def loadFullPrice # Возвращает полную цену виртуальной машины
        PriceLoader.PriceCalculate(allVolumes)
    end

end