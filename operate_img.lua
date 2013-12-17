local magick = require('magick')
local img = assert(magick.load_image('images/head.jpg'))
local img2 = img:clone()
img2:resize(32)
assert(img:composite(img2, 10, 20))
img:write("images/baijian.jpg")
img2:destroy()
img:destroy()

