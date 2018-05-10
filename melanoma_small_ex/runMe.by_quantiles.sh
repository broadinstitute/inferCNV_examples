../../inferCNV/scripts/inferCNV.R \
    --ref ref.obs \
    --output_dir outdir_by_quantiles \
    --ref_subtract_method by_quantiles \
    --vis_bound_threshold " -0.8,0.8" --noise_filter 0.2 \
    melanoma.360cells.5kgenes.abridged.matrix ../__gene_position_data/gencode_v19_gene_pos.txt
