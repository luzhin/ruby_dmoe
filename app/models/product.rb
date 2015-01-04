class Product < ActiveRecord::Base
  validates :title, :description, :image_url, presence:true
  validates :price, numericality: {greater_than_or_equal_to:0.01}
  validates :title, uniqueness:true
  validates :title, length: {minimum: 10, message:'Название должно быть не менее 10 символов.'}
  validates :image_url, allow_blank:true, format:{
    with: %r{\.(gif|jpg|png)$}i,
    :multiline => true,
    message:'must be a URL for GIF, JPG or PNG image.'
    #URL должен указывать на изображение формата GIF, JPG или PNG 
  }
end
