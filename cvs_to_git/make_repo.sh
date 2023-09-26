# Convert a CVS repo
set -xe

repo=$1

tmpdir=cvs2git-${repo}-tmp
python clean_dump_file.py ${tmpdir}/git-dump.dat > ${tmpdir}/git-dump-clean.dat

mkdir ${repo}
cd ${repo}
git init

git fast-import --export-marks=../${tmpdir}/git-marks.dat < ../${tmpdir}/git-blob.dat
git fast-import --import-marks=../${tmpdir}/git-marks.dat < ../${tmpdir}/git-dump-clean.dat

git checkout master
git reset --hard
git branch -m main
