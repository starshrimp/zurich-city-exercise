require 'csv'


table = CSV.table('bev_wegzug_jahr_quartier_seit_2014.csv')


p table.headers

selected_columns= table.by_col.values_at(:quarlang, :wegktlang)
selected_columns[0..10].each do |row|
  p row
end