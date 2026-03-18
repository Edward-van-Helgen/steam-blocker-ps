<a id="readme-top"></a>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/Edward-van-Helgen/steam-blocker-ps">
    <img src="Assets/Icon.png" alt="Steam Blocker PS Logo" width="80" height="80">
  </a>

<h3 align="center">steam-blocker-ps</h3>

  <p align="center">
    PowerShell Scripts to block Steam on Windows via Windows Firewall Rules.
    <br />
    <a href="https://github.com/Edward-van-Helgen/steam-blocker-ps"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    &middot;
    <a href="https://github.com/Edward-van-Helgen/steam-blocker-ps/issues/new?labels=bug&template=bug-report---.md">Report Bug</a>
    &middot;
    <a href="https://github.com/Edward-van-Helgen/steam-blocker-ps/issues/new?labels=enhancement&template=feature-request---.md">Request Feature</a>
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

[![steam-blocker-ps Screenshot][product-screenshot]](https://github.com/Edward-van-Helgen/steam-blocker-ps)

PowerShell Scripts to block Steam on Windows via Windows Firewall Rules so you can ...

- ... be sure that Offline-Mode is really offline
- ... prevent being kicked from Steam Family Share
- ... quick toggle (faster than switching to Steam Offline Mode)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

* [![Powershell][Powershell]][Powershell-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

This project contains multiple scripts. The two main scripts are `Block-Steam.ps1` and `Unblock-Steam.ps1` for enabling/disabling Steam sending or receiving data.

Other scripts in this repository will offer additional features such as:

* System Tray Icon (`SysTray-SteamBlocker.ps1`)
* Autostart (`Register-ScheduledTask.ps1`)
* Add Cmdlet to PowerShell Profile (`Add-To-PSProfile.ps1`)

### Prerequisites

You need to be able to run programs as administrator:

* Press the Windows Key to open the Windows Start Menu.
* Type `powershell`
* Right click on `powershell` and select `Run as Administrator`

### Installation

While you could manually execute the scripts to block/unblock Steam from accessing the web you could also install the script. To do so, run the following command from an elevated prompt within the project directory (see [Prerequisites](#prerequisites)):

* Navigate to the project directory:

  ```sh
  cd 'c:\Users\YourUsername\Downloads\steam-blocker-ps'
  ```

* Run:

  ```sh
  Register-ScheduledTask.ps1
  ```

#### Uninstall

To remove the execution of the script, simply run the following command from an elevated prompt:

* Navigate to the project directory:

  ```sh
  cd 'c:\Users\YourUsername\Downloads\steam-blocker-ps'
  ```

* Run:

  ```sh
  Unregister-ScheduledTask.ps1
  ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- USAGE EXAMPLES -->
## Usage

### Run script files manually

* Open a PowerShell instance as described in [Prerequisites](#prerequisites).
* Navigate to the directory with the .ps1 script files:

  ```shell
  cd 'c:\Users\YourUsername\Downloads\steam-blocker-ps'
  ```

* Run `Block-Steam.ps1` or `Unblock-Steam.ps1` to block/unblock steam internet access.

### Register as Profile functions for easier access

* Open a PowerShell instance as described in [Prerequisites](#prerequisites).
* Navigate to the directory with the .ps1 script files:

  ```shell
  cd 'c:\Users\YourUsername\Downloads\steam-blocker-ps'
  ```

* Run `Add-To-PSProfile.ps1`
* Restart PowerShell by closing the window and opening a new instance as described above.
* You should now be able to utilize the functions `Block-Steam` and `Unblock-Steam` from anywhere within PowerShell.

### Run as SysTray Icon

You can add a little icon to easily block/unblock Steam with a simple click:

* Open a PowerShell instance as described in [Prerequisites](#prerequisites).
* Navigate to the directory with the .ps1 script files:

  ```shell
  cd 'c:\Users\YourUsername\Downloads\steam-blocker-ps'
  ```

* Run `SysTray-SteamBlocker.ps1`

You should now see the Steam Blocker Icon in your SysTray.

#### Automatically start with Windows

Additionally you can register a scheduled task to run the Steam Blocker SysTray Icon on Windows startup. See [Installation](#installation).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/Edward-van-Helgen/steam-blocker-ps/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->
## Contributing

Any contributions you make are **welcome**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Top contributors

<a href="https://github.com/Edward-van-Helgen/steam-blocker-ps/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=Edward-van-Helgen/steam-blocker-ps" alt="contrib.rocks image" />
</a>

<!-- LICENSE -->
## License

Distributed under the MIT License. See [LICENSE.md](LICENSE.md) for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

Project Link: [https://github.com/Edward-van-Helgen/steam-blocker-ps](https://github.com/Edward-van-Helgen/steam-blocker-ps)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

See [CREDITS.md](CREDITS.md) for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/Edward-van-Helgen/steam-blocker-ps.svg?style=for-the-badge
[contributors-url]: https://github.com/Edward-van-Helgen/steam-blocker-ps/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Edward-van-Helgen/steam-blocker-ps.svg?style=for-the-badge
[forks-url]: https://github.com/Edward-van-Helgen/steam-blocker-ps/network/members
[stars-shield]: https://img.shields.io/github/stars/Edward-van-Helgen/steam-blocker-ps.svg?style=for-the-badge
[stars-url]: https://github.com/Edward-van-Helgen/steam-blocker-ps/stargazers
[issues-shield]: https://img.shields.io/github/issues/Edward-van-Helgen/steam-blocker-ps.svg?style=for-the-badge
[issues-url]: https://github.com/Edward-van-Helgen/steam-blocker-ps/issues
[license-shield]: https://img.shields.io/github/license/Edward-van-Helgen/steam-blocker-ps.svg?style=for-the-badge
[license-url]: https://github.com/Edward-van-Helgen/steam-blocker-ps/blob/master/LICENSE.md
[product-screenshot]: Assets/systray.gif
<!-- Shields.io badges. You can a comprehensive list with many more badges at: https://github.com/inttter/md-badges -->
[Powershell]: https://img.shields.io/badge/Powershell-20232A?style=for-the-badge
[Powershell-url]: https://learn.microsoft.com/en-us/powershell/