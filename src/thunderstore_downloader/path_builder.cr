# PathBuilder "walks" the directory top-down to build the path name of nested files

module ThunderstorePackageDownloader
  class PathBuilder
    def initialize
    end

    # Pathbuilder.walk is a recursive method that opens parent directories up to their children(nested files and folders). it appends the names of the folders to the parent directory to give a give an initial path that contains just the succeeding folders nested within the parent directory.

    # eg. if file name "config.txt" is nested within the following directory: home >> servers >> server200 >> BepInEx >> plugins, the directory path would be home/servers/server200/BepInEx/plugins
    # this method does not complete the path up to the filenames within the folder so we need to pass in a block to it that would return an array of nested directories, loop thru each directory, and then get the entries of that directory and append the file name to the parent paths (see file_hash.cr line 26)
    #
    # Example:
    # path_builder = PathBuilder.new
    # path_builder.walk(/home/servers) { |folder| puts folder }
    # => "/home/servers/blah"
    def walk(path = @root, &block : String, Array(String), Array(String) ->)
      directory = Dir.new(path) if path.is_a?(String)
      directory.not_nil!.close                                                                                                                          # returns a new directory object for the named directory
      directory_children, files = directory.not_nil!.children.partition { |content| Dir.exists?(File.join(directory.not_nil!.path, content)) } # returns two arrays, one containing the files and the other containing directories; and builds the complete path for each directory
      block.call(directory.not_nil!.path, directory_children, files)
      directory_children.each do |directory_child_name|
        walk File.join(directory.not_nil!.path, directory_child_name), &block # builds the path name from the root directory to name of the file
      end
    end
  end
end
