require "./config"
require "./filetoggle"

# Visual elements
app = FileToggle.setup

file_list = List.new("file-list", {
  :label    => "Files",
  :position => "0:0",
  :height   => Height.to_s,
  :width    => Width.to_s,
})

app.add_element(file_list)

app.bind("ready") do |event_hub, _, _, _|
  app.update_file_list
  event_hub.focus("file-list")
  true
end

# Move down
app.bind("keypress.j") do |event_hub, _, _, _|
  event_hub.trigger("file-list", "select_down")
  true
end
app.bind("keypress.￬") do |event_hub, _, _, _|
  event_hub.trigger("file-list", "select_down")
  true
end

# Move up
app.bind("keypress.k") do |event_hub, _, _, _|
  event_hub.trigger("file-list", "select_up")
  true
end
app.bind("keypress.￭") do |event_hub, _, _, _|
  event_hub.trigger("file-list", "select_up")
  true
end

# Toggle
app.bind("keypress. ") do |_, _, elements, _|
  list = elements.by_id("file-list").as(List)
  idx = list.selected
  app.toggle_current_file
  list.select_item idx
  true
end

# Exit conditions

# Pressing q will quit
app.bind("file-list", "keypress.q", "application", "stop")

app.bind("keypress.ctrl-c", "application", "stop")

app.run
app.teardown
