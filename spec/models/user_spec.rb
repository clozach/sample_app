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

end
