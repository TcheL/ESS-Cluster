#!/bin/bash

module load mseed2sac/2.2
module load SAC/101.6a

# convert miniSEED to SAC
mseed2sac /share/data/CENC/201301/20130101/AH.ANQ.00.BHE.20130101000005.mseed

# merge and subsample
sac << END
  r *.SAC
  rmean
  rtr
  bp co 0.0077 5 n 2 p 2
  merge
  decimate 5 filter on
  decimate 2 filter on
  w merge.sac
  q
END

mv merge.sac AH.ANQ.00.BHE.20130101000005.sac
rm -f *.SAC

