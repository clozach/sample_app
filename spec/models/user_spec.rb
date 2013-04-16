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

require 'spec_helper'

describe User do

	before { @user = User.new(name: "Elbong Gearny", email: "elbong.gearny@ilovelife.com") }

	subject { @user }

	it { should respond_to :email }
	it { should respond_to :name }
	it { should be_valid }

	describe "with no name set" do
		before { @user.name = " " }
		it { should_not be_valid }
	end

	describe "with no email set" do
		before { @user.email = " " }
		it { should_not be_valid }
	end

	describe "with too-long name" do
		before { @user.name = "a" * 51 }
		it { should_not be_valid }
	end

	describe "with invalid email format" do
		it "should be invalid" do
			addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
			addresses.each do |invalid_address|
				@user.email = invalid_address
				@user.should_not be_valid
			end
		end
	end

	describe "with valid email format" do
		it "should be valid" do
			addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
			addresses.each do |valid_address|
				@user.email = valid_address
				@user.should be_valid
			end
		end
	end

	describe "when email address is already taken" do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.email.upcase!
			user_with_same_email.save
		end

		it { should_not be_valid }
	end

	describe "when user is created twice in sequence" do
		it "should only get saved once" do
			email = "foo@bar.com"
			p User.where(email: email).each { |user| user.destroy }
			User.where(email: email).count.should be(0)
			one = User.new(name: "a", email: email)
			two = User.new(name: "b", email: email)
			two.set_secondary one
			two.save
			User.where(email: email).count.should be(1)
		end
	end
end
