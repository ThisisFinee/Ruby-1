require "./VMLoader.rb"

class VoluminousVirtualMachines # Отчет который выводит n самых объемных ВМ по параметру type

    @@arr_vms = VirtualMachineLoader.new

    def self.Report(n, type = nil)
        result_arr = @@arr_vms.vmSortHddVolume(type).reverse
        puts "#{n} самых объёмных виртуальных машин:"
        n.times do |i|
            puts "id: #{result_arr[i].id}, all_volume: #{result_arr[i].hdd_capacity+result_arr[i].sum_add_volumes}"
        end
    end
end

VoluminousVirtualMachines.Report(10)