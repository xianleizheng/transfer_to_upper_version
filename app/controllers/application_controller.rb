class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper




=begin
  def picture_upload(file,email)
    dir_path = "#{Rails.root}/app/assets/images"
    if !File.exist?(dir_path)
      FileUtils.makedirs(dir_path)#文件不存在就创建文件
    end
    file_rename = email.downcase+"#{File.extname(file.original_filename)}"
    file_path = "#{dir_path}/#{file_rename}"
    File.open(file_path,'wb+') do |item| #用二进制对文件进行写入
      item.write(file.read)
    end
    store_path = "#{dir_path}/#{file_rename}"
    return store_path
  end

  def delete_picture(email)
    file_extname_array=[".jpg",".gif",".png",".jpeg"]
    file_extname_array.each do |extname|
      file_path = "#{Rails.root}/app/assets/images/#{email}"+extname
      if File.exist?(file_path)
        File.delete(file_path)
      end
    end
  end
=end
end
