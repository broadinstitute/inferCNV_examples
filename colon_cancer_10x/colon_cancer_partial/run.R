#!/usr/bin/env Rscript

library("infercnv")

                                        # create the infercnv object
infercnv_obj = CreateInfercnvObject(raw_counts_matrix="counts.small.matrix",
                                    annotations_file="sample_annots.small.txt",
                                    delim="\t",
                                    gene_order_file="gencode_v19_gene_pos.txt",
                                    ref_group_names=c("C121_Normal",
                                                      "C124_Normal",
                                                      "C126_Normal",
                                                      "C125_Normal",
                                                      "C122_Normal",
                                                      "C127_Normal",
                                                      "C123_Normal"))

out_dir="output_dir"
                                        # perform infercnv operations to reveal cnv signal
infercnv_obj = infercnv::run(infercnv_obj,
                             cutoff=1,
                             out_dir=out_dir,
                             cluster_by_groups=T,
                             plot_steps=T
                             )

                                        # generate final plot
plot_cnv(infercnv_obj,
         out_dir=out_dir,
         cluster_by_groups=T,
         color_safe_pal=FALSE,
         x.center=1,
         x.range=c(0.6,1.4),
         title="inferCNV",
         obs_title="Observations (Cells)",
         ref_title="References (Cells)",
         output_filename="infercnv")


run.R (END)
