namespace :export do
  desc "Export main models to seed.rb" 
  task :export_to_seeds => :environment do
    Currency.all.each do |balance| 
      excluded_keys = ["created_at", "updated_at", "id"] 
      serialized = balance
        .serializable_hash
        .delete_if{|key,value| excluded_keys.include?(key)} 
      puts "Currency.create(#{serialized})"
    end
    Account.all.each do |balance| 
      excluded_keys = ["created_at", "updated_at", "id"] 
      serialized = balance
        .serializable_hash
        .delete_if{|key,value| excluded_keys.include?(key)} 
      puts "Account.create(#{serialized})"
    end
    Balance.all.each do |balance| 
      excluded_keys = ["created_at", "updated_at", "id", "balance_date"] 
      serialized = balance
        .serializable_hash
        .delete_if{|key,value| excluded_keys.include?(key)} 
      puts "Balance.create(#{serialized})"
    end
    UltimateBenificiaryOwner.all.each do |balance| 
      excluded_keys = ["created_at", "updated_at", "id"] 
      serialized = balance
        .serializable_hash
        .delete_if{|key,value| excluded_keys.include?(key)} 
      puts "UltimateBenificiaryOwner.create(#{serialized})"
    end
    ExchangeRate.all.each do |balance| 
      excluded_keys = ["created_at", "updated_at", "id"] 
      serialized = balance
        .serializable_hash
        .delete_if{|key,value| excluded_keys.include?(key)} 
      puts "ExchangeRate.create(#{serialized})"
    end
  end
end