#!/bin/bash

#Directory containing bed files to be analyzed. Include ending "/"
WORKINGDIRECTORY="/home/zwhitfield/Desktop/ForMarkGenomePaper/FrozenData/Aag2_assembly"

#Name of input bed files to analyze
TEFILE="Aag2_Contigs_TEs.bed"
EVEFILE="Aag_Contigs_EVEs_NEW_cut.bed"

#Name of initial output SORTED bedfiles
TEFILESORTED="Aag2_Contigs_TEs_sorted.bed"
EVEFILESORTED="Aag_Contigs_EVEs_NEW_cut_sorted.bed"

#Sort bedfiles (if necessary)
bedtools sort -i ${WORKINGDIRECTORY}/${TEFILE}  > ${WORKINGDIRECTORY}/${TEFILESORTED}
bedtools sort -i ${WORKINGDIRECTORY}/${EVEFILE}  > ${WORKINGDIRECTORY}/${EVEFILESORTED}

#No overlaps
bedtools closest -a ${WORKINGDIRECTORY}/${EVEFILESORTED} -b ${WORKINGDIRECTORY}/${TEFILESORTED} -id -io -D ref > ${WORKINGDIRECTORY}/closestTEtoEVEs_UPSTREAM.txt

bedtools closest -a ${WORKINGDIRECTORY}/${EVEFILESORTED} -b ${WORKINGDIRECTORY}/${TEFILESORTED} -iu -io -D ref > ${WORKINGDIRECTORY}/closestTEtoEVEs_DOWNSTREAM.txt

#With overlaps and 1 result per EVE
bedtools closest -a ${WORKINGDIRECTORY}/${EVEFILESORTED} -b ${WORKINGDIRECTORY}/${TEFILESORTED} -id -D ref > ${WORKINGDIRECTORY}/closestTEtoEVEs_UPSTREAM_allowOverlap.txt

bedtools closest -a ${WORKINGDIRECTORY}/${EVEFILESORTED} -b ${WORKINGDIRECTORY}/${TEFILESORTED} -iu -D ref > ${WORKINGDIRECTORY}/closestTEtoEVEs_DOWNSTREAM_allowOverlap.txt

#With overlaps and 2 results per EVE
#bedtools closest -a ${EVEFILE} -b ${TEFILE} -id -D ref -k 2 > closestTEtoEVEs_UPSTREAM_allowOverlapX2.txt

#bedtools closest -a ${EVEFILE} -b ${TEFILE} -iu -D ref -k 2 > closestTEtoEVEs_DOWNSTREAM_allowOverlapX2.txt

