require './Reports/expensive_virtual_machines.rb'
require './Reports/cheap_virtual_machines.rb'
require './Reports/voluminous_virtual_machines.rb'
require './Reports/number_disk_virtual_machines.rb'
require './Reports/volume_disk_virtual_machines.rb'


class ReportPresentation

    def self.Report(n, type = nil)
        puts 'Первый отчёт:'
        ExpensiveVirtualMachines.Report(n)
        puts 'Второй отчёт:'
        CheapVirtualMachines.Report(n)
        puts 'Третий отчёт:'
        VoluminousVirtualMachines.Report(n)
        puts 'Четвёртый отчёт:'
        NumberDiskVirtualMachines.Report(n)
        puts 'Пятый отчёт:'
        VolumeDiskVirtualMachines.Report(n)
    end
end

n = gets.chomp
ReportPresentation.Report(n.to_i)
