require './Workfiles/vm_sorter.rb'

#Отчет который выводит n ВМ у которых подключено больше всего дополнительных дисков (по количеству) 
                                #(с учетом типа диска если параметр hdd_type указан)
class NumberDiskVirtualMachines 

    def self.Report(n, type = nil)
        result_arr = VirtualMachineSorter.vmSortVolumeQuantity(type).reverse 
        puts "#{n} самых наполненных(по кол-ву дисков) виртуальных машин:"
        n.times do |i|
            puts "id: #{result_arr[i].id}, number_of_additional_disks: #{result_arr[i].additional_volumes.size}"
        end
    end
end