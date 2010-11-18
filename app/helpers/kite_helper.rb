module KiteHelper
  def tag_links(kite)
    kite.tags.collect do |tag|
      link_to(tag.name, kites_by_tag_url(:tag => tag.name))
    end.join
  end
end
