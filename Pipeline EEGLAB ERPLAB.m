Pipeline EEGLAB/ERPLAB

1- IMPORT DATA
.vhdr para cada sujeito

Nome EFM_S###
     Emotional Faces Memory Subject ##

2- EVENTLIST

ERPLAB > EventList > Create EEG EVENTLIST

ElistSuj###.txt

3 - BINLIST


4 - Re-reference

ERPLAB > EEG Channel operations

Reference assistent

TP9/TP10


5- FILTER

Cleanline (default)

ERPLAB > Filter and frequency tools > Filters for EEG data

0.1Hz - 30Hz

6- CHANNEL LOCS

Edit > Channel locations

7- ICA

Tools >> Decompose Data by ICA

runica

Remove components from data

8 - EXTRACT BIN BASED EPOCHS

9 - ARTIFACT REJECTION

ERPLAB > Artifact detection in epoched data > Simple voltage threshold

save the artifact detection results

10- ERPs

ERPLAB > Compute averaged ERPs
