
all:
	./run.R

clean:
	rm -rf ./output_dir


debug:
	../../../inferCNV/scripts/plot_hspike.R --infercnv_obj output_dir/run.final.infercnv_obj
	../../../inferCNV/scripts/plot_hspike.by_num_cells.R --infercnv_obj output_dir/run.final.infercnv_obj
	../../../inferCNV/scripts/run_HMM_on_hspike.R --infercnv_obj output_dir/run.final.infercnv_obj
	../../../inferCNV/scripts/plot_hspike_vs_sample_chrs.R --infercnv_obj output_dir/preliminary.infercnv_obj



i3:
	cat run.R  | sed s/HMM=T/HMM=T,HMM_type=\'i3\'/ > run.i3.R
	Rscript ./run.i3.R

Bayes:
	cat run.R  | sed s/HMM=T/HMM=T,BayesMaxPNormal=0.3/ > run.Bayes.R
	Rscript ./run.Bayes.R
