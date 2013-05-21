_mrt() {
  local cur prev commands
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"

  commands=" \
  help \
  run \
  create \
  deploy \
  logs \
  update \
  add \
  remove \
  list \
  mongo \
  reset \
  bundle"

  case "${prev}" in
    run)
      local run=" \
      -p \
      --port \
      --production"

      COMPREPLY=($(compgen -W "${run}" -- ${cur}))
      return 0
      ;;

    create)
      local create=" \
      --example \
      --list \
      --branch \
      --tag \
      --ref"

      COMPREPLY=($(compgen -W "${create}" -- ${cur}))
      return 0
      ;;

    deploy)
      local deploy=" \
      -P \
      -D \
      --password \
      --delete \
      --settings \
      --debug"

      COMPREPLY=($(compgen -W "${deploy}" -- ${cur}))
      return 0
      ;;

    update)
      local update=" \
      --release"

      COMPREPLY=($(compgen -W "${update}" -- ${cur}))
      return 0
      ;;

    add)
      local add=" \
      --version"

      COMPREPLY=($(compgen -W "${add}" -- ${cur}))
      return 0
      ;;

    list)
      local list=" \
      --using"

      COMPREPLY=($(compgen -W "${list}" -- ${cur}))
      return 0
      ;;

    mongo)
      local mongo=" \
      -U \
      --url"

      COMPREPLY=($(compgen -W "${mongo}" -- ${cur}))
      return 0
      ;;
  esac

  COMPREPLY=($(compgen -W "${commands}" -- ${cur}))
  return 0
}

complete -F _mrt mrt
