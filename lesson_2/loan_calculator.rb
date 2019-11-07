require 'pry'

def calc_monthly_payment(amount, interest, months)
  (amount.to_f * (interest / (1 - (1 + interest)**(-months)))).round(2)
end

def valid_number?(num)
  num == num.to_i.to_s || num == num.to_f.to_s
end

puts <<-MSG
  Welcome to the loan calculator!
  Answer the following questions to determine your monthly loan payment.
MSG

loan_amt = 0
loop do
  puts "=> What is the loan amount?"
  loan_amt = gets.chomp
  loan_amt.delete!("$") if loan_amt.start_with?("$")

  if valid_number?(loan_amt) && loan_amt.to_i > 0
    break
  else
    puts "=> Enter valid dollar amount."
  end
end

monthly_int_rate = 0
loop do
  puts "=> What is the APR rate?"
  apr = gets.chomp
  apr.delete!("%") if apr.include?("%")

  if valid_number?(apr) && apr.to_f > 0
    monthly_int_rate = (apr.to_f / 12) / 100
    break
  else
    puts "=> Enter valid interest rate."
  end
end

duration_months = 0
loop do
  puts "=> What is the loan duration? (Years)"
  loan_duration_yrs = gets.chomp

  if valid_number?(loan_duration_yrs) && loan_duration_yrs.to_f > 0
    duration_months = loan_duration_yrs.to_i * 12
    break
  else
    puts "=> Enter valid duration in years."
  end
end

payment = calc_monthly_payment(loan_amt, monthly_int_rate, duration_months)
puts "Your monthly payment will be $#{payment}"
