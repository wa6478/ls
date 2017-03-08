p status = ['awake', 'tired'].sample

def whatdo(status)
  if status == 'awake'
    'be productive'
  else
    'go to sleep'
  end
end

todo = whatdo(status)

puts todo