require "tempfile"
require "fileutils"
require "digest"

def safe_write(filepath, content)
  dir = File.dirname(filepath)
  FileUtils.mkdir_p(dir) unless Dir.exist?(dir)

  temp_file = Tempfile.new([".tmp_", File.extname(filepath)], dir)
  begin
    temp_file.binmode
    temp_file.write(content)
    temp_file.flush
    temp_file.close

    File.rename(temp_file.path, filepath)
  rescue StandardError
    temp_file.close! if temp_file
    raise
  end
end

def find_duplicate_files(target_dir)
  return {} unless Dir.exist?(target_dir)

  hashes = Hash.new { |h, k| h[k] = [] }
  Dir.glob(File.join(target_dir, "**", "*")).each do |entry|
    next unless File.file?(entry)
    hashes[Digest::SHA256.file(entry).hexdigest] << entry
  end

  hashes.select { |_hash, paths| paths.size > 1 }
end

file_path = File.join(__dir__, "safe_test.txt")
safe_write(file_path, "System configuration payload")

duplicates = find_duplicate_files(__dir__)
duplicates.each do |hash, files|
  puts hash
  files.each { |f| puts "  #{f}" }
end