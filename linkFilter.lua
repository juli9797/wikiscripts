function Link(el)
  el.target = string.gsub(el.target, "%.wiki", ".html")
  return el
end
