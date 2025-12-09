#!/usr/bin/env nextflow
params.ref_assembly = null
params.user_assembly = null
params.prefix = "test"


 process nucmerTask (
        """
        nucmer --maxmatch --nosimplify params.ref_assembly params.user_assembly -p params.prefix --coords
        """
 )

workflow {
    nucmerTask
}
