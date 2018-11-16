#!/bin/bash

for ii in {2..2}
do
    jj=$(expr $ii - 1)
    sed -e 's/MM/'$jj'/g' -e 's/NN/'$ii'/g' template-pbs > pitzer.pbs
    LAST=$(qsub pitzer.pbs)
done

if true; then
for ii in {3..10}
do
    jj=$(expr $ii - 1)
    sed -e 's/MM/'$jj'/g' -e 's/NN/'$ii'/g' template-pbs > pitzer.pbs
    LAST=$(qsub -W depend=afterany:$LAST pitzer.pbs)
done
fi
