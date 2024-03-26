require './VMLoader.rb'

class ExpensiveVirtualMachines # Отчет который выводит n самых дорогих ВМ

    @@arr_vms = VirtualMachineLoader.new

    def self.Report(n)
        result_arr = @@arr_vms.vmSortPrice.reverse
        puts "#{n} самых дорогих виртуальных машин:"
        n.times do |i|
            puts "id: #{result_arr[i].id}, full_price: #{result_arr[i].full_price}"
        end
    end
end

ExpensiveVirtualMachines.Report(10)
