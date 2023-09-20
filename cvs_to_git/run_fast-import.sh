git fast-import --export-marks=../cvs2git-tmp/git-marks.dat < ../cvs2git-tmp/git-blob.dat
git fast-import --import-marks=../cvs2git-tmp/git-marks.dat < ../cvs2git-tmp/git-dump.dat
#git fast-import --import-marks=../cvs2git-tmp/git-marks.dat < ../cvs2git-tmp/git-dump-clean.dat
