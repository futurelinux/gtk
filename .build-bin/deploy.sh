#!/usr/bin/env bash
SCRIPT_DIR=$( dirname $( readlink -e $0 ) )
source "$SCRIPT_DIR/../.build-lib/ci-library.sh"
source "$SCRIPT_DIR/../.build-lib/ci-deploy-library.sh"

# get the list of packages to upload
_do list_upload_packages

if [ -z "$UPLOAD_LIST" ]; then
    _log success "Done nothing to upload!"
else
    # rsync upload
    _do upload_files $(get_repository)
    # akbm to add to the repository
    _do update_remote_db

    _log success "Done uploading!"
fi
