
#library(devtools)
#reload("/opt/R/4.0.0/lib/R/library/tidyr/")
#reload("/opt/R/4.0.0/lib/R/library/qiime2R/")
#reload("/opt/R/4.0.0/lib/R/library/microbiome/")
#devtools::load_all("/opt/R/4.0.0/lib/R/library/tidyr/")
#library(tidyr)
#library(microbiome)
#library(ggplot2)
#library(phyloseq)
#library(ape)
#library(psadd)
#library(stringr)
library(qiime2R)
library(phyloseq)
#library(devtools)
#devtools::load_all("/opt/R/4.0.0/lib/R/library/qiime2R/")
#devtools::load_all(pkgload::inst("qiime2R"))
#devtools::load_all(pkgload::inst("phyloseq"))
#devtools::load_all("tidyr")
#devtools::load_all("qiime2R")

input <- function(inputfile) {
dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")
  pfix = prefix()
  if (length(pfix) != 0) {
     prefix <- paste(pfix, "/", sep="")
  }

  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1]; 
   # Need to get the three files
#paste(pfix, toString(parameters["inputfile",2]), sep="")
   otutable <<- paste(pfix, toString(parameters["otutable", 2]), sep="")
   taxtable <<- paste(pfix, toString(parameters["taxtable", 2]), sep="")
   sampledata <<- paste(pfix, toString(parameters["metadata", 2]), sep="")
   print(otutable)
   print(taxtable)
   print(sampledata)
   #HMP <<- import_qiime(otu.path, map.path, tree.path, parseFunction = parse_taxonomy_qiime)
}
run <- function() {
   #samples.to.keep <<- sample_sums(HMP) >= 1000
   #HMP <<- prune_samples(samples.to.keep, HMP)
   #HMP <<- filter_taxa(HMP, function(x) sum(x >3) > (0.01*length(x)), TRUE)
   p0 <<- qza_to_phyloseq(features=otutable, taxonomy=taxtable, metadata=sampledata)
   print(sample_names(p0))
}

output <- function(outputfile) {
  #pdf(paste(outputfile,"pdf",sep="."), width=8, height=8)#,  width = 10*300,        # 5 x 300 pixels
  #height = 10*300); #,)
  #print("Generating plot...")
  #y <- plot_bar(p0, x="Sample", fill=diffcol) + theme(legend.position="bottom", legend.title = element_text(size=2),
#legend.text = element_text(size=1)) + guides(col = guide_legend(ncol = 15))
  #y <- plot_bar(p0, x="Sample", fill=diffcol) + theme(legend.position="bottom", legend.title = element_text(size=3),
#legend.text = element_text(size=3)) + guides(fill = guide_legend(ncol = 12, keyheight=0.5, keywidth=0.5)) 
  #ggsave(paste(outputfile,"pdf",sep="."), y, width=10, dpi=300)
  #print(str(y))
  print("Generating CSV...")
  #print(str(y$data))
  print(outputfile)
  write.csv(otu_table(p0), paste(outputfile, "otu_table.csv", sep="/"))
  write.csv(tax_table(p0), paste(outputfile, "tax_table.csv", sep="/"))
  write.csv(sample_data(p0), paste(outputfile, "sample_data.csv", sep="/"))
}

#devtools::unload(pkgload::inst("qiime2R"))
#devtools::unload(pkgload::inst("phyloseq"))
