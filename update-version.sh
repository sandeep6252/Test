#!/bin/bash

# Function to validate version format
validate_version() {
    local version=$1
    if [[ ! $version =~ ^v[0-9]+\.[0-9]+\.[0-9]+(-beta)?$ ]]; then
        echo "Error: Invalid version format. Use vX.Y.Z or vX.Y.Z-beta"
        return 1
    fi
    return 0
}

# Update version using Jenkins CLI
update_version() {
    local controller=$1
    local new_version=$2

    # Validate version
    validate_version "$new_version"
    if [ $? -ne 0 ]; then
        return 1
    fi

    # Call Jenkins CLI to update version
    jenkins-cli groovy = <<EOF
        updateLibraryVersion('$controller', '$new_version')
    EOF

    if [ $? -ne 0 ]; then
        echo "Error: Failed to update version for controller $controller"
        return 1
    fi

    echo "Updated $controller to version $new_version"
    return 0
}

# Main script
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <controller> <new_version>"
    exit 1
fi

controller=$1
new_version=$2

update_version "$controller" "$new_version"
exit $?