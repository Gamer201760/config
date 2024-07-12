show_test() {
  local index icon color text module

  index=$1
  icon="$(  get_tmux_option "@catppuccin_test_icon"  ""           )"
  color="$( get_tmux_option "@catppuccin_test_color" "$thm_orange" )"
  text="$(  get_tmux_option "@catppuccin_test_text"  "hello world" )"

  module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}

