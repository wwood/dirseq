# dirseq

[![Build Status](https://secure.travis-ci.org/wwood/dirseq.png)](http://travis-ci.org/wwood/dirseq)

DirSeq work out whether RNAseq reads from metatranscriptomes are generally in the same direction as the ORF predicted, and provide gene-wise coverages using DNAseq mappings.

Note: this software is under active development!

## Installation

Won't work just yet:
```sh
gem install dirseq
```
Requires:
* samtools (tested with 0.1.19 and 1.0+)
* bedtools (tested with 2.24.0) - old versions won't work.
* Ruby (tested with 2.1.1)

## Usage

Only the script is available at the moment
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

If you use this software, please cite one of

* [BioRuby: bioinformatics software for the Ruby programming language](http://dx.doi.org/10.1093/bioinformatics/btq475)
* [Biogem: an effective tool-based approach for scaling up open source software development in bioinformatics](http://dx.doi.org/10.1093/bioinformatics/bts080)

## Biogems.info

This Biogem is published at (http://biogems.info/index.html#bio-rnaseq_transcription_directionality)

## Copyright

Copyright (c) 2014 Ben J. Woodcroft. See LICENSE.txt for further details.

