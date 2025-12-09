#!/usr/bin/env nextflow
nextflow.enable.dsl=2

/*
 * Parámetros
 * Se pasan al ejecutar:
 *   nextflow run victorgcb1987/nextflow_test \
 *     --ref_assembly ref.fasta \
 *     --user_assembly query.fasta \
 *     --prefix prueba
 */
params.ref_assembly = params.ref_assembly ?: null
params.user_assembly = params.user_assembly ?: null
params.prefix       = params.prefix       ?: "test"

/*
 * Proceso que lanza nucmer
 */
process nucmerTask {

    tag "$prefix"

    input:
    val ref
    val qry
    val prefix

    script:
    """
    nucmer --maxmatch --nosimplify $ref $qry -p $prefix --coords
    """
}

/*
 * Flujo de trabajo principal
 */
workflow {

    /*
     * Comprobación rápida de parámetros
     */
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