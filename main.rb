def decode s

  ans = []

  for i in 0..s.length-1 do
    next if not s[i] =~ /[0-9]/
    c = 'not found'
    for j in i..s.length-1 do
      if s[j] =~ /[mpsz]/ then
        c = s[j]
        break
      end
    end
    if c == 'not found' then
      return []
    end
    ans << s[i] + c
  end

  return ans

end

if ARGV.length != 2 then
  puts "usage: #{$0} 123m456p789s test.gif"
  exit(0)
end

s = ARGV[0]

hs = decode(s)

if hs.length == 0 then
  puts "invalid input."
  exit(0)
end

p hs

cmd = (["convert", "+append"] + hs.map{|h| "gif/#{h}.gif"} + [ARGV[1]]).join(' ')
p cmd
system(cmd)
