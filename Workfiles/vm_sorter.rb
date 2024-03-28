require './Workfiles/vm_loader.rb'

class VirtualMachineSorter
    @@arr_vms = VirtualMachineLoader.new.all_vm

    # Сортируем содержимое all_vm по full_price(по полной цене виртуальной машины)
    def self.vmSortPrice 
        @@arr_vms.sort_by {|vm| vm.full_price}
    end

    # Сортируем содержимое all_vm по объёму всех дисков
    def self.vmSortHddVolume(type = nil) 
        if type
            @@arr_vms.select {|vm| vm.hdd_type == type}
                    .sort_by {|vm| vm.hdd_capacity+vm.sum_add_volumes}
        else 
            @@arr_vms.sort_by {|vm| vm.hdd_capacity+vm.sum_add_volumes}
        end
    end

    # Сортируем содержимое all_vm по кол-ву дополнительных дисков
    def self.vmSortVolumeQuantity(type = nil) 
        if type
            @@arr_vms.select {|vm| vm.hdd_type == type}
                     .sort_by {|vm| vm.additional_volumes.size}
        else
            @@arr_vms.sort_by {|vm| vm.additional_volumes.size}
        end
    end

    # Сортируем содержимое all_vm по суммарному объёму дополнительных дисков
    def self.vmSortAdditionalVolume(type = nil) 
        if type
            @@arr_vms.select {|vm| vm.hdd_type == type}
                    .sort_by {|vm| vm.sum_add_volumes}
        else
            @@arr_vms.sort_by {|vm| vm.sum_add_volumes}
        end
    end
end