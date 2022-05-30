module ThunderstoreDownloader
  class Package
    property name : String
    property version_number : String
    property download_url : String

    def initialize(@name, @version_number, @download_url)
    end

    def download_and_unzip
      download
      unzip
    end

    def download
      #download_process = Process.new(`wget -O #{@name}-#{@version_number}.zip #{@download_url}`, output: Process::Redirect::Pipe)
      download_process = Process.new(`wget -O #{@name}-#{@version_number}.zip #{@download_url}`)
      pp download_process.output.gets_to_end
      download_process.output.gets_to_end
    end

    def unzip
      unzip_process = Process.new(`unzip #{@name}-#{@version_number}.zip -d #{@name}-#{@version_number}`)

      unzip_process.output.gets_to_end
    end

    def get_thunderstore_file_hash(download_path : String)
      FileHash.new(download_path).get_file_hash
    end
  end
end
