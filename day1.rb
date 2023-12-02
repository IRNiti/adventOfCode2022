input_file_name = 'day1_input.txt'

sum_part1 = 0
sum_part2 = 0

# Part 1
File.foreach( input_file_name ) do |line|
  matched_numbers = line.gsub(/[^0-9]/, '')
  calibration_value = matched_numbers.to_s.split('')[0] + matched_numbers.to_s.split('')[-1]
  sum_part1 = sum_part1 + calibration_value.to_i
end

conversion_map = {
  'one' => 1,
  'two' => 2,
  'three' => 3,
  'four' => 4,
  'five' => 5,
  'six' => 6,
  'seven' => 7,
  'eight' => 8,
  'nine' => 9
}

# Part 2
File.foreach( input_file_name ) do |line|
  matched_numbers = line.scan(/(?=(#{conversion_map.keys.join('|')}|[0-9]))/)
  calibration_value = matched_numbers.flatten.values_at(0, -1).each{|number| number.gsub!(/#{conversion_map.keys.join('|')}/, conversion_map)}.join('')
  sum_part2 = sum_part2 + calibration_value.to_i
end

puts sum_part2
