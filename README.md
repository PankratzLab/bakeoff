# Bakeoff scripts

Location: `/scratch.global/neis/bakeoff/`

## RUFUS

### Scripts

These scripts will submit RUFUS jobs (detailed below)

`runAll` : Submit a batch of samples for a group as separate jobs.
    
    Usage: /runAll <group, i.e. group1> [batchsize] [partition (default: msismall)]

`runArray` : Submit a batch of samples for a group as job arrays (use only if you're able to use amd2tb or amd512 or msilarge).
    
    Usage: <group name> [num chunks (default: remaining samples)] [partition (default: amd2tb)]

### Slurm scripts

`rufus_docker_single.slrm` : Use for running a single sample in a container.

`rufus_docker.slrm` : Use for submitting multiple batches of jobs with job arrays.

`rufus_docker_nonarray.slrm` : Use for submitting a batch of samples as separate jobs.

`backup_rufus.slrm` : Back up all RUFUS output to tier2 storage. This runs automatically in `runAll`

### Troubleshooting

If a job fails, usually re-running it does the trick. This can be done by just running `runAll` again normally, since it'll just run any incomplete samples. 

If the same sample fails multiple times (the sample name and group are logged), it may help to run without a container:

    sbatch -p <partition> --export=GROUP=[group name, i.e. group1],SAMPLE=[NWD###] rufus_single.slrm


## Cue

Single run:

`sbatch -p [partition] --export=GROUP=[group],SAMPLE=[NWD###] cue_docker.slrm`