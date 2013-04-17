class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title
  validates :title, :description,  :image_url, :price,  presence:true 
  validates :price, numericality: {greater_than_or_equal_to: 0.01, message: 'должен быть больше 0'}
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true , format: {
  	with: %r{\.(jpg|png|gif)$}i,
  	message: ' должен указывать на файлы c форматом  .jpg, .gif, .png'
  }  
end