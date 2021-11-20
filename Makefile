include .env

ANALYZE_TARGET_REPOSITORY := $(PATH_TO_REPOSITORY)
ANALYSIS_TARGET_BRANCH := $(ANALYSIS_TARGET_BRANCH)
OUTPUT_DIR := output/$(REPOSITORY_ID)
OUTPUT_JSON_DIR := $(OUTPUT_DIR)/json
OUTPUT_IMG_DIR := $(OUTPUT_DIR)/img

analyze:
	mkdir -p ${OUTPUT_JSON_DIR} ${OUTPUT_IMG_DIR}
	git-of-theseus-analyze ${ANALYZE_TARGET_REPOSITORY} \
		--branch ${ANALYSIS_TARGET_BRANCH} \
		--outdir ${OUTPUT_JSON_DIR}

stack-plot:
	git-of-theseus-stack-plot ${OUTPUT_JSON_DIR}/cohorts.json --outfile=${OUTPUT_IMG_DIR}/stack-plot-cohorts.png
	git-of-theseus-stack-plot ${OUTPUT_JSON_DIR}/authors.json --outfile=${OUTPUT_IMG_DIR}/stack-plot-authors.png
	git-of-theseus-stack-plot ${OUTPUT_JSON_DIR}/dirs.json --outfile=${OUTPUT_IMG_DIR}/stack-plot-dirs.png
	git-of-theseus-stack-plot ${OUTPUT_JSON_DIR}/exts.json --outfile=${OUTPUT_IMG_DIR}/stack-plot-exts.png
