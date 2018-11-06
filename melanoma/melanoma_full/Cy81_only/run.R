#!/usr/bin/env Rscript


library("infercnv")

# create the infercnv object
infercnv_obj = CreateInfercnvObject(raw_counts_matrix="../melanoma.full.counts.matrix",
                                    annotations_file="cy81.cell_annots.txt",
                                    delim="\t",
                                    gene_order_file="../../../__gene_position_data/gencode_v19_gene_pos.txt",
                                    ref_group_names=c("Endothelial", "B", "T"))

# perform infercnv operations to reveal cnv signal
infercnv_obj = infercnv::run(infercnv_obj,
                             cutoff=1, 
                             out_dir="output_dir", 
                             cluster_by_groups=F, 
                             plot_steps=F,
                             include.spike=T
                             )


