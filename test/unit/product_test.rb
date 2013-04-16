require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products
  # test "the truth" do
  #   assert true
  # end
  
  test "свойство товара не должно оставаться пустым" do 
  	product = Product.new
  	assert product.invalid?
  	assert product.errors[:title].any?
  	assert product.errors[:description].any?
  	assert product.errors[:price].any?
  	assert product.errors[:image_url].any?
  end

  test "цена товара должеа быть положительной" do
    product = Product.new( title: "sadadd", description: "sdf", image_url: "rails.jpg")
    product.price = -1
    assert product.invalid?
    assert_equal "должна быть больше либо равна 0,01",
    product.errors[:price].join('; ')
    product.price= 0
    assert product.invalid?
    assert_equal "должна быть больше либо равна 0,01",
    product.price= 1
    assert product.valid?
  end

  def new_product(image_url)
    Product.new(title: "sadadd", description: "sdf", price: 1, image_url: image_url)        
  end

  test "image url" do 
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif }
    bad = %w{fred.doc fred.gif/more fred.gif.more }

    ok.each do |name|
      assert new_product(name).valid?, "#{name} не должно быть неприемлимым"
    end

    bad.each do |name|
      assert new_product(name).invalid?, "#{name} не должно быть приемлимым"
    end
  end
  test "product is not valid with out a unique title " do
    # если у товара нет уникального названия, то он недопустим
    product = Product.new(title: products(:ruby).title, description: "УУУ", price: 1, image_url: "fred.gif")
    assert !product.save
    assert_equal "has already been taken", product.errors[:title].join('; ')
    # уже было использовано
  end

end
