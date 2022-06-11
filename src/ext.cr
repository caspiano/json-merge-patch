require "./json-merge-patch"

struct JSON::Any
  include JSON::RFC7396

  def merge(other : ::JSON::Any) : ::JSON::Any
    self.class.merge(self, other)
  end
end
