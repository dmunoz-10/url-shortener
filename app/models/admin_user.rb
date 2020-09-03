# frozen_string_literal: true

# Admin User Model
class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable,
         :recoverable, :rememberable, :validatable
end
