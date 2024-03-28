require 'csv'
require './Workfiles/virtual_machine.rb'

class VirtualMachineLoader
    attr_reader :all_vm

    DATA = CSV.read('./data/vms.csv').map do |vm| # Считываем всё это в хеш, далее пригодится для заполнения всех виртуальных машин
        Hash[[:id, :cpu, :ram, :hdd_type, :hdd_capacity].zip(vm)]
    end
    
    def initialize
        @all_vm = []
        vmLoader #заполняем @all_vm
    end

    def vmLoader # Функция заполнения массива экземплярами класса VirtualMachine
        @all_vm = []
        DATA.each do |vm|
            new_vm = VirtualMachine.new(vm) # vm - hash
            @all_vm.push(new_vm)
        end
    end

    # def vmSortPrice # Сортируем содержимое all_vm по full_price(по полной цене виртуальной машины)
    #     result = @all_vm.sort_by {|vm| vm.full_price}
    # end

    # def vmSortHddVolume(type = nil) # Сортируем содержимое all_vm по объёму всех дисков
    #     result = @all_vm.select {|vm| type ? vm.hdd_type == type : true}
    #     .sort_by {|vm| vm.hdd_capacity+vm.sum_add_volumes} # я решил не создавать отдельную переменную в классе VirtualMachine, 
    #                                                         #так как нужна она ровно один раз, поэтому здесь просто суммирую объём диска вм и весь дополнительный объём
        
    # end

    # def vmSortVolumeQuantity(type = nil) # Сортируем содержимое all_vm по кол-ву дополнительных дисков
    #     result = @all_vm.select {|vm| type ? vm.hdd_type == type : true}
    #     .sort_by {|vm| vm.additional_volumes.size} # отсортировал по размеру массива, в котором содержаться все дополнительные диски
        
    # end

    # def vmSortAdditionalVolume(type = nil) # Сортируем содержимое all_vm по суммарному объёму дополнительных дисков
    #     result = @all_vm.select {|vm| type ? vm.hdd_type == type : true}
    #     .sort_by {|vm| vm.sum_add_volumes}
    # end
end
