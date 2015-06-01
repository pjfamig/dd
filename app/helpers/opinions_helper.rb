module OpinionsHelper
  def make_inline_spans(opinion)
    # insert parser here to generate array
    opinion = opinion.scan(/[^\.!?]+[\.!?]/).map(&:strip)
    opinion.each_with_index.map do |span, index|
      render(span) + content_tag(:span, 
                      :class => "commentable", :id => index)
    end.join.html_safe
  end
end
