# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }]
#   Character.create(name: 'Luke', movie: movies.first)

Brand.create!(
  name: '生物',
)

Item.create!(
  name: '卵',
  description: 'こんにちは',
  size: 'L',
  status: '新品、未使用',
  charge: 1,
  region: '岐阜県',
  date: 1,
  price: 3000,
  seller_id: 1,
  buyer_id: 2,
  brand_id: 1,
)
