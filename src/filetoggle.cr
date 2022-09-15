require "hydra"
require "file_utils"
require "./filewrapper"
include Hydra

class FileToggle < Application
  def toggle_current_file
    if current_filename
      if current_filename.as(String).starts_with? "[X] "
        file = current_filename.as(String).lchop("[X] ")
        FileUtils.mv(Path.new(ActiveDir, file), Path.new(PassiveDir, file))
      else
        file = current_filename.as(String).lchop("[ ] ")
        FileUtils.mv(Path.new(PassiveDir, file), Path.new(ActiveDir, file))
      end
      update_file_list
    end
  end

  def update_file_list
    list = @elements.by_id("file-list").as(List)
    list.clear

    files = [] of FileWrapper
    Dir.new(ActiveDir).children.each do |entry|
      files << FileWrapper.new(true, entry)
    end
    Dir.new(PassiveDir).children.each do |entry|
      files << FileWrapper.new(false, entry)
    end

    files.sort.each do |file|
      list.add_item(file.to_s)
    end
  end

  private def current_filename
    list = @elements.by_id("file-list").as(List)
    if list.selected
      list.value
    end
  end

  private def update_screen
    super
  end
end
