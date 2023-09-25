set -xe

repo=$1

rsync -avzh jchiang@cent7b.slac.stanford.edu:/nfs/slac/g/glast/ground/cvs/$1 ./cvs/

if [ ! -d ./cvs/ROOT ]; then
    mkdir ./cvs/CVSROOT
fi
