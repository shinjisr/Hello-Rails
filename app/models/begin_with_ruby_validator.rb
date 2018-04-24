class BeginWithRubyValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.starts_with? 'Ruby'
      record.errors[attribute] << "必須是 Ruby 開頭。"
      # The error massage will be like: "Name 必須是 Ruby 開頭。"
    end
  end
end