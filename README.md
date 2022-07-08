# Stat Block Markdown Converter

[![GitHub package.json version](https://img.shields.io/github/package-json/v/Nereare/stat-block-md-converter)](https://github.com/Nereare/stat-block-md-converter)
[![License](https://img.shields.io/github/license/Nereare/stat-block-md-converter.svg)](LICENSE.md)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](CODE-OF-CONDUCT.md)

Markdown converter from 5e.tools homebrew tools to Homebrewery v3. :game_die:

## Installing

0. Make sure you have the executable dependencies first:
    1. [Yarn](https://yarnpkg.com/); e
    2. [Sass](https://sass-lang.com/);
1. Clone the repository:
    1. Navigate to the folder where you want to clone the repo; and
    2. Execute: `git clone https://github.com/Nereare/stat-block-md-converter.git`;
2. Go to the repo:
    1. Windows' `cmd`: `Set-Location -Path Path\To\Repo`;
    2. Unix or Windows `PowerShell`: `cd path/to/repo`;
3. Install the repo dependencies: `yarn` or `yarn install`;
4. Compile the style CSS:
    1. Execute `sass style.scss:style.css --style=compressed`;
         - While the parameter `--style=compressed` isn't **needed**, it helps to spare a couple bytes of filespace;
5. Copy all the files to your server (local or remote);
    1. The dotfolders and dotfiles may be ignored;
6. Ready, you can use the tool now! :tada:

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :tada:

Please, also read our [Contributing Guidelines](CONTRIBUTING.md).

### Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CODE-OF-CONDUCT.md).

By participating in this project you agree to abide by its terms.

## History & Versioning

See the [Change Log](CHANGELOG.md) for further history.

This project uses [SemVer](http://semver.org/) for versioning. For the versions
available, see the [tags on this repository](https://github.com/Nereare/stat-block-md-converter/tags).

## License

This project is available under the [Do What The F*ck You Want To Public License](http://www.wtfpl.net/).
