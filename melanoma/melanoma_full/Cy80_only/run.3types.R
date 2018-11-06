#!/usr/bin/env Rscript


library("infercnv")

# create the infercnv object
infercnv_obj = CreateInfercnvObject(raw_counts_matrix="cy80.matrix",
                                    annotations_file="cy80.3types.cell_annots.txt",
                                    delim="\t",
                                    gene_order_file="../../../__gene_position_data/gencode_v19_gene_pos.txt",
                                    ref_group_names=c("Endothelial", "NK", "B", "T", "CAF"))

# perform infercnv operations to reveal cnv signal
infercnv_obj = infercnv::run(infercnv_obj,
                             cutoff=1, 
                             out_dir="output_dir.3types", 
                             cluster_by_groups=T, 
                             plot_steps=F,
                             include.spike=T,
                             )


