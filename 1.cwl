#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow

inputs:
  table_hits:
    type: File
    label: output of infernal's cmsearch
    
outputs:
 5S_coordinates:
   type: File
   outputSource: extract_5S_coords/matched_seqs_with_coords

steps:
  grep:
    run: 2.cwl
    in: { hits: table_hits }
    out: [ 5Ss ]
    
  extract_5S_coords:
    #run: extract-coords-from-cmsearch
    in: { infernal_matches: grep/5Ss }
    out: [ matched_seqs_with_coords ]
