module ThunderstorePackageDownloader
  class Version
    property name : String
    property version_number : String
    property download_url : String
    property zipped_dir_path : String
    property unzipped_dir_path : String

    # zipped_dir_path is the path where the zipped folder will be saved and will be utilized by wget command
    # unzipped_dir_path is the path there the unzipped folder will be stored and will be utilized by the unzip command and get_file_hash method
    def initialize(@name, @version_number, @download_url, @zipped_dir_path, @unzipped_dir_path)
    end

    def get_thunderstore_file_hash
      `wget -O "#{@zipped_dir_path}#{@name}-#{@version_number}.zip" "#{@download_url}"`
      `unzip "#{@zipped_dir_path}#{@name}-#{@version_number}.zip" -d "#{@unzipped_dir_path}#{@name}-#{@version_number}"`
      FileHash.new("#{@unzipped_dir_path}#{@name}-#{@version_number}").get_file_hash
    end
  end
end
