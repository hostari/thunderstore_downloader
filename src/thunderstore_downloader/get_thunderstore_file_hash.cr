module ThunderstorePackageDownloader
  class Version
    property name : String
    property version_number : String
    property download_url : String
    property download_path : String

    def initialize(@name, @version_number, @download_url, @download_path)
    end

    def get_thunderstore_file_hash
      `wget -O "#{@name}-#{@version_number}.zip" "#{@download_url}"`
      `unzip "#{@name}-#{@version_number}.zip" -d "#{@name}-#{@version_number}"`
      FileHash.new("#{@download_path}#{@name}-#{@version_number}").get_file_hash
    end
  end
end
