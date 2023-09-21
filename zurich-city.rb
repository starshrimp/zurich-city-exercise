require 'csv'



table = CSV.table('bev_wegzug_jahr_quartier_seit_2014.csv')


p table.headers
# p table.class

# selected_columns= table.by_col.values_at(:quarlang, :wegktlang)
# selected_columns[0..10].each do |row|
#   p row
# end

p "Please enter the desired Continent:"
desired_wegkontinentlang = gets.chomp.to_s
p "Please enter the desired number of people moving:"
desired_anzwezuwir = gets.chomp.to_s
p "Please enter the desired Quartier:"
desired_quarlang = gets.chomp.to_s

filtered = {}


filtered_table = table.select do |row|
  wegkontinentlang_match = desired_wegkontinentlang.empty? || row[:wegkontinentlang] == desired_wegkontinentlang
  anzwezuwir_match = desired_anzwezuwir.empty? || row[:anzwezuwir].to_s == desired_anzwezuwir
  quarlang_match = desired_quarlang.empty? || row[:quarlang] == desired_quarlang

  wegkontinentlang_match && anzwezuwir_match && quarlang_match
end


filtered_table.each_with_index do |row, index|
  p index.to_s + " " + row[:quarlang] + " " + row[:weglandlang]
end



p filtered
p "You entered: " + desired_wegkontinentlang + " " + desired_anzwezuwir + " " + desired_quarlang
filter_keys = []
filtered.each do |key, value|
  if value == true
    filter_keys << key
    p value
    p "filter key added"
  end
end

# p filtered 
# filtered_wegkontinentlang = []
# table.select do |row| 
#   filter_keys.each do |key|
#     if row[key] == desired_wegkontinentlang  row[key] == desired_anzwezuwir || row[key] == desired_quarlang
#       filtered_wegkontinentlang << row
#     end
#   end

#   # if desired_wegkontinentlang == row[:wegkontinentlang] && filtered[:desired_wegkontinentlang] == true
#   #   filtered_wegkontinentlang << row
#   # end
#   # if desired_anzwezuwir =! row[:anzwezuwir]
#   #   p "row deleted anzwezuwir"
#   #   filtered_wegkontinentlang.delete(row)
#   # end
#   # if desired_quarlang =! row[:quarlang]
#   #   p "row deleted quarlang"
#   #   filtered_wegkontinentlang.delete(row)
#   # end
# end

filtered_wegkontinentlang.each_with_index do |row, index|
  p index.to_s + " " + row[:quarlang] + " " + row[:weglandlang]
end