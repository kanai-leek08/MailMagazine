module ApplicationHelper
  @@markdown = Redcarpet::Markdown.new Redcarpet::Render::HTML,
  autolink: true,
  space_after_headers: true,
  no_intra_emphasis: true,
  fenced_code_blocks: true,
  tables: true,
  hard_wrap: true,
  xhtml: true,
  lax_html_blocks: true,
  strikethrough: true

  def markdown(markdown)
    @@markdown.render(markdown).html_safe
  end

  def continue(str)
    list = str.split("\n")
    if list.count > 30
      list = list[0..30]
      dot = '.<br>'
      list.push(dot, dot, dot, "<h3>続きを読む</h3>").join
    else
      list.join
    end


  end
end
