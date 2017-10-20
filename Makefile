MDOC.EXE = mono packages/mdoc.5.1.0/tools/mdoc.exe
ECMA2YAML.EXE = mono packages/Microsoft.DocAsCode.ECMA2Yaml.1.0.269/tools/ECMA2Yaml.exe
DOCFX.EXE = mono packages/docfx.console.2.25.1/tools/docfx.exe

all: out/bin/samplecode.dll mdoc docfx ecma2yaml publish

# compile the assembly that we'll use to generate documentation for
out/bin/samplecode.dll:
	mkdir -p out
	mkdir -p out/bin
	csc src/samplecode.cs /t:library /out:out/bin/samplecode.dll

mdoc: out/bin/samplecode.dll restore
	$(MDOC.EXE) update out/bin/samplecode.dll -out docs --debug

# fetch the ecma2yaml and docfx packages
restore: packages
packages:
	nuget restore -PackagesDirectory packages

# run ecma2yaml to generate the docfx-friendly output
ecma2yaml: mdoc restore docfx
	$(ECMA2YAML.EXE) --source=docs --output=content/api
	
# docfx, finally, will generate the static html site
docfx: restore content
content:
	$(DOCFX.EXE) init -q -o content

serve: restore
	$(DOCFX.EXE) content/docfx.json -o out/site --serve

publish: docfx
	$(DOCFX.EXE) content/docfx.json -o out/site

.PHONY: ecma2yaml mdoc clean publish

clean:
	rm -rf packages
	rm -rf docs
	rm -rf content/api
	rm -rf out
	rm -f samplecode.dll XmlYamlMapping.json log.json