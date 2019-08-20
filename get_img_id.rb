arr = []

folder = "/home/yann/Downloads/ski on rails pictures/vrais skis/"

images = Dir.entries(folder).reject { |f| File.directory?(f) }
# folder.each do |file|
#     # do something
#     ap file
# end

images.each_with_index do |img, i|
  ap i
  path = folder + img
  res = Cloudinary::Uploader.upload(path)
  arr << res["public_id"]
end

p arr
