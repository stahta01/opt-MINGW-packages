mkdir -p packages/32bit && mkdir -p packages/64bit && \
cd opt-mingw-windows-default-manifest && \
cp opt-mingw-i686-*.pkg.tar.zst ../packages/32bit/ && \
cp opt-mingw-x86_64-*.pkg.tar.zst ../packages/64bit/ && \
cd ../opt-mingw-crt2 && \
cp opt-mingw-i686-*.pkg.tar.zst ../packages/32bit/ && \
cp opt-mingw-x86_64-*.pkg.tar.zst ../packages/64bit/ && \
cd ../opt-mingw-gcc4.5 && \
cp opt-mingw-i686-*.pkg.tar.zst ../packages/32bit/ && \
cp opt-mingw-x86_64-*.pkg.tar.zst ../packages/64bit/ && \
cd ../opt-mingw-bzip2 && \
cp opt-mingw-i686-*.pkg.tar.zst ../packages/32bit/ && \
cp opt-mingw-x86_64-*.pkg.tar.zst ../packages/64bit/ && \
cd ../opt-mingw-zlib && \
cp opt-mingw-i686-*.pkg.tar.zst ../packages/32bit/ && \
cp opt-mingw-x86_64-*.pkg.tar.zst ../packages/64bit/ && \
cd ../opt-mingw-libiconv && \
cp opt-mingw-i686-*libiconv*.pkg.tar.zst ../packages/32bit/ && \
cp opt-mingw-x86_64-*libiconv*.pkg.tar.zst ../packages/64bit/
