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

./install-build-prerequisites.sh && \
./build-and-install-common-packages.sh && \
cd mingw-w64-crt2 && \
export SOURCE_DATE_EPOCH=$(git log -1 --pretty=%ct -- PKGBUILD) && \
MINGW_ARCH="mingw32" makepkg-mingw -Lf --install --noconfirm && \
_copy_data_to_repo mingw-w64-i686-crt2-git mingw-w64-i686-headers2-git mingw-w64-i686-pthread-stub-headers2-git && \
MINGW_ARCH="mingw64" makepkg-mingw -Lf --install --noconfirm && \
_copy_data_to_repo mingw-w64-x86_64-crt2-git mingw-w64-x86_64-headers2-git mingw-w64-x86_64-pthread-stub-headers2-git
cd ../mingw-w64-gcc4.6 && \
export SOURCE_DATE_EPOCH=$(git log -1 --pretty=%ct -- PKGBUILD) && \
MINGW_ARCH="mingw32" makepkg-mingw -Lf --install --noconfirm && \
_copy_data_to_repo mingw-w64-i686-gcc4.6 mingw-w64-i686-gcc4.6-libs
MINGW_ARCH="mingw64" makepkg-mingw -Lf --install --noconfirm && \
_copy_data_to_repo mingw-w64-x86_64-gcc4.6 mingw-w64-x86_64-gcc4.6-libs && \
cd ../mingw-w64-crt2 && \
export SOURCE_DATE_EPOCH=$(git log -1 --pretty=%ct -- PKGBUILD) && \
MINGW_ARCH="mingw32" makepkg-mingw -Lf --install --noconfirm && \
_copy_data_to_repo mingw-w64-i686-crt2-git mingw-w64-i686-headers2-git mingw-w64-i686-pthread-stub-headers2-git && \
MINGW_ARCH="mingw64" makepkg-mingw -Lf --install --noconfirm && \
_copy_data_to_repo mingw-w64-x86_64-crt2-git mingw-w64-x86_64-headers2-git mingw-w64-x86_64-pthread-stub-headers2-git
