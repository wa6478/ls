# Staggered Caps (Part 2)

# Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.


def staggered_case(string, need_upcase=true, exclude_non_alpha=true)
  result = ''
  string.length.times do |index|
    if exclude_non_alpha && string[index] =~ /[^a-z]/i
      result << string[index]
      next
    end

    need_upcase ? result << string[index].upcase : result << string[index].downcase
    need_upcase = !need_upcase
  end
  result
end

puts staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'