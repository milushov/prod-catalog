speech = <<eos
  I am honored to be with you today at your commencement from one of the finest universities in the world. I never graduated from college. Truth be told, this is the closest I've ever gotten to a college graduation. Today I want to tell you three stories from my life. That's it. No big deal. Just three stories.
  The first story is about connecting the dots.
  I dropped out of Reed College after the first 6 months, but then stayed around as a drop-in for another 18 months or so before I really quit. So why did I drop out?
  It started before I was born. My biological mother was a young, unwed college graduate student, and she decided to put me up for adoption. She felt very strongly that I should be adopted by college graduates, so everything was all set for me to be adopted at birth by a lawyer and his wife. Except that when I popped out they decided at the last minute that they really wanted a girl. So my parents, who were on a waiting list, got a call in the middle of the night asking: "We have an unexpected baby boy; do you want him?" They said: "Of course." My biological mother later found out that my mother had never graduated from college and that my father had never graduated from high school. She refused to sign the final adoption papers. She only relented a few months later when my parents promised that I would someday go to college.
eos

images = ["http://ecx.images-amazon.com/images/I/41ZEpL%2BU-bL._AA160_.jpg", "http://ecx.images-amazon.com/images/I/5126u6Mwp6L._AA160_.jpg", "http://ecx.images-amazon.com/images/I/51d79o6gz0L._AA160_.jpg", "http://ecx.images-amazon.com/images/I/41Vei2caylL._AA160_.jpg", "http://ecx.images-amazon.com/images/I/41p%2B7m1w9eL._AA160_.jpg", "http://ecx.images-amazon.com/images/I/41cJhU2wxkL._AA160_.jpg", "http://ecx.images-amazon.com/images/I/41mcHN%2BIDLL._AA160_.jpg", "http://ecx.images-amazon.com/images/I/51iqsMnrz7L._AA160_.jpg", "http://ecx.images-amazon.com/images/I/41Y3frrAsVL._AA160_.jpg", "http://ecx.images-amazon.com/images/I/51qNiFC-SrL._AA160_.jpg", "http://ecx.images-amazon.com/images/I/51CwuPNg4BL._AA160_.jpg", "http://ecx.images-amazon.com/images/I/31wjOELyfBL._AA160_.jpg"]

Category.destroy_all
Product.destroy_all
Review.destroy_all
User.destroy_all


admin = User.create(is_admin: true, email: 'roma@milushov.ru', password: '12345678')
user = User.create(is_admin: false, email: 'test@test.ru', password: '12345678')


%w[cat1 cat2 cat3].each do |cat_name|
  if cat = Category.create(name: cat_name)
    print 'c'
  else
    print 'f'
  end

  (1..rand(7..12)).each do |i|
    text = speech.split(' ').select{ rand(2).even? }.join(' ')

    if product = cat.products.create(title: "product #{i}", description: text, image: images.sample)
      print 'p'
    else
      print 'f'
    end


    (1..rand(7..12)).each do
      text = speech.split(' ').select{ rand(2).even? }.join(' ')
      if product.reviews.create(user: [admin, user].sample, msg: text)
        print 'r'
      else
        'f'
      end

    end

    puts "\n"
  end

  puts "\n\n"
end
