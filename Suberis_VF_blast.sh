#!/bin/bash
#spoustet z adresare s .fasta soubory po assembly
#precte nazev *.fasta souboru a problastuje ho proti databazi Suberis_vf_db_Vezina2021.fasta.
for x in *.fasta
  do blastn -query "$x" -db /home/$HOME/blastdb/Suberis_vf_db_Vezina2021.fasta -task megablast -dust no -outfmt "6 sseqid length slen ppos"| awk 'BEGIN {FS="\t"} {query_coverage = ($2 / $3) * 100; print $0 "\t" query_coverage "%"}' > "$x".vf

#vytvoreni hlavicky s nazvem kontigu
echo "$x" > head
#spojeni hlavicky s vysledkem blastu
cat head "$x".vf > "$x".vysle
#odstraneni zalamovani radku a oddeleni sloupcu tabem 
sed ':a;N;$!ba;s/\n/\t/g' "$x".vysle > "$x".merged
#vypise obsah souboru vysle na obrazovku, aby se neco delo
cat "$x".vysle
done
#vytvoreni hlavickoveho radku a ulozeni vseho do souboru serotypes.csv

echo "sample	virulence_factor	length	slen	ppos	query_coverage_%" > hlavicka
cat hlavicka *.merged > virulence_factors.tsv
#odstraneni nepotrebnych souboru
rm *.vf
rm head
rm *.vysle
rm *.merged
rm hlavicka

exit 0
