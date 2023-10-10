# Suberis_vf_blast_script
A simple BASH script for identification of Streptococcus uberis virulence factors from draft genome

Database of virulence factors gene sequences is adopted from Vezina B, Al-Harbi H, Ramay HR, Soust M, Moore RJ, Olchowy TWJ, Alawneh JI. Sequence characterisation and novel insights into bovine mastitis-associated Streptococcus uberis in dairy herds. Sci Rep. 2021 Feb 4;11(1):3046. doi: 10.1038/s41598-021-82357-3. This publication should be cited when using Suberis_VF_blast.sh script.

The script is dependent only on local blast installation.

1. install blast locally

for Ubuntu and Debian users

sudo apt install ncbi-blast+

others https://blast.ncbi.nlm.nih.gov/Blast.cgi?PAGE_TYPE=BlastDocs&DOC_TYPE=Download

2. create /blastdb directory and put file Suberis_vf_db_Vezina2021.fasta here

3. build blast database in /blastdb

makeblastdb -in Suberis_vf_db_Vezina2021.fasta -parse_seqids -blastdb_version 5 -title "Suberis_vf_db" -dbtype nucl

4. edit line 5 in Suberis_VF_blast.sh script to locate blast database in your correct path (for example /home/$HOME/blastdb) and make the script executable

chmod +x Suberis_VF_blast.sh

5. run Suberis_VF_blast.sh from directory containing your S. uberis draft genomes named *.fasta

6. read output virulence_factors.tsv (tab separated columns). The columns are: sample virulence_factor length slen ppos query_coverage_%
