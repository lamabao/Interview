require "digest"
class User < ApplicationRecord

  
  def self.encodepassword(str)
       
        str = str.to_s
        str = Digest::MD5.hexdigest(str).to_s
        str[25..28]=""
        str = Digest::MD5.hexdigest(str).to_s
        str[25..28]=""
        str = Digest::MD5.hexdigest(str).to_s
        return str
  end
  def self.getuserid(id)
  		datauser=User.find_by(id: id)
  		return datauser
  end
end