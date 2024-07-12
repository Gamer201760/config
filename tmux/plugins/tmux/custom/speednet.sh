show_speednet() {
  local index icon color text module

  index=$1
  icon="$(  get_tmux_option "@catppuccin_speednet_icon"  "󰓅"         )"
  color="$( get_tmux_option "@catppuccin_speednet_color" "$thm_blue" )"
  text="$(  get_tmux_option "@catppuccin_speednet_text"  "#( $HOME/.config/tmux/plugins/tmux/custom/speednet-handler.sh )")"

  module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}

