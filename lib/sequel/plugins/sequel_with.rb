class Array

  def with(*assocs)
    data = self
    res = []
    merge_data = {}
    data.each {|row|
      assocs.each do |assoc|
        if !row.send(assoc).blank?
          merge_data[assoc] = row.send(assoc).values 
        else
          merge_data[assoc] = {}
        end
      end
      res << row.values.merge!(merge_data)
    }
    return res
  end

end
