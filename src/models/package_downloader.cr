class PackageDownloader
  def initialize(name : String, version_number : String, download_url : String)
  end

  # downloads a folder and zips it upon storage
  def download
    package_input = "#{zipped_package} #{@download_url}"
    process = Process.new("wget -O", [package_input], output: Process::Redirect::Pipe)
    process.output.gets_to_end

    `unzip #{zipped_package} -d #{package_name}`
  end

  # appends the version number to the name of the package. this will be used
  # both as a name for the package to be downloaded as a zip file and as the name
  # of the package after unzipping
  def package_name
    `#{@name}-#{@version_number}`
  end

  # compressess/zips a package
  def zipped_package
    `#{package_name}.zip`
  end
end
