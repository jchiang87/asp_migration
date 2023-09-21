mkdir cvs2git-asp-tmp
python2 ./cvs2svn/cvs2git \
        --blobfile=cvs2git-asp-tmp/git-blob.dat \
        --dumpfile=cvs2git-asp-tmp/git-dump.dat \
        ./cvs/ASP

mkdir cvs2git-asp-scons-tmp
python2 ./cvs2svn/cvs2git \
        --blobfile=cvs2git-asp-scons-tmp/git-blob.dat \
        --dumpfile=cvs2git-asp-scons-tmp/git-dump.dat \
        ./cvs/ASP-scons
