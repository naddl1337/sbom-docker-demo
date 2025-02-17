Create a folder Tools next to your project folder.

Download cyclonedx cli into Tools folder: https://github.com/CycloneDX/cyclonedx-cli/releases

[//]: # (https://github.com/CycloneDX/cyclonedx-cli)

### check if exe is working
```sh
cd ..;cd Tools; .\cyclonedx-win-x64.exe --version
```

### generate .tar into Tools folder
``` sh
cd ..;cd Tools; docker save -o sbom-demo.tar sbom-docker-demo
```

### generate sbom with .tar (klappt noch nicht)
```
.\cyclonedx-win-x64.exe convert --input-file sbom-demo.tar --output-file sbom.xml --output-format xml
```