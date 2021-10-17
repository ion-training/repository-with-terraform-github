# repository-with-terraform-github
Example on how to create a repository using terraform github provider

### How to use

Clone the repository
```
git clone https://github.com/ion-training/repository-with-terraform-github.git
```

```
cd repository-with-terraform-github
```

Initialize the workspace. It will download the github module.
```
terraform init
```

Add the token as an environment variable, see [Tip](https://github.com/ion-training/repository-with-terraform-github#tip-avoid-writing-in-history-list-the-secrets-typed-via-environment-variables) \
_   bellow token is fake_
```
 export TF_VAR_token="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"
```

Create the resource. \
_for brevity -auto-approve option was used_
```
terraform apply -auto-approve
```

### Sample output
```
$ terraform apply -auto-approve

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # github_repository.repository-with-terraform-github will be created
  + resource "github_repository" "repository-with-terraform-github" {
      + allow_merge_commit     = true
      + allow_rebase_merge     = true
      + allow_squash_merge     = true
      + archived               = false
      + default_branch         = (known after apply)
      + delete_branch_on_merge = false
      + description            = "My awesome brilliant fantastic marvelous quick efficient"
      + etag                   = (known after apply)
      + full_name              = (known after apply)
      + git_clone_url          = (known after apply)
      + html_url               = (known after apply)
      + http_clone_url         = (known after apply)
      + id                     = (known after apply)
      + name                   = "repo-from-terraform"
      + node_id                = (known after apply)
      + private                = (known after apply)
      + repo_id                = (known after apply)
      + ssh_clone_url          = (known after apply)
      + svn_url                = (known after apply)
      + visibility             = "public"
    }

Plan: 1 to add, 0 to change, 0 to destroy.
github_repository.repository-with-terraform-github: Creating...
github_repository.repository-with-terraform-github: Creation complete after 6s [id=repo-from-terraform]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
$
```

### How to create a token on github steps
Generate a token that allows terraform provider access to create a repository.

Navigate to settings:

![settings](./source/screenshots/2021-10-17-23-47-31.png)


Go to developer settings:
![developer-Settings](./source/screenshots/2021-10-17-23-52-16.png)


Click generate new token:
![generate-new-token](./source/screenshots/2021-10-17-23-53-50.png)


Generate a new token that would allow creation of repositories. \
_Suggestion is to not give delete permissions, if no delete permission terraform destroy would fail._

![access-for-token-generate](./source/screenshots/2021-10-18-00-12-11.png)
![copy-the-token](./source/screenshots/2021-10-18-00-09-11.png)

### Tip: avoid writing in history list the secrets typed via environment variables
Set your bash environment with a variable named [HISTCONTROL](https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html#index-HISTCONTROL) that contains value _ignorespace_:

```
HISTCONTROL=ignorespace
```
When typing sensitive variables in the CLI add a space character first.