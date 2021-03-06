#!/usr/bin/env sh
# shellcheck disable=SC2039

renv() {
  case "$1" in
    status | s)
      [ -n "${GEM_HOME:-}" ] && echo "GEM_HOME='$GEM_HOME'"
      [ -n "${GEM_PATH:-}" ] && echo "GEM_PATH='$GEM_PATH'"
      echo "PATH='$PATH'" && return
      ;;
    reset | r)
      if [ -z "${RENV_ORIG_PATH:-}" ]; then
        echo ">>>> renv not set. Try: 'renv'"
        return 3
      fi

      if [ -n "${RENV_ORIG_GEM_HOME:-}" ]; then
        GEM_HOME=$RENV_ORIG_GEM_HOME
      else
        unset GEM_HOME
      fi
      if [ -n "${RENV_ORIG_GEM_PATH:-}" ]; then
        GEM_PATH=$RENV_ORIG_GEM_PATH
      else
        unset GEM_PATH
      fi
      if [ -n "${RENV_ORIG_PATH:-}" ]; then
        PATH=$RENV_ORIG_PATH
      fi
      unset RENV_ORIG_GEM_HOME RENV_ORIG_GEM_PATH RENV_ORIG_PATH

      echo "---> renv is reset, GEM_HOME='${GEM_HOME:-"<unset>"}'."
      ;;
    set | "")
      if [ -n "${RENV_ORIG_PATH:-}" ]; then
        echo ">>>> renv is active, GEM_HOME='${GEM_HOME:-}'. Try: 'renv reset'"
        return 9
      fi
      if ! command -v ruby >/dev/null; then
        echo ">>>> 'ruby' program not found in PATH='${PATH:-}', aborting"
        return 10
      fi

      eval "$(
        ruby -rrubygems - <<-'EOF'
	puts "local ruby_engine=#{defined?(RUBY_ENGINE) ? RUBY_ENGINE : 'ruby'}"
	puts "local ruby_version=#{RUBY_VERSION}"
	puts "local gem_path='#{Gem.path.join(':')}'"
	EOF
      )"
      # shellcheck disable=SC2154
      local gem_dir="$PWD/.gem/$ruby_engine/$ruby_version"

      export RENV_ORIG_PATH="$PATH"
      export RENV_ORIG_GEM_HOME="$GEM_HOME"
      export RENV_ORIG_GEM_PATH="$GEM_PATH"

      export PATH="$gem_dir/bin:$PATH"
      export GEM_HOME="$gem_dir"
      # shellcheck disable=SC2154
      export GEM_PATH="$gem_dir:$gem_path"

      echo "---> renv is set, GEM_HOME={$GEM_HOME}"
      ;;
    help | h | --help | -h | *)
      echo "usage: renv [help|reset|set|status]"
      ;;
  esac
}
