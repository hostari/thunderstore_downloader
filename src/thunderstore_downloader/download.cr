module ThunderstoreDownloader
  class Package
    property name : String
    property version_number : String
    property download_url : String
    property download_path : String

    def initialize(@name, @version_number, @download_url, @download_path)
    end

    def download_unzip_get_hash
      download
      unzip
      get_thunderstore_file_hash
    end

    def download
      `wget -O "#{@name}-#{@version_number}.zip" "#{@download_url}"`
    end

    def unzip
      `unzip "#{@name}-#{@version_number}.zip" -d "#{@name}-#{@version_number}"`
    end

    def get_thunderstore_file_hash
      FileHash.new("#{@download_path}#{@name}-#{@version_number}").get_file_hash
    end
  end
end
