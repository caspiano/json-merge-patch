require "./json-merge-patch"

struct JSON::Any
  include ::JSON::Any::MergePatch

  def merge(other : ::JSON::Any) : ::JSON::Any
    ::JSON::Any::MergePatch.merge(self, other)
  end
end
