namespace :update_pages do
  desc "resave all pages so urls reflect page numbers adequately"
  task resave: :environment do
    Page.find_each(&:save)
  end
end