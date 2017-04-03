# Encrypted Pioneers

# The following list contains the names of individuals who are pioneers in the field of computing or that have had a significant influence on the field. However, the names are in an encrypted form, using a very simple (and incredibly weak) form of encryption called rot 13.

# Nqn Ybirynpr
# Tenpr Ubccre
# Nqryr Tbyqfgvar
# Nyna Ghevat
# Puneyrf Onoontr
# Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
# Wbua Ngnanfbss
# Ybvf Unyog
# Pynhqr Funaaba
# Fgrir Wbof
# Ovyy Tngrf
# Gvz Orearef-Yrr
# Fgrir Jbmavnx
# Xbaenq Mhfr
# Wbua Ngnanfbss
# Fve Nagbal Ubner
# Zneiva Zvafxl
# Lhxvuveb Zngfhzbgb
# Unllvz Fybavzfxv
# Tregehqr Oynapu
# Write a program that deciphers and prints each of these names .

# rot13
# first 13 letters of alphabet are mapped to the last 13 and vice versa
# so everything below 'n' is +13 ord
# everything 'n' and above is -13 ord

names = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unyog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Wbua Ngnanfbss',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
]
ORD_DOWN = 96
ORD_UP = 64

def encryptor(names)
  encrypted = names.map { |name| parse(name) }
end

def parse(string)
  string.split.map { |word| encrypt(word) }.join(' ')
end

def encrypt(word)
  word.chars.map { |letter| rot13(letter) }.join
end

def rot13(letter)
  return letter if letter =~ /[^A-Za-z]/
  letter =~ /[A-Z]/ ? ord_adj = ORD_UP : ord_adj = ORD_DOWN
  new_ord = letter.ord - ord_adj > 13 ? letter.ord - 13 : letter.ord + 13
  new_ord.chr
end

puts encryptor(names)

def r13(encrypted_text)
  encrypted_text.each_char.reduce('') do |result, char|
    result + decipher_character(char)
  end
end

def decipher_character(encrypted_char)
  case encrypted_char
  when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
  when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
  else                         encrypted_char
  end
end

names.each do |name|
  puts r13(name)
end