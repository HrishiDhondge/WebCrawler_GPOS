#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
inputs:
  sequence: File
#  name_of_file_to_extract: string

outputs:
  models:
    type: File
    outputSource: compile/classfile

steps:
  template_seach:
    in:
      tarfile: sequence
      #extractfile: name_of_file_to_extract
    out: [extracted_file]

  compile:
    run: 2.cwl
    in:
      src: untar/extracted_file
    out: [classfile]
