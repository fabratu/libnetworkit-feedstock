@echo on

mkdir "%SRC_DIR%"\build
pushd "%SRC_DIR%"\build

cmake -LAH -G "Ninja" ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" ^
    -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
    -DNETWORKIT_STATIC=ON ^
    -DNETWORKIT_EXT_TLX="%PREFIX%\Library" ^
    ..

if errorlevel 1 exit 1

ninja
if errorlevel 1 exit 1

ninja install
if errorlevel 1 exit 1
