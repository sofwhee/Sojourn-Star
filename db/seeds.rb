# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

unless Admin.exists?
  Admin.create!(
    email: 'sofiamsola@outlook.com', 
    password: 'demanga123', 
    password_confirmation: 'demanga123')
end

unless Chapter.exists?
  Chapter.create!(name: "Sample", chapter_number: 1)
end

unless Page.exists?

  sample_page = Page.new(
    created_at: Time.current, 
    updated_at: Time.current, 
    page_number: 1, 
    published_at: Time.current, 
    chapter_id: 1, 
    slug: "1")

  sample_page.page_image.attach(
    io: File.open('app/assets/images/Testercomicpage.png'), 
    filename: 'file.png', 
    content_type: 'image/png')

  sample_page.save!
end