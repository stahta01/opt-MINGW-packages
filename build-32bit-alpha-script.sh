_build_alpha_32bit() {
  pacman -R --noconfirm --cascade opt-mingw-i686-gcc4.5-libs    || true && \
  pacman -R --noconfirm --cascade opt-mingw-i686-gcc4.6-libs    || true && \
  pacman -R --noconfirm --cascade opt-mingw-i686-zlib           || true && \
  pacman -R --noconfirm --cascade opt-mingw-i686-headers2-git   || true && \
  pacman -R --noconfirm --cascade opt-mingw-i686-headers3-git   || true && \
  cd packages && rm -f *.zst && rm -f *.zip && cd ..                    && \
  ./download-gcc4.5-32bit-packages.sh                                   && \
  cd packages && pacman -U *.zst --noconfirm && cd ..                   && \
  ./build-and-install-crt2-32bit-packages.sh                            && \
  ./build-and-install-binutils2.23-32bit-packages.sh                    && \
  ./build-and-install-gcc4.5-32bit-packages.sh                          && \
  ./build-and-install-common-32bit-packages.sh
}

_build_alpha_32bit
