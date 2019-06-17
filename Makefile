charts:= argo argo-ci argo-events argo-cd

clean: 
	rm -rf output

build: clean ${charts}

${charts}: 
	mkdir -p output
	cd output && helm package ../charts/$@

deploy: build
	for file in output/* ; do \
		helm s3  push $$file exo-charts; \
	done;