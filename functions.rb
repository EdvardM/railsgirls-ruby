
# BMI calculation with functions

# Utility functions

def format_bmi_string(template_string, h, w)
  bmi = calculate_bmi(h, w)
  template_string % bmi.round(2)
end

def calculate_bmi(height, weight)
  weight / (height / 100.0)**2
end

HEIGHT = 184

puts format_bmi_string("Old BMI: %s", HEIGHT, 91.0)
puts format_bmi_string("My new BMI: %s", HEIGHT, 88.1)
