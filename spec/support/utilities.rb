# Those files are automatically included by RSpec
def full_title(page_title)
  base_title = "Mon epicerie"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end