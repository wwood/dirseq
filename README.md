# dirseq

[![Build Status](https://secure.travis-ci.org/wwood/dirseq.png)](http://travis-ci.org/wwood/dirseq)

DirSeq work out whether RNAseq reads from metatranscriptomes are generally in the same direction as the ORF predicted, and provide gene-wise coverages using DNAseq mappings.

Note: this software is under active development!

## Installation

Install some prerequisites via conda, and then dirseq itself:
```sh
conda create -c bioconda -n dirseq -y ruby samtools bedtools'>'2.24
conda activate dirseq
gem install dirseq
```

The following dependencies are installed above, but for completeness of documentation, dirseq requires these dependencies, on top of the Ruby ones:
* samtools (tested with 0.1.19 and 1.0+)
* bedtools (tested with 2.24.0) - old versions won't work.
* Ruby (tested with 2.1.1)

## Usage

Example usage:

Download the example data:
```sh
git clone https://github.com/wwood/dirseq
cd dirseq
```

Then run dirseq:
```sh
dirseq --bam spec/data/eg.bam --gff spec/data/eg.gff --measure-type count
```

Full usage help:
```sh
$ dirseq -h

    Usage: dirseq <arguments>

    Reports the coverage of a mapping in against each gene given in a GFF file

        --bam FILE                   path to mapping file [required]
        --gff FILE                   path to GFF3 file [required]

Optional parameters:

        --forward-read-only          consider only forward reads (i.e. read1) and ignore reverse reads. [default false]
        --ignore-directions          ignore directionality, give overall coverage [default: false i.e. differentiate between directions]
        --measure-type TYPE          what to count for each gene [options: count, coverage][default: coverage]
        --accepted-feature-types TYPE
                                     Print only features of these type(s) [default CDS]
        --comment-fields             Print elements from the comments in the GFF file [default ID]
        --sam-filter-flags           Apply these samtools filters [default: -F0x100 -F0x800]
        
Verbosity:

    -q, --quiet                      Run quietly, set logging to ERROR level [default INFO]
        --logger filename            Log to file [default stderr]
        --trace options              Set log level [default INFO]. e.g. '--trace debug' to set logging level to DEBUG
```

## Project home page

Information on the source tree, documentation, examples, issues and
how to contribute, see

  http://github.com/wwood/dirseq

The BioRuby community is on IRC server: irc.freenode.org, channel: #bioruby.

## Cite

If you use this software, please cite

Woodcroft, B.J., Singleton, C.M., Boyd, J.A. et al. Genome-centric view of carbon processing in thawing permafrost. Nature 560, 49–54 (2018). https://doi.org/10.1038/s41586-018-0338-1

## Copyright

Copyright (c) 2014-2021 Ben J. Woodcroft. See LICENSE.txt for further details.

