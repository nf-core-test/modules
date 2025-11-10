include { WGET      } from '../../../modules/nf-core/wget/main'

workflow WGET_SUBWF {
    take:
    urls     // Channel: tuple [ val(meta), val( url )      ]

    main:
    ch_versions         = Channel.empty()

    // Download file
    WGET {
        urls
    }

    }
    ch_versions = ch_versions.mix(WGET.out.versions.first().ifEmpty(null))

    emit:
    outfile     = WGET.out.outfile
    versions    = ch_versions.ifEmpty(null)
}

