# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
Product.create(title: 'Programing ruby',
	description:
	%{ Здесь идет типо описпнин продукта
		и всякая такаяя х-ня
		 },
    image_url: 'rails.jpg',
    price: 85.69)
