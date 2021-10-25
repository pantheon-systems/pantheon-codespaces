# Copy over wordpress settings
cp /workspaces/$(echo $RepositoryName)/.devcontainer/src/wordpress/wp-config-local.php /workspaces/$(echo $RepositoryName)/wp-config-local.php

# Copy over .htaccess
cp /workspaces/$(echo $RepositoryName)/.devcontainer/src/wordpress/.htaccess /workspaces/$(echo $RepositoryName)/.htaccess