require "../spec_helper"

describe ThunderstorePackageDownloader::FileHash do
  describe "#get_file_hash" do
    it "returns an object containing the file path String and its SHA256 hash" do
      path1 = "./spec/test_folder"
      file_hash1 = ThunderstorePackageDownloader::FileHash.new(path1).get_file_hash

      count = file_hash1.to_a.count { |k| k }
      file_hash1.to_a.count { |k| k }.should eq(2)
      typeof(file_hash1).should eq(Hash(String, String))

      # paths = ["./spec/support/mods_multiple/Straw_Hat_Vikings-1.1.0",
      #          "./spec/support/mods_multiple/Straw_Hat_Vikings-1.0.5",
      #          "./spec/support/mods_multiple/Straw_Hat_Vikings-1.0.4",
      #          "./spec/support/mods_multiple/RMTPhoenix-0.9.0",
      #          "./spec/support/mods_multiple/RMTPhoenix-0.9.2",
      #          "./spec/support/mods_multiple/RMTPhoenix-0.9.3",
      #          "./spec/support/mods_multiple/RMTPhoenix-0.9.4",
      #          "./spec/support/mods_multiple/RMTPhoenix-0.9.5",
      #          "./spec/support/mods_multiple/RMTPhoenix-0.9.8",
      #          "./spec/support/mods_multiple/RMTPhoenix-0.9.9",
      #          "./spec/support/mods_multiple/RMTPhoenix-1.0.0",
      #          "./spec/support/mods_multiple/RMTPhoenix-1.0.2",
      #          "./spec/support/mods_multiple/RMTPhoenix-1.0.3",
      #          "./spec/support/mods_multiple/RMTPhoenix-1.0.4",
      #          "./spec/support/mods_multiple/RaistlinMageTower-0.1.5",
      #          "./spec/support/mods_multiple/Phobos-1.1.1",
      #          "./spec/support/mods_multiple/Phobos-1.1.0",
      #          "./spec/support/mods_multiple/Phobos-1.1.0",
      #          "./spec/support/mods_multiple/Phobos-1.1.0",
      #          "./spec/support/mods_multiple/Phobos-1.1.0",
      #          "./spec/support/mods_multiple/Phobos-1.1.0",
      #          "./spec/support/mods_multiple/Farmyard_Animals-0.0.19",
      #          "./spec/support/mods_multiple/Farmyard_Animals-0.0.18",
      #          "./spec/support/mods_multiple/Farmyard_Animals-0.0.17",
      #          "./spec/support/mods_multiple/Farmyard_Animals-0.0.16",
      #          "./spec/support/mods_multiple/Farmyard_Animals-0.0.15",
      #          "./spec/support/mods_multiple/Farmyard_Animals-0.0.14",
      #          "./spec/support/mods_multiple/Farmyard_Animals-0.0.13",
      #          "./spec/support/mods_multiple/Farmyard_Animals-0.0.12",
      #          "./spec/support/mods_multiple/Farmyard_Animals-0.0.11",
      #          "./spec/support/mods_multiple/Farmyard_Animals-0.0.10",
      #          "./spec/support/mods_multiple/Farmyard_Animals-0.0.9",
      #          "./spec/support/mods_multiple/Farmyard_Animals-0.0.8",
      #          "./spec/support/mods_multiple/Farmyard_Animals-0.0.7",
      #          "./spec/support/mods_multiple/Farmyard_Animals-0.0.6",
      #          "./spec/support/mods_multiple/Farmyard_Animals-0.0.5",
      #          "./spec/support/mods_multiple/Farmyard_Animals-0.0.4",
      #          "./spec/support/mods_multiple/Farmyard_Animals-0.0.3",
      #          "./spec/support/mods_multiple/Farmyard_Animals-0.0.2",
      #          "./spec/support/mods_multiple/Farmyard_Animals-0.0.1",
      #          "./spec/support/mods_multiple/Farmyard_Animals-0.0.1copy2",
      #          "./spec/support/mods_multiple/Farmyard_Animals-0.0.1copy1"]

      # paths.each do |path|
      #   file_hash = ThunderstorePackageDownloader::FileHash.new(path).get_file_hash
      #   count = file_hash.to_a.count { |k| k }
      # end
    end
  end
end
