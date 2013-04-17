# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
	attr_accessible :email, :name

	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }

	before_save do
		self.email.downcase!

		if Rails.env.test?
			begin
				@secondary.save if @secondary
			rescue
			end
		end
	end

	def set_secondary(sec) # Used in testing to trigger a race condition. See Section 6.2.5 Uniqueness caveats
		@secondary = sec
	end
end
