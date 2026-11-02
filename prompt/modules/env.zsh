# Context pills — each prints nothing unless relevant, and uses only cheap checks
# (file tests, env vars, a hash lookup). Sets _p_env (concatenated pills).

typeset -gA _p_nodever   # node binary path → version (one `node -v` per binary)

_p_mod_env() {
  _p_env=
  local v
  # python: active venv, else a pyenv .python-version
  if [[ -n $VIRTUAL_ENV ]]; then
    v=${VIRTUAL_ENV:t}; [[ $v == .venv || $v == venv ]] && v=${VIRTUAL_ENV:h:t}
    _p_esc $v; _p_pill ${_P[yellow]} ${_I[python]} $REPLY; _p_env+=$REPLY
  elif [[ -f .python-version ]]; then
    read -r v < .python-version; _p_esc $v
    _p_pill ${_P[yellow]} ${_I[python]} $REPLY; _p_env+=$REPLY
  fi
  # node: only inside a node project
  if [[ -e package.json || -e .nvmrc || -e .node-version || ( -n $_p_root && -e $_p_root/package.json ) ]]; then
    local nb=${commands[node]}
    if [[ -n $nb ]]; then
      [[ -n ${_p_nodever[$nb]} ]] || _p_nodever[$nb]=${$(node -v 2>/dev/null)#v}
      [[ -n ${_p_nodever[$nb]} ]] && { _p_pill ${_P[green]} ${_I[node]} ${_p_nodever[$nb]}; _p_env+=$REPLY }
    fi
  fi
  # databricks profile, if one is selected
  if [[ -n $DATABRICKS_CONFIG_PROFILE ]]; then
    _p_esc $DATABRICKS_CONFIG_PROFILE; _p_pill ${_P[orange]} ${_I[db]} $REPLY; _p_env+=$REPLY
  fi
}
