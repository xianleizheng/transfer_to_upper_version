class User < ActiveRecord::Base
	has_many :microposts, dependent: :destroy 
	has_many :relationships, foreign_key: "follower_id", dependent: :destroy
	has_many :followed_users, through: :relationships, source: :followed
	has_many :reverse_relationships, foreign_key: "followed_id",class_name: "Relationship",dependent: :destroy
	has_many :followers, through: :reverse_relationships, source: :follower
	before_save { self.email = email.downcase }
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence:true,format:{ with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, length: { minimum: 6 }

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	def feed
			#Micropost.where("user_id = ?", id)
			Micropost.from_users_followed_by(self)
	end

	def following?(other_user)
		self.relationships.find_by(followed_id: other_user.id)
	end
	def follow!(other_user)
		self.relationships.create!(followed_id: other_user.id)
	end
	def unfollow!(other_user)
		self.relationships.find_by(followed_id: other_user.id).destroy
	end




	def User.picture_name_upload(file,email)
		dir_path = "#{Rails.root}/app/assets/images"
		if !File.exist?(dir_path)
			FileUtils.makedirs(dir_path)#文件不存在就创建文件
		end
		file_rename = email.downcase+"#{File.extname(file)}"
		file_path = "#{dir_path}/#{file_rename}"
		File.open(file_path,'wb+').write(file.read)
		store_path = "#{dir_path}/#{file_rename}"
		return store_path



	end

	def User.delete_picture_name(email)
		file_extname_array=[".jpg",".gif",".png",".jpeg"]
		file_extname_array.each do |extname|
			file_path = "#{Rails.root}/app/assets/images/#{email}"+extname
			if File.exist?(file_path)
				File.delete(file_path)
			end
		end
	end

	private
		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end
end

