# Publishing Documentation with `mdoc` and `docfx`

After fetching this repository, in a terminal that has `dotnet` on the path, run the following command:

```
msbuild ./src/samplecode.csproj -target:Docs
```

This will compile the sample project, update the _EcmaXML_ using _mdoc_ in the `docs` folder, and then initialize the documentation website using _docfx_ in the `content` folder, and the ready-to-publish HTML content can be found in the `out/site/_site` folder.

If you want to preview it locally, you can run the command shown at the end of the `-target:Docs` build; the message will be something like:

```
  to preview, run the following command:
  C:\Users\marj\.nuget\packages\docfx.console\2.30.0\tools\docfx.exe ..\content\docfx.json -o ..\out\site --serve
```

And then visit `http://localhost:8080` in your browser.

## How to use