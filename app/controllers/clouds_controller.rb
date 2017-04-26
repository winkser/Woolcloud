require 'fileutils'

class CloudsController < ApplicationController
before_action :authenticate_user!

  def cloud
  if current_user[:path].nil? then
  current_user[:path] = ""
  current_user.save
  end  
  @file_path = "#{Rails.root}/public/users/#{current_user[:email]}#{current_user[:path]}"  
  @position = "#{current_user[:email]}#{current_user[:path]}"
  @list = Dir.entries("#{Rails.root}/public/users/#{current_user[:email]}#{current_user[:path]}")-['..','.']
  render template: 'pages/cloud.html.erb'  
  end

  def upload
   if !params[:upfile].nil? then
   uploaded_io = params.require(:upfile)
   @file_path = "#{Rails.root}/public/users/#{current_user[:email]}#{current_user[:path]}/#{no_space(uploaded_io.original_filename)}"
    File.open(@file_path, 'wb') do |file|
      file.write(uploaded_io.read)
    end
   end
    redirect_to action: :cloud
  end

  def open
  @file_path = "#{Rails.root}/public/users/#{current_user[:email]}#{current_user[:path]}"
  @user = User.find_by_email(current_user[:email])
    if File.directory?(@file_path + "/" + params[:id]) then
    @user.path = @user.path + "/" + params[:id]
    @user.save
    redirect_to action: :cloud
    else  
    send_file(@file_path + "/" + params[:id])
    end
  end

  def close
  end

  def home
  @user = User.find_by_email(current_user[:email])
  @user.path = ""
  @user.save
    redirect_to action: :cloud  
  end

  def back
  trace = current_user[:path].split("/")
  trace.delete_at(-1)
  @user = User.find_by_email(current_user[:email])
  @user.path = trace.join("/")
  @user.save
    redirect_to action: :cloud  
  end

  def newfolder
   if !params[:namefolder].strip.empty? then
  @root = "#{Rails.root}/public/users/#{current_user[:email]}"
  @namefolder = no_space(params.require(:namefolder)) 
  @position = "#{current_user[:path]}"
  Dir.mkdir(@root+@position + "/" + @namefolder)
   end
    redirect_to action: :cloud  
  end

  def delete
  @root = "#{Rails.root}/public/users/#{current_user[:email]}"
  @user = User.find_by_email(current_user[:email])
  @kill_him = @root + @user.path + "/" + params[:id]
  FileUtils.rm_r(@kill_him)
    redirect_to action: :cloud
  end

  def no_space(a)
   i=-1
    while (a[i] == " ") do
     i-=1
    end
    b = a[0..i]
    b.strip!
    b.gsub!(" ","_")
    return b
  end

end
