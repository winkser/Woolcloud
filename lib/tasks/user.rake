namespace :user do

desc "Drop user folder!"
task :drop do
%x{rm -rf /home/winkser/website/woolcloud/public/users/*}
puts "All users folder was delete!"
end


end
