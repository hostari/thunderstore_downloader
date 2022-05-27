# Downloads and unzips the folder and walks the tree top-down to get the hashes from each file within the directory.

module ThunderstoreDownloader
  class Package
    def self.get_thunderstore_file_hash(host : String, download_url : String, name : String, version_number : String, download_path : String)
      download_and_unzip_package = ThunderstoreDownloader::Package.new(name, version_number, download_url).download_and_unzip

      client = ThunderstoreDownloader::Client.new(host)
      response = client.post("/api/v1/thunderstore_file_hash", download_and_unzip_package)

      if response.status_code == 200
        # PackageDownloader.new(name, version_number, download_url, download_path).download
        JSON.parse(response.body)
      else
        raise Error.new(response.status_code.to_s)
      end
    end
  end
end
