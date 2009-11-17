Factory.define(:user) do |record|
  record.email { Faker::Internet.email }
  record.login { Faker::Internet.user_name }
  record.password "spree"
  record.password_confirmation "spree"

  #record.bill_address { Factory(:address) }
  #record.ship_address { Factory(:address) }
end


Factory.define :post do |p|
  p.title   {Faker::Lorem.words(4)}
  p.body  {Faker::Lorem.paragraphs(4)}  
  p.user  { |user| user.association(:user) }
end

Factory.define :post_draft, :parent => :post do |p|
  p.is_active {true}
end


Factory.define :comment do |c|
  c.name   { Faker::Name.name}
  c.email   { Faker::Internet.email }
  c.url        "http://#{Faker::Internet.domain_name}"
  c.post      { |post| post.association(:post) }
  c.body     {  Faker::Lorem.paragraphs(2) }
  c.user_ip   "1.1.1.1"
  c.user_agent "MyAgent"
  c.referrer "referrer"
end


