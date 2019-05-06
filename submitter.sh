#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -M qz85@drexel.edu
#$ -P rosenclassPrj
#$ -l h_rt=6:00:00
#$ -l h_vmem=20G
#$ -l m_mem_free=20G
#$ -q all.q

. /etc/profile.d/modules.sh
module load proteus
module load gcc/4.8.1
module load sge/univa
module load shared
module load python/2.7.13
module load bowtie2/2.2.5

hg clone https://bitbucket.org/biobakery/metaphlan2

cd metaphlan2

wget https://www.dropbox.com/s/l87mmmjs0fr85ir/hmp_metagenomics.zip
unzip hmp_metagenomics.zip

for i in ./hmp_metagenomics/fastq/*; do
	j=${i##*/}
	python ./metaphlan2.py --mpa_pkl ./metaphlan2_db/db_v20/mpa_v20_m200.pkl --input_type fastq --bowtie2db ./metaphlan2_db/db_v20/mpa_v20_m200 --no_map --nproc 2 -o ./hmp_metagenomics/output/${j/fastq/txt} $i
done

git clone https://github.com/LangilleLab/microbiome_helper

python ./utils/merge_metaphlan_tables.py ./hmp_metagenomics/output/* > metaphlan_merged_all.txt

./microbiome_helper/metaphlan_to_stamp.pl metaphlan_merged_all.txt > metaphlan_merged_all.spf

awk '!/t__/ { print }' metaphlan_merged_all.spf > metaphlan_merged_all_new.spf


