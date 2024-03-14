# frozen_string_literal: true

# Validates credit card number using Luhn Algorithm
module LuhnValidator
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)
    # TODO: use the integers in nums_a to validate its last check digit
    checksum = nums_a[-1]
    payload = nums_a[0..-2].reverse!

    sum = calculator(payload)

    sum.equal?(checksum)
  end

  def calculator(payload)
    sum = 0
    payload.each_with_index do |num, index|
      num *= 2 if index.even?
      num -= 9 if num > 9
      sum += num
    end
    (10 - (sum % 10)) % 10
  end
end
