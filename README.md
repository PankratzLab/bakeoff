# Bakeoff scripts

## RUFUS

Single run with 1000G as the exclusion list:
`sbatch -p <partition> --export=GROUP=[group name, i.e. group1],SAMPLE=[NWD###] ru_1000g.slrm`

Multiple batch run with 1000G as the exclusion list. Runs multiple batches of 10 for a specified group, submitting each as a job array. Skips samples where there exists a `*.FINAL.vcf.gz.tbi` file:
`./runAll <group name> [num chunks (default: remaining samples)] [partition (default: amd2tb)]`

Note: modify the user email to get notified on failure. Batch runs can only be run on certain partitions that allow job arrays. If a sample fails, you should be able to just re-run the batch script, and it will re-run samples that haven't completed, since it searches through all samples for a given group. RUFUS seems to handle re-runs without needing to do any cleanup in between, skipping steps that already have output.

## Cue

