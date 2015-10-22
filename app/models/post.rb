class Post < ActiveRecord::Base
  belongs_to :user
  
       #  This is added to for paperclip gem and imagemagick
has_attached_file :post_img , styles: { post_index: "250x250>", post_show: "450x450>"}, default_url: "/images/:style/missing.png"
validates_attachment_content_type :post_img, content_type: /\Aimage\/.*\Z/

end
