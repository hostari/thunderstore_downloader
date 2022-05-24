# Downloads and unzips the folder and walks the tree top-down to get the hashes from each file within the directory.

module ThunderstoreDownloader
  class Package
    def self.get_file_hash(host : String, download_url : String, name : String, version_number : String, download_path : String)
      client = ThunderstoreDownloader::Client.new(host)
      response = client.post("/api/v1/get_file_hash", package: {download_url, name, version_number, download_path})
      if response.status_code == 200
        JSON.parse(response.body)
      else
        raise Error.new(response.status_code.to_s)
      end
    end
  end
end

# how woud the endpoint look like?
