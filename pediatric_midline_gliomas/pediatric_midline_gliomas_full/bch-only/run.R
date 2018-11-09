#!/usr/bin/env Rscript


if (file.exists("ped_midline_gliomas.counts.p100k.matrix.gz") & ! file.exists("ped_midline_gliomas.counts.p100k.matrix") ) {
    system("gunzip -c ped_midline_gliomas.counts.p100k.matrix.gz > ped_midline_gliomas.counts.p100k.matrix")
}

library("infercnv")

# create the infercnv object
infercnv_obj = CreateInfercnvObject(raw_counts_matrix="../ped_midline_gliomas.counts.p100k.matrix",
                                    annotations_file="bch.samples",
                                    delim="\t",
                                    gene_order_file="../../../__gene_position_data/gencode_v19_gene_pos.txt",
                                    ref_group_names=c("Oligodendrocyte", "Immune cell"))

# perform infercnv operations to reveal cnv signal
infercnv_obj = infercnv::run(infercnv_obj,
                             cutoff=1, 
                             out_dir="output_dir", 
                             cluster_by_groups=T, 
                             plot_steps=F,
                             include.spike=T,
                             mask_nonDE_genes=T
                             )
