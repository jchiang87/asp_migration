#!/usr/bin/bash
#
#export folder=/Data/Flight/Level1/LPA
#export OUTPUTDIR=/sdf/data/fermi/user/jchiang/singularity_tests/L1data
#export TSTART=717120000
#export TSTOP=717141600

opt1="(${TSTART} <= nMetStart && nMetStop <= ${TSTOP})"
opt2="(nMetStart <= ${TSTART} && ${TSTART} <= nMetStop)"
opt3="(nMetStart <= ${TSTOP} && ${TSTOP} <= nMetStop)"
#query="DataType == \"EXTENDEDFT1\" && (${opt1} || ${opt2} || ${opt3})"
query="(${opt1} || ${opt2} || ${opt3})"

(/sdf/home/g/glast/a/datacat/prod/datacat find --group FT1 --filter "$query" ${folder}) > ${OUTPUTDIR}/Ft1FileList

(/sdf/home/g/glast/a/datacat/prod/datacat find --group FT2 --filter "$query" ${folder}) > ${OUTPUTDIR}/Ft2FileList
