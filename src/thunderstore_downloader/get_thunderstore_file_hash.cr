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

    # def get_thunderstore_file_hash
    #   `wget -O "#{@zipped_dir_path}#{@name}-#{@version_number}.zip" "#{@download_url}"`
    #   `unzip -o "#{@zipped_dir_path}#{@name}-#{@version_number}.zip" -d "#{@unzipped_dir_path}#{@name}-#{@version_number}"`
    #   FileHash.new("#{@unzipped_dir_path}#{@name}-#{@version_number}").get_file_hash
    # end

    def get_thunderstore_file_hash
      download_command
      unzip_command
      get_file_hash_command
    end

    def delete_files
      `sudo rm -rf #{mod_version_unzipped}`
      `sudo rm -rf #{mod_version_zipped}`
    end

    def download_command
      `wget -O "#{mod_version_zipped}" "#{@download_url}"`
    end

    def unzip_command
      `unzip -o "#{mod_version_zipped}" -d "#{mod_version_unzipped}"`
    end

    def get_file_hash_command
      FileHash.new("#{mod_version_unzipped}").get_file_hash
    end

    def mod_version
      "#{@name}-#{@version_number}"
    end

    def mod_version_unzipped
      "#{@unzipped_dir_path}#{mod_version}"
    end

    def mod_version_zipped
      "#{@zipped_dir_path}#{mod_version}.zip"
    end
  end
end
