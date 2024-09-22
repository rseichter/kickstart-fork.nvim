#!/usr/bin/env bash
# vim: ts=4 sw=4 noet ft=sh
#
# Erase Neovim cache/state directories.

set -euo pipefail
# shellcheck disable=2155
declare -r BN=$(basename "$0")

function die {
	echo >&2 "$@"
	exit 1
}

function usage {
	die "Usage: $BN {full}"
}

function full {
	echo "#!/bin/sh"
	echo "rm -fr $HOME/.cache/nvim $HOME/.local/{share,state}/mvim"
}

function main {
	[[ $# -ge 1 ]] || usage
	declare -r arg=$1
	shift
	case $arg in
	full)
		"$arg" "$@"
		;;
	*)
		usage
		;;
	esac
}

main "$@"
