if User.where(username: 'ken').count < 1
  User.create(
    username: 'ken',
    password: 'hogehoge',
    password_confirmation: 'hogehoge',
    admin: true,
    approved: true,
  )
end

if Category.count < 1
  Category.create(
    slug: 'slug1',
    order: 0,
    name_en: '',
    name_ja: '',
    image_url: '',
    desc_en: '',
    desc_ja: '',
  )
end
