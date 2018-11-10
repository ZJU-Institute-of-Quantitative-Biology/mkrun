#!/bin/bash

LAST=$(qsub job-mini.pbs)
echo $LAST

for i in heat pre cons 1
do
    LAST=$(qsub -W depend=afterany:$LAST job-$i.pbs)
    echo $LAST
done
