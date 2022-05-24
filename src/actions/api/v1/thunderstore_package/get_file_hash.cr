class Api::V1::ThunderStoreVersions::DownloadAndExtractHash < ApiAction
  post "/api/v1/get_file_hash" do
    package = PackageDownloader.new(name, version_number, download_url, download_path).download
    package_source_path = FileHash.new("#{download_path}/#{package}").get_file_hash

    head 200
  end
end
