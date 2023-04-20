#!/bin/bash
set -eufo pipefail

# Usage:
#   pass1.sh $START_DATE $END_DATE [$WORKER_ID $NUM_WORKERS]
# Ex:
#   pass1.sh 2019-06-13 2022-04-22 0 1

if [[ -z ${3:-""} && -z ${4:-""} ]]; then
/app/mimir-whisper-converter \
  --whisper-directory /input \
  --start-date $1 --end-date $2 \
  --intermediate-directory /output/intermediate \
  --blocks-directory /output/blocks/data \
  pass1
else
  --whisper-directory /input \
  --start-date $1 --end-date $2 \
  --intermediate-directory /output/intermediate \
  --blocks-directory /output/blocks/data \
  --workerID $3 \
  --workers $4 \
  pass1
fi
