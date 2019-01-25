class AttrAccessorObject
  def self.my_attr_accessor(*names)
    # ...
    names.each do |name|
      self.class_eval("def #{name};@#{name};end")
      self.class_eval("def #{name}=(val); @#{name} = val; end")
    end
  end
end
