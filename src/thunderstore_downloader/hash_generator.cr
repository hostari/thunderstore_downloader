# HashGenerator returns a string the file's SHA256 hash.
module ThunderstorePackageDownloader
  class HashGenerator
    def initialize
    end

    # returns the SHA256 hash of a given file (file path).
    def generate_hash(path : String)
      file = File.new(path)
      content = file.gets_to_end
      sha256 = OpenSSL::HMAC.hexdigest(OpenSSL::Algorithm::SHA256, "hostari", content)
      file.close
      pp file.closed?
      sha256
    end
  end
end
