
__author__ = "Taavi Päll"
__copyright__ = "Copyright 2018, Avilab"
__email__ = "taavi.pall@ut.ee"
__license__ = "MIT"

include: "rules/common.smk"

wildcard_constraints:
    sample = "[^_/]+"

## Target rules
rule all:
    input:
      expand([
      "mask/{sample}_repmaskedgood_{n}.fa",
      "mask/{sample}_unmaskedgood_{n}.fa"
      ], sample = sample_ids, n = list(range(1, n_files + 1, 1)))

## Modules
include: "rules/munge.smk"
include: "rules/refgenomefilter.smk"
include: "rules/assemble.smk"
include: "rules/mask.smk"
