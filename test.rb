def page_content(title)
  File.read("pages/#{title}.txt")
rescue Errno::ENOENT
  return nill
end

puts page_content("TsofaNyule")
