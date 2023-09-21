# Convert ASP repo
python clean_dump_file.py cvs2git-asp-tmp/git-dump.dat > cvs2git-asp-tmp/git-dump-clean.dat

mkdir ASP
cd ASP
git init

git fast-import --export-marks=../cvs2git-asp-tmp/git-marks.dat < ../cvs2git-asp-tmp/git-blob.dat
git fast-import --import-marks=../cvs2git-asp-tmp/git-marks.dat < ../cvs2git-asp-tmp/git-dump-clean.dat

git checkout master
git reset --hard
git branch -m main

# Convert ASP-scons
cd ..
python clean_dump_file.py cvs2git-asp-scons-tmp/git-dump.dat > cvs2git-asp-scons-tmp/git-dump-clean.dat

mkdir ASP-scons
cd ASP-scons
git init

git fast-import --export-marks=../cvs2git-asp-scons-tmp/git-marks.dat < ../cvs2git-asp-scons-tmp/git-blob.dat
git fast-import --import-marks=../cvs2git-asp-scons-tmp/git-marks.dat < ../cvs2git-asp-scons-tmp/git-dump-clean.dat

git checkout master
git reset --hard
git branch -m main
