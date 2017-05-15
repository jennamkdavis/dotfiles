if brew ls --versions mdzhang/formulae/dotfiles 2> /dev/null; then
  export DOT_PATH=${DOT_PATH:-$(brew --prefix mdzhang/formulae/dotfiles)}
else
  export DOT_PATH=$HOME/.dotfiles
fi

# load custom executable functions
for function in $DOT_PATH/configs/bash/functions/*; do
  source $function
done

# extra files in bash/configs/pre , bash/configs , and bash/configs/post
# these are loaded first, second, and third, respectively.
_load_settings() {
  _dir="$1"
  if [ -d "$_dir" ]; then
    for config in $_dir/*; do
      case "$config" in
        "$_dir"/pre/*)
          :
          ;;
        "$_dir"/post/*)
          :
          ;;
        *)
          if [ -f $config ]; then
            . $config
          fi
          ;;
      esac
    done
  fi

  if [ -d "$_dir/post" ]; then
    for config in $_dir/post/*; do
      . $config
    done
  fi
}
_load_settings "$DOT_PATH/configs/bash/configs"

# Local config
[[ -f ~/.bashrc.local ]] && source ~/.bashrc.local