# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

client_1 = Client.create({
                             first_name: 'Vicente',
                             last_name: 'Neto',
                             email: 'sneto.vicente@gmail.com'
                         })
client_2 = Client.create({
                             first_name: 'John',
                             last_name: 'Lennon',
                             email: 'john.lennon@beatles.com'
                         })
client_3 = Client.create({
                             first_name: 'Paul',
                             last_name: 'McCartney',
                             email: 'paul.mccartney@beatles.com'
                         })
client_4 = Client.create({
                             first_name: 'George',
                             last_name: 'Harrison',
                             email: 'george.harrison@beatles.com'
                         })
client_5 = Client.create({
                             first_name: 'Ringo',
                             last_name: 'Starr',
                             email: 'ringo.starr@beatles.com'
                         })

product_1 = Product.create({
                               name: 'ZenFone 3',
                               description: 'O ZenFone 3 tem um projeto requintado, inspirado pela beleza da natureza.',
                               price: 1_187.99})
product_2 = Product.create({
                               name: 'ZenWatch 3',
                               description: 'O ASUS ZenWatch 3 segue a tradição dos relógios com seu design detalhado e luxuoso, feito com materiais de alta qualidade.',
                               price: 1_997.77
                           })
product_3 = Product.create({
                               name: 'ZenBook 3',
                               description: 'O ZenBook foi reinventado para a próxima era da computação móvel.',
                               price: 8_499.99
                           })

purchase_1 = Purchase.create({client: client_1, description: '2 ZenFones 3', total: 2_375.98})
purchase_1_detail = PurchaseDetail.create({product: product_1, purchase: purchase_1, quantity: 2})

purchase_2 = Purchase.create({client: client_2, description: '1 ZenWatch 3 e 1 ZenBook 3', total: 10_497.76})
purchase_2_detail_1 = PurchaseDetail.create({product: product_2, purchase: purchase_2, quantity: 1})
purchase_2_detail_2 = PurchaseDetail.create({product: product_3, purchase: purchase_2, quantity: 1})

purchase_3 = Purchase.create({client: client_3, description: '3 ZenBooks 3', total: 25_499.97})
purchase_3_detail = PurchaseDetail.create({product: product_3, purchase: purchase_3, quantity: 3})
