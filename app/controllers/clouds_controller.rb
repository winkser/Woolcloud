require 'fileutils'

class CloudsController < ApplicationController
before_action :authenticate_user!

  def cloud  
  @position = "#{current_user[:email]}#{current_user[:path]}"
  @list = Dir.entries("#{Rails.root}/public/users/#{current_user[:email]}#{current_user[:path]}")-['..','.']
  render template: 'pages/cloud.html.erb'  
  end

  def upload
   uploaded_io = params.require(:upfile)
   @file_path = "#{Rails.root}/public/users/#{current_user[:email]}#{current_user[:path]}/#{uploaded_io.original_filename}"
    File.open(@file_path, 'wb') do |file|
      file.write(uploaded_io.read)
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
  @root = "#{Rails.root}/public/users/#{current_user[:email]}"
  @namefolder = params.require(:namefolder) 
  @position = "#{current_user[:path]}"
  Dir.mkdir(@root+@position + "/" + @namefolder)
    redirect_to action: :cloud  
  end

  def delete
  @root = "#{Rails.root}/public/users/#{current_user[:email]}"
  @user = User.find_by_email(current_user[:email])
  @kill_him = @root + @user.path + "/" + params[:id]
  FileUtils.rm_r(@kill_him)
    redirect_to action: :cloud
  end


end
