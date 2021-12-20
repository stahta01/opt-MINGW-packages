_copy_data_to_repo() {
  for _package in "$@"
  do
    local repo="../package_meta_data"
    if [[ -d  "${repo}" && -d "pkg/${_package}" ]]; then
        $(cd pkg/${_package} && tree -nif > ../../${repo}/${_package}.txt)
        $(cd pkg/${_package} && tree -snif > ../../${repo}/${_package}-size.txt)
        $(
          cd pkg &&
          cp ${_package}/.BUILDINFO ../${repo}/${_package}.BUILDINFO
          cp ${_package}/.PKGINFO ../${repo}/${_package}.PKGINFO
        )
    else
      if [ ! -d  "pkg/${_package}" ]; then
        echo "Folder pkg/${_package} does not exist"
      fi
      if [[ ! -d  "${repo}" ]]; then
        echo "Folder ${repo} does not exist"
      fi
    fi
  done
}

cd opt-mingw-windows-default-manifest && \
../install-build-prerequisites.sh && \
export SOURCE_DATE_EPOCH=$(git log -1 --pretty=%ct -- PKGBUILD) && \
MINGW_ARCH="mingw32" makepkg-mingw -Lf --install --noconfirm && \
_copy_data_to_repo opt-mingw-i686-windows-default-manifest && \
cd ../opt-mingw-zlib && \
MINGW_ARCH="mingw32" makepkg-mingw -Lf -C --install --noconfirm && \
_copy_data_to_repo opt-mingw-i686-zlib
