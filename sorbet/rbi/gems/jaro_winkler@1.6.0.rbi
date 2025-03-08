# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `jaro_winkler` gem.
# Please instead update this file by running `bin/tapioca gem jaro_winkler`.


# source://jaro_winkler//lib/jaro_winkler/version.rb#3
module JaroWinkler
  class << self
    def distance(*_arg0); end
    def jaro_distance(*_arg0); end
    def jaro_similarity(*_arg0); end
    def similarity(*_arg0); end
  end
end

class JaroWinkler::Error < ::RuntimeError; end
class JaroWinkler::InvalidWeightError < ::JaroWinkler::Error; end

# source://jaro_winkler//lib/jaro_winkler/version.rb#4
JaroWinkler::VERSION = T.let(T.unsafe(nil), String)
