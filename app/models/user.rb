# There's 2 ways to make this custom validator work,
# 1. move validator to the top of codes.(move forward)
# 2. create a custom_validator.rb in models folder.
#
#
# class BeginWithRubyValidator < ActiveModel::EachValidator
#   def validate_each(record, attribute, value)
#     unless value.starts_with? 'Ruby'
#       record.errors[attribute] << "必須是 Ruby 開頭辣。"
#     end
#   end
# end

class User < ApplicationRecord
  has_one :store
  # 171217 練習加入自訂驗證器
  # First way to call a validator:
  # validate :name_validator
  #
  # Second way to call a custom validator:
  validates :name, begin_with_ruby: true

  private
  # First form of a validator:
  #
  # def name_validator
  #   unless name.start_with? 'Ruby'
  #     errors[:name] << "必須是 Ruby 開頭喔！"
  #   end
  # end

end
