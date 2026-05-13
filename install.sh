#!/usr/bin/env bash
set -euo pipefail

project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
target_dir="${HOME}/.local/bin"
lower_target="${target_dir}/wallpappersek"
upper_target="${target_dir}/Wallpappersek"

mkdir -p "${target_dir}"
install -m 0755 "${project_dir}/scripts/wallpappersek" "${lower_target}"
ln -sf "${lower_target}" "${upper_target}"

printf 'Instalado em %s\n' "${lower_target}"
printf 'Alias instalado em %s\n' "${upper_target}"
printf 'Se o comando nao for encontrado, adicione %s ao PATH.\n' "${target_dir}"
