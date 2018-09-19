#!/usr/bin/env Rscript


if (file.exists(expression.cp100k.matrix.gz) & ! file.exists(expression.cp100k.matrix) ) {
    system("gunzip -c expression.cp100k.matrix.gz > expression.cp100k.matrix")
}


library("infercnv")

# create the infercnv object
infercnv_obj = CreateInfercnvObject(raw_counts_matrix="expression.cp100k.matrix",
                                    annotations_file="cell_patients_assignments.txt",
                                    delim="\t",
                                    gene_order_file="../../__gene_position_data/gencode_v19_gene_pos.txt",
                                    ref_group_names=c("Microglia/Macrophage","Oligodendrocytes (non-malignant)"))

# perform infercnv operations to reveal cnv signal
infercnv_obj = infercnv::run(infercnv_obj,
                             cutoff=1, 
                             out_dir="output_dir", 
                             cluster_by_groups=T, 
                             plot_steps=F,
                             use_zscores=F,
                             )

# generate final plot
plot_cnv(infercnv_obj,
         out_dir="output_dir", 
         cluster_by_groups=T,
         color_safe_pal=FALSE,
         x.center=1,
         title="inferCNV",
         obs_title="Observations (Cells)",
         ref_title="References (Cells)",
         output_filename="infercnv")


