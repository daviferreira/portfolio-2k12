module ProjectsHelper

  def tags_as_links(tags)
    links = ""
    tags = tags.split(",")
    tags.each do |t|
      links += link_to "##{t}", "/projects/tag/" + nice_slug(t)
    end
    raw(links)
  end
  
  def strip_url(url)
    url = url.slice(7..-1).sub('www.', '')
    if url.length > 33
      url = url.slice(0..33) + "..."
    end
    url
  end

  def nice_slug(str)

  		accents = { 
  		  ['á','à','â','ä','ã'] => 'a',
  		  ['Ã','Ä','Â','À','�?'] => 'A',
  		  ['é','è','ê','ë'] => 'e',
  		  ['Ë','É','È','Ê'] => 'E',
  		  ['í','ì','î','ï'] => 'i',
  		  ['�?','Î','Ì','�?'] => 'I',
  		  ['ó','ò','ô','ö','õ'] => 'o',
  		  ['Õ','Ö','Ô','Ò','Ó'] => 'O',
  		  ['ú','ù','û','ü'] => 'u',
  		  ['Ú','Û','Ù','Ü'] => 'U',
  		  ['ç'] => 'c', ['Ç'] => 'C',
  		  ['ñ'] => 'n', ['Ñ'] => 'N'
  		  }
  		accents.each do |ac,rep|
  		  ac.each do |s|
  			str = str.gsub(s, rep)
  		  end
  		end
  		str = str.gsub(/[^a-zA-Z0-9 ]/,"")

  		str = str.gsub(/[ ]+/," ")

  		str = str.gsub(/ /,"-")

  	end

end
