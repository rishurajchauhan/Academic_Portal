module ApplicationHelper
	# Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "ITSPACE"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
   def markdown(content)

  markdown =Redcarpet::Markdown.new(Redcarpet::Render::XHTML,:hard_wrap => true,:filter_html=>true,:autolink=>true,:no_intra_emphasis=>true)
  markdown.render(content).html_safe

end
end
