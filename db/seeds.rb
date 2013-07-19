require 'faker'

100.times do 
  new_post = Post.create(title: Faker::Company.bs, author: Faker::Name.name, content: Faker::Lorem.paragraphs(3, supplemental = false))
  new_post.tags << Tag.find_or_create_by_name(["bboys", "djs", "equipment", "mcing", "taggers", "steez"].sample)
end
