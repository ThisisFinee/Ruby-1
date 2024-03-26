require "./VMLoader.rb"

class CheapVirtualMachines # Отчет который выводит n самых дешевых ВМ

    @@arr_vms = VirtualMachineLoader.new

    def self.Report(n)
        result_arr = @@arr_vms.vmSortPrice
        puts "#{n} самых дешёвых виртуальных машин:"
        n.times do |i|
            puts "id: #{result_arr[i].id}, full_price: #{result_arr[i].full_price}"
        end
    end
end

CheapVirtualMachines.Report(10)