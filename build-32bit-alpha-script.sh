_build_alpha_32bit() {
  pacman -R --noconfirm --cascade opt-mingw-i686-gcc4.4-libs    || true && \
  pacman -R --noconfirm --cascade opt-mingw-i686-gcc4.5-libs    || true && \
  pacman -R --noconfirm --cascade opt-mingw-i686-gcc4.6-libs    || true && \
  pacman -R --noconfirm --cascade opt-mingw-i686-gcc4.7-libs    || true && \
  pacman -R --noconfirm --cascade opt-mingw-i686-zlib           || true && \
  pacman -R --noconfirm --cascade opt-mingw-i686-headers1-git   || true && \
  pacman -R --noconfirm --cascade opt-mingw-i686-headers2-git   || true && \
  pacman -R --noconfirm --cascade opt-mingw-i686-headers3-git   || true && \
  ./install-build-prerequisites.sh                                      && \
  ./download-base_libs-packages.sh                                      && \
  cd packages/base_libs && pacman -U opt-mingw-i686-*.zst --noconfirm   && \
  cd ../..                                                              && \
  cd packages && rm -f *.zst && rm -f *.zip && cd ..                    && \
  ./download-gcc4.5-32bit-packages.sh                                   && \
  cd packages && pacman -U *.zst --noconfirm && cd ..                   && \
  pacman -R --noconfirm --cascade opt-mingw-i686-gcc4.5-libgfortran || true && \
  pacman -R --noconfirm --cascade opt-mingw-i686-gcc4.5-objc    || true && \
  pacman -S --needed --noconfirm mingw-w64-i686-binutils                && \
  ./build-and-install-crt1-32bit-packages.sh                            && \
  ./build-and-install-binutils2.23-32bit-packages.sh                    && \
  ./build-and-install-gcc4.5-32bit-packages.sh                          && \
  ./build-and-install-common-32bit-packages.sh
}

_build_alpha_32bit
