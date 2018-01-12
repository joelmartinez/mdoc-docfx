# Publishing Documentation with `mdoc` and `docfx`

After fetching this repository, in a terminal that has `msbuild` on the path, run the following command:

```
msbuild docs.proj
```

This will compile the sample project, update the _EcmaXML_ using _mdoc_ in the `docs` folder, and then initialize the documentation website using _docfx_ in the `content` folder, and the ready-to-publish HTML content can be found in teh `out/site/_site` folder.

If you want to preview it locally, you can run 

```
msbuild docs.proj /t:Docs_Serve
```

And then visit `http://localhost:8080` in your browser.
