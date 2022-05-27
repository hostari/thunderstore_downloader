# Downloads and unzips the folder and walks the tree top-down to get the hashes from each file within the directory.

module ThunderstoreDownloader
  class Package
    def self.get_thunderstore_file_hash(host : String, download_url : String, name : String, version_number : String, download_path : String)
      package_name = `#{name}-#{version_number}`
      # zipped_package = `#{package_name}.zip`

      download_input = `#{package_name} #{download_url}`
      process = Process.new("wget -O", [download_input], output: Process::Redirect::Pipe)
      download_package = process.output.gets_to_end

      # performs unzipping
      # unzip_input = "#{zipped_package} -d #{package_name}"
      # process = Process.new("unzip", [unzip_input], output: Process::Redirect::Pipe)
      # unzipped_folder = process.output.gets_to_end
      # download_package = "#{download_path}/#{unzipped_folder}"

      client = ThunderstoreDownloader::Client.new(host)
      response = client.post("/api/v1/thunderstore_file_hash", download_package)

      if response.status_code == 200
        # PackageDownloader.new(name, version_number, download_url, download_path).download
        JSON.parse(response.body)
      else
        raise Error.new(response.status_code.to_s)
      end
    end
  end
end
