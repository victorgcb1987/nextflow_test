#!/usr/bin/env nextflow


params.ref_assembly = null
params.user_assembly = null
params.prefix = "test"


 process nucmer_task (
        """
        nucmer --maxmatch --nosimplify params.ref_assembly params.user_assembly -p params.prefix --coords
        """
 )

