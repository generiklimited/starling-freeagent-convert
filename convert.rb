#!/usr/bin/env ruby
#
# covert.rb
# Copyright (C) 2018 Mateusz Pawlowski <mateusz@generik.co.uk>
#
# Distributed under terms of the GPLv2 license.
#


# Ruby 2.1.0
require 'csv'
require 'qif'


input_file = ARGV[0]

basefile = File.basename(input_file, ".csv")
bank_input = CSV.read(input_file)

Qif::Writer.open("#{basefile}.qif", type = 'Bank', format = 'dd/mm/yyyy') do |qif|
  bank_input.each do |row|
    # Fix the values depending on what state your CSV data is in
    next if row[0] == "Date"
    next if row[0].nil?
    row.each { |value| value.to_s.gsub!(/^\s+|\s+$/,'') }
    qif << Qif::Transaction.new(
      :amount       => row[4],
      :category     => row[3],
      :memo         => row[2],
      :payee        => row[1],
      :date         => row[0]
    )
  end
end
