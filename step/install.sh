#!/bin/bash

function __init_step() {
	set -e
	set -u

	####################
	# Install step #
	####################

	# Every package should define these 6 variables
	pkg_cmd_name="step"

	pkg_dst_cmd="$HOME/.local/bin/step"
	pkg_dst="$pkg_dst_cmd"

	pkg_src_cmd="$HOME/.local/opt/step-v$WEBI_VERSION"
	pkg_src_dir="$HOME/.local/opt/step-v$WEBI_VERSION"
	pkg_src="$pkg_src_cmd/bin"

	pkg_install() {
		# $HOME/.local/opt/step-v0.6.5/bin
		mkdir -p "$(dirname $pkg_src_cmd)"

		# mv ./step* "$HOME/.local/opt/step-v0.6.5/bin/step"
		mv ./"$pkg_cmd_name"* "$pkg_src_cmd"

		# chmod a+x "$HOME/.local/opt/step-v0.6.5/bin/"
		chmod a+x "$pkg_src_cmd/bin"
	}

	pkg_get_current_version() {
		# 'step version' has output in this format:
		#       step v0.6.5 (7e6fd17) 2020-10-21T06:26:46Z
		# This trims it down to just the version number:
		#       0.6.5
		echo "$(step --version 2>/dev/null | head -n 1 | cut -d' ' -f2 | sed 's:^v::')"
	}

}

__init_step
