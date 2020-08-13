#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow

inputs:
  Sequence:
    type: File
    label: Target sequence in Fasta format
    
outputs:
 5_Models:
   type: File
   #outputSource: extract_5S_coords/matched_seqs_with_coords
 DOPE_Graph:
   type: File

