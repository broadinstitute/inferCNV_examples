#!/usr/bin/env Rscript


library("infercnv")

# create the infercnv object
infercnv_obj = CreateInfercnvObject(raw_counts_matrix="../expression.cp100k.matrix",
                                    annotations_file="cells.txt",
                                    delim="\t",
                                    gene_order_file="../../../__gene_position_data/gencode_v19_gene_pos.txt",
                                    ref_group_names=c("Oligodendrocytes (non-malignant)"),
                                    max_cells_per_group=50)

# perform infercnv operations to reveal cnv signal
infercnv_obj = infercnv::run(infercnv_obj,
                             cutoff=1, 
                             out_dir="output_dir", 
                             cluster_by_groups=T, 
                             plot_steps=T,
                             include.spike=T,
                             mask_nonDE_genes=T,
                             )

