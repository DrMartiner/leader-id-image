#!/usr/bin/env bash

args=("$@")

case "${1}" in
    "manage")
        shift
        exec python ./${ENTRY_PY_FILE_NAME}.py
        ;;
    "bash")
        shift
        exec bash -c "${args[@]:1}"
        ;;
    *)
        shift
        echo "Unknown command... Use 'run' or 'bash'"
        ;;
esac
