_download_packages() {
  local git_tag="GCC4.6_alpha_6"

  wget -nc https://github.com/stahta01/old-MINGW-packages/releases/download/${git_tag}/32bit.zip && \
  wget -nc https://github.com/stahta01/old-MINGW-packages/releases/download/${git_tag}/64bit.zip && \
  7za e 32bit.zip && \
  7za e 64bit.zip && \
  rm -fr 32bit.zip && \
  rm -fr 64bit.zip
}

mkdir -p packages && cd packages && _download_packages
