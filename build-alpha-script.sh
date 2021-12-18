_build_alpha() {
  pacman -R --noconfirm --cascade opt-mingw-i686-gcc4.5-libs    || true && \
  pacman -R --noconfirm --cascade opt-mingw-x86_64-gcc4.5-libs  || true && \
  pacman -R --noconfirm --cascade opt-mingw-i686-gcc4.6-libs    || true && \
  pacman -R --noconfirm --cascade opt-mingw-x86_64-gcc4.6-libs  || true && \
  pacman -R --noconfirm --cascade opt-mingw-i686-zlib           || true && \
  pacman -R --noconfirm --cascade opt-mingw-x86_64-zlib         || true && \
  pacman -R --noconfirm --cascade opt-mingw-i686-headers2-git   || true && \
  pacman -R --noconfirm --cascade opt-mingw-x86_64-headers2-git || true && \
  pacman -R --noconfirm --cascade opt-mingw-i686-headers3-git   || true && \
  pacman -R --noconfirm --cascade opt-mingw-x86_64-headers3-git || true && \
  cd packages && rm -f *.zst && rm -f *.zip && cd ..                    && \
  ./download-old-gcc4.6-packages.sh                                     && \
  cd packages && pacman -U *.zst --noconfirm && cd ..                   && \
  ./build-and-install-common-packages.sh                                && \
  ./build-and-install-crt3-packages.sh                                  && \
  ./build-and-install-binutils2.23-packages.sh                          && \
  ./build-and-install-gcc4.6-packages.sh                                && \
  ./build-and-install-binutils2.23-packages.sh                          && \
  ./build-and-install-crt2-packages.sh                                  && \
  ./build-and-install-gcc4.6-packages.sh                                && \
  ./build-and-install-gcc4.5-static-packages.sh                         && \
  ./build-and-install-crt2-packages.sh                                  && \
  ./build-and-install-gcc4.5-packages.sh
}

_build_alpha
