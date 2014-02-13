class DictionaryReplacer

  def translate(string, dictionary)
    return string if dictionary.empty?

    string.gsub(/\$(\w+)\$/) do
      if dictionary.has_key?($1.to_sym)
        dictionary[$1.to_sym]
      else
        "$#{$1}$"
      end
    end
  end
end
