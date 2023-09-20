python clean_dump_file.py cvs2git-tmp/git-dump.dat > cvs2git-tmp/git-dump-clean.dat

mkdir ASP
cd ASP
git init

git fast-import --export-marks=../cvs2git-tmp/git-marks.dat < ../cvs2git-tmp/git-blob.dat
#git fast-import --import-marks=../cvs2git-tmp/git-marks.dat < ../cvs2git-tmp/git-dump.dat
git fast-import --import-marks=../cvs2git-tmp/git-marks.dat < ../cvs2git-tmp/git-dump-clean.dat

git checkout master
git reset --hard
git branch -m main
