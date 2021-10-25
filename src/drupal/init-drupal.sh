# Copy over local settings to Drupal codebase.
cp /workspaces/$(echo $RepositoryName)/.devcontainer/src/drupal/settings.local.php /workspaces/$(echo $RepositoryName)/sites/default/settings.local.php