# File Hash returns an object containing the file name(path) and its SHA256 hash.
module ThunderstoreDownloader
  class FileHash
    def initialize(@path : String)
    end

    # returns an object that contains the a list of files in the servers and their respectives SHA256 hashes.
    def get_file_hash
      file_hash = {} of String => String
      hash_generator = HashGenerator.new

      file_paths = build_path

      # maps the path of the file to their respective hashes
      file_paths.map { |file_path| file_hash[file_path] = hash_generator.generate_hash(file_path) }
      file_hash
    end

    # builds the path from the top-most folders of the tree to the innermost folders. after the folder path is built, it checks the files inside a directory and appends the name of the
    # file to the directory path to return a complete file path.
    def build_path
      server_folders = [] of String
      pathbuilder = PathBuilder.new

      pathbuilder.walk(@path) { |folder| server_folders.push(folder) }

      file_paths = [] of String
      server_folders.each do |folder|
        # gets the both files and folders within a folder
        entries = Dir.entries(folder)
        entries.each do |entry|
          entry

          # appends name of the file to complete the folder path
          file_path = "#{folder}/#{entry}"

          # filters non-files
          if File.file?(file_path)
            # collates the complete file paths into an array
            file_paths.push(file_path)
          end
        end
      end
      file_paths
    end
  end
end
