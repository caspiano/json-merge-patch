require "json"

module JSON
  struct Any
    # Exposes use as `JSON::Any::MergePatch.merge`
    alias MergePatch = RFC7396
  end

  module RFC7396
    # Adheres to JSON Merge Patch [RFC7396](https://www.rfc-editor.org/rfc/rfc7396.html)
    def self.merge(left : ::JSON::Any, right : ::JSON::Any, & : (String, JSON::Any) -> JSON::Any?)
      if (left_hash = left.raw).is_a?(Hash(String, Any)) && (right_hash = right.raw).is_a?(Hash(String, Any))
        left_hash = left_hash.clone
        right_hash.each do |right_key, right_value|
          right_value = yield(right_key, right_value.clone)

          if right_value.nil? || right_value.raw.nil?
            left_hash.delete(right_key)
          else
            left_hash[right_key] = left_hash[right_key]?.try { |left_value| merge(left_value, right_value) } || right_value
          end
        end

        JSON::Any.new(left_hash)
      else
        right.dup
      end
    end

    # :ditto:
    def self.merge(left : ::JSON::Any, right : ::JSON::Any)
      merge(left, right) { |_key, value| value }
    end
  end
end
