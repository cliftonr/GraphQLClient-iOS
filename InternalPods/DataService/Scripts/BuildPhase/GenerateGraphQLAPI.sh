#!/bin/sh

APOLLO_FRAMEWORK_PATH="$(eval find $FRAMEWORK_SEARCH_PATHS -name "Apollo.framework" -maxdepth 1)"

if [ -z "$APOLLO_FRAMEWORK_PATH" ]; then
echo "error: Couldn't find Apollo.framework in $FRAMEWORK_SEARCH_PATHS; make sure to add the framework to your project."
exit 1
fi

DATA_SERVICE_DIR=$PODS_TARGET_SRCROOT
GRAPHQL_SCHEMA_FILEPATH="$DATA_SERVICE_DIR/Resources/GraphQLSchema.json"
GRAPHQL_API_FILEPATH="$DATA_SERVICE_DIR/Sources/Platform/GraphQL/Generated/GraphQLAPI.swift"
GRAPHQL_SERVICES_DIR="$DATA_SERVICE_DIR/Sources/Platform/GraphQL/Services"

cd $GRAPHQL_SERVICES_DIR
$APOLLO_FRAMEWORK_PATH/check-and-run-apollo-cli.sh codegen:generate --queries="$(find . -name '*.graphql')" --schema=$GRAPHQL_SCHEMA_FILEPATH $GRAPHQL_API_FILEPATH
