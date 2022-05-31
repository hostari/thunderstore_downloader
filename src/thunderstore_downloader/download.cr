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
      user_input = "wget -O `#{@name}-#{@version_number}.zip` `#{@download_url}`"
      download_process = Process.new(`echo`, [user_input], output: Process::Redirect::Pipe)
      #`wget -O "#{@name}-#{@version_number}.zip" "#{@download_url}"`
    end

    def unzip
      #unzip_process = Process.new(`unzip #{@name}-#{@version_number}.zip -d #{@name}-#{@version_number}`)
    end

    def get_thunderstore_file_hash(download_path : String)
      FileHash.new(download_path).get_file_hash
    end
  end
end
