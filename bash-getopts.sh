#!/bin/bash

foo() {
    if [ ! -z $1 ];then
        echo "foo arg: $1"
    fi
}
while getopts ":hs:t:p-:k-:" opt; do
  case "${opt}" in
    h)
        echo "Usage: $(basename "$0") [options]"
        echo "    -s            Source S3 path containing the pcap [optional], and the extrinsic yaml [required]"
        echo "    -t            Target S3 base path to upload outputs [optional]"
        echo "    -p            Run pcap_to_pcd only. Note this will also make skinny PCDs"
        echo "    -k            Make skinny PCDs from the full-size, segmentation PCDs"
        echo "    --max-scans   Debug: max number of scans to process: example --max-scans 10"
        exit 0
        ;;

    s) SOURCE_S3_PATH=$OPTARG
        ;;

    t) TARGET_S3_BASE_PATH=$OPTARG
        ;;

    p) PCD_ONLY=true
        ;;

    k) SEG_TO_SKINNY=true
        ;;

    -)
        case "${OPTARG}" in
            # get the val not the arg, no equal sign, e.g. --maxscans 123
            max-scans) MAX_SCANS="${!OPTIND}"
            ;;
            # get the val not the arg, with equal sign, e.g. --maxscans=123
            max-scans=*) MAX_SCANS=${OPTARG#*=}
            ;;
        esac;;

    *)
        echo "Invalid Option:" 1>&2
        exit 1
        ;;
  esac
done

echo "SOURCE_S3_PATH:       ${SOURCE_S3_PATH}"
echo "TARGET_S3_BASE_PATH:  ${TARGET_S3_BASE_PATH}"
echo "PCD_ONLY:             ${PCD_ONLY}"
echo "SEG_TO_SKINNY:        ${SEG_TO_SKINNY}"
echo "MAX_SCANS:            ${MAX_SCANS}"
foo "-asdf"
