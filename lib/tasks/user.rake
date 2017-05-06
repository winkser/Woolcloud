namespace :user do

desc "Drop user folder!"
task :drop do
%x{rm -rf #{Rails.root}/public/users/*}
%x{rm -rf #{Rails.root}/public/assets}
%x{rm -rf #{Rails.root}/public/system}
puts "All users folder was delete from (#{Rails.root})"
end


end
