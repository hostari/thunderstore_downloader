# Downloads and unzips the folder and walks the tree top-down to get the hashes from each file within the directory.

module ThunderstoreDownloader
  class Package
    def self.get_thunderstore_file_hash(host : String, download_url : String, name : String, version_number : String, download_path : String)
      # package_name = `#{name}-#{version_number}`
      # zipped_package = `#{package_name}.zip`

      # process = Process.new(`wget -O #{name}-#{version_number}.zip #{download_url}`, output: Process::Redirect::Pipe)
      # download_package = process.output.gets_to_end
      # process.wait.success?

      # performs unzipping
      # unzip_input = "#{zipped_package} -d #{package_name}"
      # process = Process.new("unzip", [unzip_input], output: Process::Redirect::Pipe)
      # unzipped_folder = process.output.gets_to_end
      # download_package = "#{download_path}/#{unzipped_folder}"
      download_process = Process.new(`wget -O #{name}-#{version_number}.zip #{download_url}`, output: Process::Redirect::Pipe)
      download_package = download_process.output.gets_to_end

      unzip_process = Process.new(`unzip #{name}-#{version_number}.zip -d #{name}-#{version_number}`, output: Process::Redirect::Pipe)
      unzipped_folder = unzip_process.output.gets_to_end

      client = ThunderstoreDownloader::Client.new(host)
      response = client.post("/api/v1/thunderstore_file_hash", unzipped_folder)

      if response.status_code == 200
        # PackageDownloader.new(name, version_number, download_url, download_path).download
        JSON.parse(response.body)
      else
        raise Error.new(response.status_code.to_s)
      end
    end
  end
end
