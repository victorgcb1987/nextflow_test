#!/usr/bin/env nextflow
nextflow.enable.dsl=2

/*
 * Parámetros del pipeline
 */
params.ref_assembly = params.ref_assembly ?: null
params.user_assembly = params.user_assembly ?: null
params.prefix       = params.prefix       ?: "test"

/*
 * Proceso que llama a nucmer
 */
process nucmerTask {

    tag "$prefix"

    input:
    val ref
    val qry
    val prefix

    script:
    """
    GAQET
    """
}

/*
 * Workflow principal
 */
workflow {

    if( !params.ref_assembly || !params.user_assembly ) {
        log.error "Debes indicar --ref_assembly y --user_assembly"
        System.exit(1)
    }

    nucmerTask(
        params.ref_assembly,
        params.user_assembly,
        params.prefix
    )
}
