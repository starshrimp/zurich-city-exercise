require 'csv'

@table = CSV.table('bev_wegzug_jahr_quartier_seit_2014.csv')

def filter_for_column(column)
  groups = @table.group_by do |row|
    row[column]  # Access the value in the specified column for each row
  end
  count_hash = groups.transform_values do |rows_in_group|
    rows_in_group.count  # Count the number of rows in the group
  end
  sorted_count_hash = count_hash.sort_by { |_key, value| -value }
  sorted_count_hash.first(5).each do |value, count|
    puts "#{value}: #{count}"
  end
end

p "Please enter the desired Continent:"
desired_wegkontinentlang = gets.chomp.to_s
p "Please enter the desired number of people moving:"
desired_anzwezuwir = gets.chomp.to_s
p "Please enter the desired Quartier:"
desired_quarlang = gets.chomp.to_s


filtered_table = @table.select do |row|
  wegkontinentlang_match = desired_wegkontinentlang.empty? || row[:wegkontinentlang] == desired_wegkontinentlang
  anzwezuwir_match = desired_anzwezuwir.empty? || row[:anzwezuwir].to_s == desired_anzwezuwir
  quarlang_match = desired_quarlang.empty? || row[:quarlang] == desired_quarlang

  wegkontinentlang_match && anzwezuwir_match && quarlang_match
end

puts "You entered: " + desired_wegkontinentlang + " " + desired_anzwezuwir + " " + desired_quarlang
puts "The following results were found:"
filtered_table.each_with_index do |row, index|

  p index.to_s + " " + row[:quarlang].to_s + " " + row[:weglandlang].to_s + " " + row[:anzwezuwir].to_s
end

CSV.open('filtered_rows.csv', 'w') do |csv|
  filtered_table.each do |row|
    csv << row
  end
end

print "This are the headers of the table: \n"
@table.headers.each do |header|
  print header.to_s + " "
end
print "\nEnter the column you want to filter by: "
column_to_filter = gets.chomp.to_sym
print "Filtered by #{column_to_filter}: \n"
filter_for_column(column_to_filter)

