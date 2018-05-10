../../inferCNV/scripts/inferCNV.R \
    --output_dir outdir_no_ref_obs_used \
    --ref_subtract_method by_mean \
    --noise_filter 0.2 \
    melanoma.360cells.5kgenes.abridged.matrix ../__gene_position_data/gencode_v19_gene_pos.txt


