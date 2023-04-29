![CI](https://github.com/github/docs/actions/workflows/test.yml/badge.svg)

# Link checks action

The Link Checks Action is a GitHub Action that checks if the links provided in a file are valid. It ensures that the links return a 200 response code and do not return an error. This is a safety net to ensure that URLs are not shipped broken due to mistakes that may occur during copy-pasting or refactoring.

## Hot to use
To use this action, add it to your YML file and specify the file or files you want to check.
```yml
- name: Run URL check script
  uses: adriancoman/link-checks-action@0.1.0
  with:
    file-to-check: "{path_to_your_file}"
```

You can add multiple files as well, if they are comma separated:
```yml
- name: Run URL check script
  uses: adriancoman/link-checks-action@0.1.0
  with:
    file-to-check: "{path_to_1st_file},{path_to_2nd_file},{path_to_3rd_file}"
```

## Use cases
This action is particularly useful for mobile apps that hold external links in a file with constant values. For example:
```kotlin
object UrlConstants {
    const val TERMS = "https://www.my_awesome_website.com/terms.html"
    const val PRIVACY = "https://www.my_awesome_website.com/privacy.html"
}
```
By using the Link Checks Action, you can be notified if a URL is broken.


## Contribution
There are a lot of improvements that can be added, from the top of my head:
- Check only modified files
- ~Accept a list of params, instead of a single file~
- Change the http response code to be valid in the intervel [200..300)

However, for now, it is a simple script that works and does its job.

## Full working example
The YAL file bellow is a working example of how to use the Link Checks Action in your workflow.
```yml
on:
  pull_request:
    branches:
      - '**'

jobs:
  check_urls:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v2
      - name: Link check action
        uses: adriancoman/link-checks-action@0.1.0
        with:
          file-to-check: "components/src/main/java/app/components/ui/misc/terms/UrlConstants.kt"
```
