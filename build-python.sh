#!/bin/bash -ex
# Download & build swig on the local machine
# works on Linux, OSX, and Windows (Cygwin)
# leaves output in /tmp/prebuilts/install/
# cmake must be installed on Windows

PROJ=python
VER=2.7.10
MSVS=2013

source $(dirname "$0")/build-common.sh build-common.sh

TGZ=Python-$VER.tgz
curl -L https://www.python.org/ftp/python/$VER/$TGZ -o $TGZ
tar xzf $TGZ || cat $TGZ # if this fails, we're probably getting an http error
cd Python-$VER
cp PC/pyconfig.h Include
devenv.com PCbuild/pcbuild.sln /Upgrade
# some projects will fail and that's okay
devenv.com PCbuild/pcbuild.sln /Build Debug /Out log.txt || egrep -c "========== Build: 18 succeeded, 7 failed, 0 up-to-date, 1 skipped ==========" log.txt
devenv.com PCbuild/pcbuild.sln /Build Release /Out log.txt || egrep -c "========== Build: 17 succeeded, 7 failed, 1 up-to-date, 1 skipped ==========" log.txt
devenv.com PCbuild/pcbuild.sln /Build "Release|x64" /Out log.txt || egrep -c "========== Build: 16 succeeded, 7 failed, 2 up-to-date, 1 skipped ==========" log.txt
devenv.com PCbuild/pcbuild.sln /Build "Debug|x64" /Out log.txt || egrep -c "========== Build: 16 succeeded, 7 failed, 2 up-to-date, 1 skipped ==========" log.txt
curl -L http://llvm.org/svn/llvm-project/lldb/trunk/scripts/install_custom_python.py -o install_custom_python.py
python install_custom_python.py --source "$(cygpath -w $RD/Python-$VER)" --dest "$(cygpath -w $INSTALL)" --overwrite --silent

commit_and_push
