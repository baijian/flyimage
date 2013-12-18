local sig, size, path, ext = 
    ngx.var.sig, ngx.var.size, ngx.var.path, ngx.var.ext

local secret = "c4dc782c5c7f6f78ea1b5a7de8cd4100"
local images_dir = "images/"
local cache_dir = "cache/"

local function return_not_found(msg)
    ngx.status = ngx.HTTP_NOT_FOUND
    ngx.header["Content-type"] = "text/html"
    ngx.say(msg or "not found")
    ngx.exit(0)
end

local function calculate_signature(str)
    return ngx.encode_base64(ngx.hmac_sha1(secret, str))
        :gsub("[+/=]", {["+"] = "-", ["/"] = "_", ["="] = ","})
        :sub(1, 12)
end

if calculate_signature(size .. "/" .. path) ~= sig then
--    return_not_found("invalid signature, fuck off!")
    return_not_found(calculate_signature(size .. "/" .. path))
end

local source_fname = images_dir .. path

local file = io.open(source_fname)

if not file then
    return_not_found()
end

file:close()

local dest_fname = cache_dir .. ngx.md5(size .. "/" .. path) .. "." .. ext

local magick = require("magick")
magick.thumb(source_fname, size, dest_fname)
local img = assert(magick.load_image(source_fname))
img:resize(200, 200);
img:sharpen(0.5)
img:write(dest_fname)
img:destroy()

ngx.exec(ngx.var.request_uri)
