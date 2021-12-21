_download_packages() {
  local git_tag="base_libs_alpha_1"

  wget -nc https://github.com/stahta01/opt-MINGW-packages/releases/download/${git_tag}/base_libs.zip && \
  rm -fr base_libs && \ 
  7za e -obase_libs base_libs.zip && \
  rm base_libs.zip
}

mkdir -p packages && cd packages && _download_packages
