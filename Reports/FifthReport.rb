require "./VMLoader.rb"

class NumberDiskVirtualMachines #Отчет который выводит n ВМ у которых подключено больше всего дополнительных дисков (по объему)
                                # (с учетом типа диска если параметр hdd_type указан)

    @@arr_vms = VirtualMachineLoader.new

    def self.Report(n, type = nil)
        result_arr = @@arr_vms.vmSortAdditionalVolume(type).reverse
        puts "#{n} самых наполненных(по объёму) виртуальных машин:"
        n.times do |i|
            puts "id: #{result_arr[i].id}, sum_additional_volume: #{result_arr[i].sum_add_volumes}"
        end
    end

end

NumberDiskVirtualMachines.Report(10)