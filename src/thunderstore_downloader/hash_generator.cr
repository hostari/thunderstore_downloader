# HashGenerator returns a string the file's SHA256 hash.
module ThunderstorePackageDownloader
  class HashGenerator
    def initialize
    end

    # returns the SHA256 hash of a given file (file path).
    def generate_hash(path : String)
      file = read_and_close_file(path)
      OpenSSL::HMAC.hexdigest(OpenSSL::Algorithm::SHA256, "hostari", file)
    end

    def read_and_close_file(path : String)
      file = File.new(path)
      content = file.gets_to_end
      file.close
    end
  end
end
