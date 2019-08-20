class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  IMG_IDS = ["oqfq05zqijac0gidglyc", "bob8lko3l7oef4uhzktl", "r3dibwsbmjxjlzgvmyrc", "mz15hrv6kx7sfmhhonhp", "b9hcnirwlcjaiynd22rz", "ty0c2tytohubnasjpkyk", "kanbcp3t5xhuoavewhje", "ra38bdz8i54w0ed75lby", "qcni4qvcp5qcuokpbaco", "grzempwzgadgyhrgdku0", "g00guffjjwykwvo0r7xl", "xnmxjmhgzykrzffxfz4m", "oyx63juurtnz4tf0nv2d", "q2hgz7rdgb4qotwirg7k", "sbqs2mvvxoapztq100zh", "hk8eoz3s0bq6zlot0anj", "yfnux2do9kfbyzuraj7b", "ctszbmlbzg3ahpq52vqw", "wrqf8pxts633rhlay1md", "tnehtkr8kjulioqy9nal"]
  def remove!
    return if IMG_IDS.include? file.public_id
    super
  end
end
