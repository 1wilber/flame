require "fileutils"

module Helper
  module_function

  TMP_PATH = File.expand_path("../../tmp", __FILE__)

  def create_tmp_dir
    FileUtils.mkdir_p(TMP_PATH)
    puts "Created #{TMP_PATH}"
  end

  def remove_tmp_dir
    FileUtils.remove_dir(TMP_PATH)
    puts "Removed #{TMP_PATH}"
  end

  def create_dir(path)
    FileUtils.mkdir_p(tmp_path(path))
  end

  def create_file(path)
    FileUtils.touch(tmp_path(path))
  end

  def tmp_path(path = "")
    File.join(TMP_PATH, path)
  end
end
