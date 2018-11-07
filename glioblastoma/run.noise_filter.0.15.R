#!/usr/bin/env Rscript

library("infercnv")

if (file.exists("glio.wGtexBrain.counts.matrix.gz") & ! file.exists("glio.wGtexBrain.counts.matrix") ) {
    system("gunzip -c glio.wGtexBrain.counts.matrix.gz > glio.wGtexBrain.counts.matrix")
}


# create the infercnv object
infercnv_obj = CreateInfercnvObject(raw_counts_matrix="glio.wGtexBrain.counts.matrix",
                                    annotations_file="glio.wGtexBrain.sample_annots.txt",
                                    delim="\t",
                                    gene_order_file="../__gene_position_data/gencode_v19_gene_pos.txt",
                                    ref_group_names=c("Brain - Cerebellum",
                                                      "Brain - Caudate (basal ganglia)",
                                                      "Brain - Cortex",
                                                      "Brain - Nucleus accumbens (basal ganglia)",
                                                      "Brain - Cerebellar Hemisphere",
                                                      "Brain - Frontal Cortex (BA9)",
                                                      "Brain - Hippocampus"
                                                      ))

# perform infercnv operations to reveal cnv signal
infercnv_obj = infercnv::run(infercnv_obj,
                             cutoff=1, 
                             out_dir="output_dir", 
                             cluster_by_groups=T, 
                             plot_steps=F,
                             include.spike=F,
                             normalize_factor=1e6, # make cpm
                             noise_filter=0.15
                             )


