class Kramdown::Converter::Deck < Kramdown::Converter::Html
  def convert(el, indent = -@indent)
    @encoding = el.options[:encoding]
    i=0
    el.children.slice_before{ |e| e.type == :header && e.options[:level] <= 2 }.inject(""){ |r, b| r << %Q!<section class="slide" id="#{i+=1}">#{convert_slide(b)}</section>\n! }
  end

  def convert_slide(elements)
    root = Kramdown::Element.new(:root, :encoding => @encoding)
    root.children = elements
    send(DISPATCHER[root.type], root, -@indent)
  end
end
