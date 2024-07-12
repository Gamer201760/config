show_lanip() {
  local index icon color text module

  index=$1
  icon="$(  get_tmux_option "@catppuccin_lanip_icon"  "󰩟"            )"
  color="$( get_tmux_option "@catppuccin_lanip_color" "$thm_magenta" )"
  text="$(  get_tmux_option "@catppuccin_lanip_text"  "#( $HOME/.config/tmux/plugins/tmux/custom/lanip-handler.sh )" )"

  module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}

