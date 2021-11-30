# QiimeTwo2PhyloSeq
# Language: R
# Input: TXT
# Output: DIR
# Tested with: PluMA 1.1, Python 3.6
# Dependencies: qiime2R_0.99.20, phyloseq_1.34.0

Convert input files from Qiime2 (Bolyen et al, 2019) to PhyloSeq (McMurdie et al, 2013)

The plugin accepts as input a parameter file of tab-delimited keyword-value pairs:
otutable: OTU table (QZA file)
taxtable: TAX table (QZA file)
metadata: Mapping (TXT file)

The three phyloseq files, otu_table.csv, tax_table.csv, and sample_data.csv will all be generated in the user-specified output directory.

