# matemaker

## DESCRIPTION

`matemaker` has not been tested extensively and is being actively developed. Please use with caution. I appreciate hearing about your experience with the program.

`matemaker` will generate a pair of fastq files (left and right) that
consist of artificial mate-pairs generated from one or more sequences sent
in as input. It is intended to scaffold an optimal assembly with suboptimal
assemblies. The generated matepairs are in the same orientation as illumina matepair sequencing, and can be used without modification as input to any scaffolding software that accepts illumina mate-pairs (e.g., SSPACE). Quality scores are all set to unknown (represented by the character 'B').

I recommend running the program multiple times with an array of insert sizes. See examples.

=======
## AVAILABILITY

https://github.com/josephryan/matemaker (click the "Download ZIP" button at the bottom of the right column).

### DEPENDENCIES

General system tools:
- [Perl] (http://www.cpan.org/), comes with most operating systems

Additional package
- JFR-PerlModules  - https://github.com/josephryan/JFR-PerlModules

## INSTALLATION

To install `matemaker` and documentation, type the following:

    perl Makefile.PL
    make
    sudo make install

If you do not have permission to install to the system see the following:

    http://www.perlmonks.org/index.pl?node_id=128077#permission

## RUN

    matemaker --assembly=ASSEMBLY.fa --out=PREFIX

## EXAMPLES

In the `examples` directory there are 2 files: 
      Hsap.chr22.opt.fa - (N50: 5000000)
      Human Chromosome 22 divided into chunks of size 5000000

      Hsap.chr22.subopt.fa - (N50: 1000000)
      Human Chromosome 22 divided into chunks of size 1000000
      The first 25000000 NTs (of which all were N) were removed to create
      an offset of breakpoints with Hsap.chr22.opt.fa

To create matepairs try:

      matemaker --assembly=Hsap.chr22.subopt.fa --insertsize=2000 --out=chr22.2000
      matemaker --assembly=Hsap.chr22.subopt.fa --insertsize=5000 --out=chr22.5000
      matemaker --assembly=Hsap.chr22.subopt.fa --insertsize=10000 --out=chr22.10000
      
The resulting files are:  

      chr22.2000.A.fq,  chr22.2000.B.fq

      chr22.5000.A.fq,  chr22.5000.B.fq

      chr22.10000.A.fq, chr22.10000.B.fq

These can be used as input to a scaffolding software (e.g., SSPACE) to scaffold the optimal assembly:

      Hsap.chr22.opt.fa


## DOCUMENTATION

Documentation is embedded inside of `matemaker` in POD format and
can be viewed by running any of the following:

        matemaker --help
        perldoc matemaker
        man matemaker  # available after installation

## OPTIONS

       --assembly
         The FASTA file with the sequence or sequences from which to generate
         the mates

       --out
         A prefix to use for the output FASTQ (or FASTA) files

       --readlen
         (default: 50) the read length of the produced mate-pair library

       --insertsize
         (default: 5000) the length of the insert size of the produced mate-
         pair library

       --fasta
         by default matepairs are created in fastq format, but with this
         option they can be made as fasta files

       --print_inserts
         this option will generate an additional output file that includes the
         full sequences of the inserts that were used to create the mate-pairs

       --print_coords
         this option will generate an additional output file (csv format) that
         includes the mate_pair id, the coordinates of the mates and the
         sequence_id of the sequence used to create the mates.  The suffix
         will be `coords.csv` and the format of the file is:
         mate_id,mate1_coord,mate2_coord,defline_of_seq_used_to_generate_mate

       --matesperkb
         (default: 5) the number of mates randomly generated for a particular
         sequence follows the formula ( (SEQUENCE_LENGTH - INSERTSIZE) / (1000
         / MATESPERKB) )

## COPYRIGHT AND LICENSE

Copyright (C) 2015 Joseph F. Ryan

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program in the file LICENSE.  If not, see
http://www.gnu.org/licenses/.
