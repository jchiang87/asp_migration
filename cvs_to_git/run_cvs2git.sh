set -xe

repo=$1

tmpdir=cvs2git-${repo}-tmp
mkdir ${tmpdir}
python2 ./cvs2svn/cvs2git \
        --blobfile=${tmpdir}/git-blob.dat \
        --dumpfile=${tmpdir}/git-dump.dat \
        ./cvs/${repo}
