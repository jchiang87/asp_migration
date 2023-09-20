## Converting the ASP package in CVS to a git repo

For converting a CVS repository to git, a straight-forward option is to use the `cvs2git` script, which is part of the [cvs2svn](https://github.com/mhagger/cvs2svn) package.   Basic instructions to use `cvs2git` to convert a CVS repo are [here](https://www.mcs.anl.gov/~jacob/cvs2svn/cvs2git.html).  This README describes the process for the ASP set of modules and similar packages in the Fermi/SLAC CVS repository, with some additional steps to provide a cleaner commit history.

### Conversion steps

1. Clone a copy of the cvs2svn repo from https://github.com/mhagger/cvs2svn.  The `cvs2git` executable can be called directly from that location.

1. In a working directory, use `rsync` to make a local copy of the desired packages in the SLAC CVS repository.  For working on a remote machine, the commands to copy ASP would be
   ```
   rsync -avzh jchiang@cent7b.slac.stanford.edu:/nfs/slac/g/glast/ground/cvs/ASP ./cvs/
   mkdir ./cvs/CVSROOT
   ```
   Note that I've only copied the ASP area since I don't want to convert the entire CVS repository.  The `CVSROOT` subdirectory needs to be present so that `cvs` recognizes the area as a CVS repository.  For this conversion, `CVSROOT` isn't accessed, so creating an empty folder is sufficient.

1. Run `cvs2git` on the local copy of the CVS repo.  Note that `cvs2git` isn't python3 compatible, so it needs to be run with python2.  Here are the commands for converting the local copy of the ASP CVS area:
   ```
   mkdir cvs2git-tmp
   python2 <path to cvs2svn repo>/cvs2git \
           --blobfile=cvs2git-tmp/git-blob.dat \
           --dumpfile=cvs2git-tmp/git-dump.dat \
           ./cvs/ASP
   ```

1. Optionally remove the `ChangeLog,v` files or modify the `git-dump.dat` file to delete the "AutoUpdate" commit entries.   Our CVS `ChangeLog` entries duplicate the information in the commits extracted from the CVS histories of the individual files, and so they result in redundant entries in the git commit history.  Eliminating those redundant commits can be handled in a couple different ways:  1) Delete all of the `ChangeLog,v` files in the **local** copy of the CVS repository **prior** to running `cvs2git`, as described in the previous step, or 2) run the `clean_dump_file.py` script in this repository to remove the entries associated with those `ChangeLog,v` files.  Deleting the files is probably more reliable, but using the `clean_dump_file.py` script avoids modifying the local CVS repo.

   To generate the cleaned up dump file, I ran
   ```
   python clean_dump_file.py cvs2git-tmp/git-dump.dat > cvs2git-tmp/git-dump-clean.dat
   ```

1. Create a local git repo and use `git fast-import` to import the commit history:
   ```
   mkdir ASP
   cd ASP
   git init
   git fast-import --export-marks=../cvs2git-tmp/git-marks.dat < ../cvs2git-tmp/git-blob.dat
   git fast-import --import-marks=../cvs2git-tmp/git-marks.dat < ../cvs2git-tmp/git-dump-clean.dat
   git checkout master
   git reset --hard
   git branch -m main
   ```
   The resulting repo can now be imported into GitHub.
