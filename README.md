# matemaker

## DESCRIPTION

I appreciate hearing about your experience with the matemaker.

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

## HOW I USUALLY RUN IT

matemaker --assembly assembly.fa --insertsize=1000 --out=01k
matemaker --assembly assembly.fa --insertsize=2000 --out=02k
matemaker --assembly assembly.fa --insertsize=3000 --out=03k
matemaker --assembly assembly.fa --insertsize=4000 --out=04k
matemaker --assembly assembly.fa --insertsize=5000 --out=05k
matemaker --assembly assembly.fa --insertsize=6000 --out=06k
matemaker --assembly assembly.fa --insertsize=7000 --out=07k
matemaker --assembly assembly.fa --insertsize=8000 --out=08k
matemaker --assembly assembly.fa --insertsize=9000 --out=09k
matemaker --assembly assembly.fa --insertsize=10000 --out=10k
matemaker --assembly assembly.fa --insertsize=11000 --out=11k
matemaker --assembly assembly.fa --insertsize=12000 --out=12k
matemaker --assembly assembly.fa --insertsize=13000 --out=13k
matemaker --assembly assembly.fa --insertsize=14000 --out=14k
matemaker --assembly assembly.fa --insertsize=15000 --out=15k
matemaker --assembly assembly.fa --insertsize=16000 --out=16k
matemaker --assembly assembly.fa --insertsize=17000 --out=17k
matemaker --assembly assembly.fa --insertsize=18000 --out=18k
matemaker --assembly assembly.fa --insertsize=19000 --out=19k
matemaker --assembly assembly.fa --insertsize=20000 --out=20k
matemaker --assembly assembly.fa --insertsize=21000 --out=21k
matemaker --assembly assembly.fa --insertsize=22000 --out=22k
matemaker --assembly assembly.fa --insertsize=23000 --out=23k
matemaker --assembly assembly.fa --insertsize=24000 --out=24k
matemaker --assembly assembly.fa --insertsize=25000 --out=25k
matemaker --assembly assembly.fa --insertsize=26000 --out=26k
matemaker --assembly assembly.fa --insertsize=27000 --out=27k
matemaker --assembly assembly.fa --insertsize=28000 --out=28k
matemaker --assembly assembly.fa --insertsize=29000 --out=29k
matemaker --assembly assembly.fa --insertsize=30000 --out=30k

#### Corresponding SSPACE config file

lib1 bwa 01k.A.fq 01k.B.fq 1000 0.25 RF
lib2 bwa 02k.A.fq 02k.B.fq 2000 0.25 RF
lib3 bwa 03k.A.fq 03k.B.fq 3000 0.25 RF
lib4 bwa 04k.A.fq 04k.B.fq 4000 0.25 RF
...
lib27 bwa 27k.A.fq 27k.B.fq 27000 0.25 RF
lib28 bwa 28k.A.fq 28k.B.fq 28000 0.25 RF
lib29 bwa 29k.A.fq 29k.B.fq 29000 0.25 RF
lib30 bwa 30k.A.fq 30k.B.fq 30000 0.25 RF

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
