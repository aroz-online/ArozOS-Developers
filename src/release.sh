#/bin/bash

# Build the static website
echo "Constructing new static site"
hugo

# Remove the old site
echo "Removing the old pages"
cd ../
rm -rf ./docs/

# Copy the new public folder over to docs/
echo "Copying to production"
mkdir ./docs/
cp -a ./src/public/* ./docs/

# Back to the src folder
cd ./src
echo "Done"