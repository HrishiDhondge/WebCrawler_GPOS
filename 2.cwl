#!/usr/bin/env
cwlVersion: v1.0
class: CommandLineTool
requirements:
  ResourceRequirement:
    coresMax: 1
    ramMin: 100  # just a default, could be lowered

inputs:
  hits: { type: File, streamable: true }

stdin: ${inputs.hits.path}

baseCommand: [ grep, RF00002 ]

stdout: 5Ss  # helps with cwltool's --cache

outputs: { 5Ss: { type: stdout } }

