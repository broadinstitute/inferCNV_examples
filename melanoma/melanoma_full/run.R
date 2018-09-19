#!/usr/bin/env Rscript

if (file.exists("melanoma.full.counts.matrix.gz") & ! file.exists("melanoma.full.counts.matrix") ) {
    system("gunzip -c melanoma.full.counts.matrix.gz > melanoma.full.counts.matrix")
}


library("infercnv")

# create the infercnv object
infercnv_obj = CreateInfercnvObject(raw_counts_matrix="melanoma.full.counts.matrix",
                                    annotations_file="melanoma_cell_annotations.txt",
                                    delim="\t",
                                    gene_order_file="../../__gene_position_data/gencode_v19_gene_pos.txt",
                                    ref_group_names=c("Endothelial", "NK", "Macrophage", "B", "T", "CAF"))

# perform infercnv operations to reveal cnv signal
infercnv_obj = infercnv::run(infercnv_obj,
                             cutoff=1, 
                             out_dir="output_dir", 
                             cluster_by_groups=T, 
                             plot_steps=F,
                             use_zscores=F
                             )

save('infercnv_obj', file="infercnv_obj.final")

# generate final plot
plot_cnv(infercnv_obj,
         out_dir="output_dir", 
         cluster_by_groups=T,
         color_safe_pal=FALSE,
         x.center=1,
         x.range=c(0.6,1.4),
         title="inferCNV",
         obs_title="Observations (Cells)",
         ref_title="References (Cells)",
         output_filename="infercnv")


