class NilClass
  def [](* args)
    nil
  end

  def length
    nil
  end
end

class Hash
  def except(*keys)
    dup.except!(*keys)
  end
  def except!(*keys)
    keys.each { |key| delete(key) }
    self
  end
  def map_values!(&block)
    keys.each do |key|
      value = self[key]
      self[key] = yield(value)
    end
    self
  end

  def map_values(&block)
    dup.map_values!(&block)
  end
end

class String

  def sanitize
    self.gsub(/(<.*?>)/, '')
  end

  def nl2br
    self.sanitize.gsub(/\n/, '<br />').html_safe
  end

  def to_slug
    #strip the string
    ret = self.strip

    #blow away apostrophes
    ret.gsub! /['`]/,""

    # @ --> at, and & --> and
    ret.gsub! /\s*@\s*/, " at "
    ret.gsub! /\s*&\s*/, " and "

    #replace all non alphanumeric, underscore or periods with underscore
    ret.gsub! /\s*[^A-Za-z0-9\.\-]\s*/, '_'

    #convert double underscores to single
    ret.gsub! /_+/,"_"

    #strip off leading/trailing underscore
    ret.gsub! /\A[_\.]+|[_\.]+\z/,""

    ret
  end

  def is_json?(json)
    JSON.parse(json)
    true
  rescue
    false
  end

  def is_number?
    true if Float(self) rescue false
  end

  def to_singleline
    self.gsub(/\n+\s*/m, ' ')
  end

  def to_class
    Kernel.const_get self
  rescue NameError
    nil
  end

  def is_a_defined_class?
    true if self.to_class
  rescue NameError
    false
  end

  def first(n)
    till = n - 1
    self[0..till]
  end

  def last(n)
    self[-n, n]
  end

  def titleize
    split(/(\W)/).map(&:capitalize).join
  end

  def underscore
    self.gsub(/::/, '/').
        gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2').
        gsub(/([a-z\d])([A-Z])/, '\1_\2').
        tr("-", "_").
        downcase
  end

end

