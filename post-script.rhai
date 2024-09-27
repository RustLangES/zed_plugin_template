let release = variable::get("deploy_release");
let plugin_id = variable::get("plugin_id");

if release {
    system::command("cargo", ["dist", "init", "-y", "--tag", `${plugin_id}-v0.0.1`]);

    print(`
    Post-Installation Instructions:

    1. Set up the following environment variables in your GitHub Actions:
       - COMMITTER_TOKEN: This should be a Personal Access Token (PAT) with repo and workflow scopes to authenticate the actions.

    2. Configure cargo-release:
       - Add release.toml to your project root for customizing the release process.
       - To release a new version, run the following command:
         cargo release -x patch|minor|major|alpha|beta

       - This will handle version bumping, git tagging, and pushing new tags to the repository.

    3. The release action in the workflow will automatically create a changelog and publish the release based on the tags pushed.

    4. Check the .github folder to replace some variables
    `);
}
