accessing
artifactsFromRun: aJsonObject 
	| runName runUrl |
	runName := aJsonObject at: #fullDisplayName.
	runUrl := (aJsonObject at: #url) asZnUrl.
	^ (aJsonObject at: #artifacts)
		collect: [ :jsonArtifact | PhLJenkinsArtifact
					name: runName
					url: runUrl / 'artifact' / (jsonArtifact at: #relativePath) ]