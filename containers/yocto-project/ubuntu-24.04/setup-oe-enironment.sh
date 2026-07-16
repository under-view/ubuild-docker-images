export DISTRO="$1"

if [[ -z "${DISTRO}" ]]; then
	echo "[x] DISTRO not set"
	exit 1
fi

export OE_TERMINAL="screen -A"

export DL_DIR="${HOME}/downloads"
export SOURCES_DIR="${HOME}/sources"
export BUILD_DIR="${HOME}/build-output"
export SSTATE_DIR="${HOME}/sstate-cache"

core_count=$(nproc)
export PARALLEL_MAKE="-j $((core_count / 2))"
export BB_NUMBER_THREADS=$((core_count / 2))

export BB_ENV_PASSTHROUGH_ADDITIONS="DL_DIR SSTATE_DIR"

for i in /etc/profile.d/*.sh; do
	if [[ -r "$i" ]]; then
		. "$i"
	fi
done
unset i

source "${SOURCES_DIR}/openembedded-core/oe-init-build-env" "${BUILD_DIR}"
