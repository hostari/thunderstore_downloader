# HashGenerator returns a string the file's SHA256 hash.
module ThunderstorePackageDownloader
  class HashGenerator
    def initialize
    end

    # returns the SHA256 hash of a given file (file path).
    def generate_hash(path : String)
      OpenSSL::HMAC.hexdigest(OpenSSL::Algorithm::SHA256, "hostari", File.read(path))
    end
  end
end
