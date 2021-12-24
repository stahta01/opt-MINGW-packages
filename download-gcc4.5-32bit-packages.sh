_download_packages() {
  local git_tag="GCC4.5_alpha_9"

  wget -nc https://github.com/stahta01/opt-MINGW-packages/releases/download/${git_tag}/32bit.zip && \
  7za e 32bit.zip && \
  rm -fr 32bit.zip
}

mkdir -p packages && cd packages && _download_packages
