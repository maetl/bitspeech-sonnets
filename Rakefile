require_relative "lib/bitspeech_sonnets"

task :generate do
  book = Book.new
  book.generate
end

task :package do
  32.times do
    book = Book.new
    book.generate
  end
  sh "cd output; zip -r -X '../bundle-#{Time.new.to_i}.zip' *"
end
