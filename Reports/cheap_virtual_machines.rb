require './Workfiles/vm_sorter.rb'

class CheapVirtualMachines # Отчет который выводит n самых дешевых ВМ

    def self.Report(n)
        result_arr = VirtualMachineSorter.vmSortPrice
        puts "#{n} самых дешёвых виртуальных машин:"
        n.times do |i|
            puts "id: #{result_arr[i].id}, full_price: #{result_arr[i].full_price}"
        end
    end
end
