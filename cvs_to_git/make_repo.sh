#python cleanup_dump_file.py > cvs2git-tmp/git-dump-clean.dat
mkdir ASP
cd ASP
git init
bash ../run_fast-import.sh
git checkout master
git reset --hard
git branch -m main
