require "#{Rails.root}/lib/poker_game/table"

namespace :poker_game do
  desc 'Create new poker table'
  task :create_table, [:name, :small_blind, :big_blind] => [:environment] do |_unknown, args|
    table = PokerGame::Table.new(args[:name], args[:small_blind], args[:big_blind])
    result = table.persist
    puts "Table '#{table.name}' creation #{result ? 'succeed' : 'failed'}"
  end

  desc 'List all tables'
  task list_tables: [:environment] do
    puts PokerGame.all_tables
  end
end
