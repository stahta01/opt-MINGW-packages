mkdir -p packages/32bit && mkdir -p packages/64bit && \
cd opt-mingw-windows-default-manifest && \
cp opt-mingw-i686-*.pkg.tar.zst ../packages/32bit/ && \
cp opt-mingw-x86_64-*.pkg.tar.zst ../packages/64bit/ && \
cd ../opt-mingw-crt3 && \
cp opt-mingw-i686-*.pkg.tar.zst ../packages/32bit/ && \
cp opt-mingw-x86_64-*.pkg.tar.zst ../packages/64bit/ && \
cd ../opt-mingw-gcc4.6 && \
cp opt-mingw-i686-*.pkg.tar.zst ../packages/32bit/ && \
cp opt-mingw-x86_64-*.pkg.tar.zst ../packages/64bit/
