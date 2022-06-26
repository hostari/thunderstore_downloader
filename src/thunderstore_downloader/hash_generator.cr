require "openssl/hmac"

# HashGenerator returns a string the file's SHA256 hash.
module ThunderstorePackageDownloader
  class HashGenerator
    def initialize
    end

    # returns the SHA256 hash of a given file (file path).
    def generate_hash(path : String)
      file = File.new(path)
      content = open_file(file)
      sha256 = OpenSSL::HMAC.hexdigest(OpenSSL::Algorithm::SHA256, "hostari", content)
      close_file(file)
      sha256
    end

    def open_file(file : File)
      file.gets_to_end
    end

    def close_file(file : File)
      file.close
    end
  end
end
