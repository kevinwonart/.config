sudo apt update
sudo apt install git autoconf automake pkg-config libevent-dev libncurses5-dev bison build-essential
sudo apt autoremove
sudo apt clean
git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure && make
sudo make install
cd ..
rm -rf ./tmux


# Define plugins
PLUGINS=(
  "tmux-plugins/tpm"
  "tmux-plugins/tmux-sensible"
  "tmux-plugins/tmux-resurrect"
  "tmux-plugins/tmux-continuum"
)

# Create the plugins directory if it doesn't exist
mkdir -p ~/.tmux/plugins

# Clone TPM if it's not already installed
if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Clone each plugin
for plugin in "${PLUGINS[@]}"; do
  plugin_dir=~/.tmux/plugins/$(basename "$plugin")
  if [ ! -d "$plugin_dir" ]; then
    git clone https://github.com/$plugin.git "$plugin_dir"
  else
    echo "$plugin_dir already exists, skipping."
  fi
done

echo "Plugin installation complete."

