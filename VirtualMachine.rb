require 'csv'
require './PriceLoader.rb'
require './AdditionalVolume.rb'

class VirtualMachine #Этот класс содержит всю необходимую информацию об виртуальной машине
    attr_accessor :full_price, :additional_volumes, :hdd_type, :hdd_capacity, :sum_add_volumes, :id

    def initialize(vm) # Передаём hash со всеми данными из vms.csv(по id)
        @id = vm[:id]
        @cpu = vm[:cpu].to_i
        @ram = vm[:ram].to_i
        @hdd_type = vm[:hdd_type]
        @hdd_capacity = vm[:hdd_capacity].to_i
        @additional_volumes = AdditionalVolumes.additionalVolumes(@id) #Массив дополнительных дисков
        @sum_add_volumes = @additional_volumes.reduce(0) {|sum, vol_info| sum + vol_info[1]} #Суммарный объём дополнительных дисков
        @volumes = [["cpu", @cpu], ["ram", @ram], [@hdd_type, @hdd_capacity]] + @additional_volumes #массив всех дисков в виртуальной машине, формат:["тип", размер]
        @full_price = PriceLoader.PriceCalculate(@volumes) #Рассчёт полной цены виртуальной машины(с учётом дополнительных дисков)
        
    end


end
