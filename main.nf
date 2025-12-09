#!/usr/bin/env nextflow


params.ref_assembly
params.user_assembly
params.prefix


 process nucmer_task (
        """
        nucmer --maxmatch --nosimplify params.ref_assembly params.user_assembly -p params.prefix --coords
        """
 )

