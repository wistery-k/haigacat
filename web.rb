require 'sinatra'
require 'RMagick'

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

def convert(hs)
  img = Magick::ImageList.new
  hs.each do |h|
    img << Magick::Image.read("gif/#{h}.gif")[0]
  end
  img.append(false).to_blob
end

get '/' do
"welcomte to haigacat.herokuapp.com! here is a example.<br/><a href='123m456p789s55z'>http://haigacat.herokuapp.com/123m456p789s55z</a>"
end

get '/*' do
  hs = decode(params[:splat][0])
  if hs.length == 0 then
    400
  else
    content_type "image/gif"
    convert(hs)
  end
end
