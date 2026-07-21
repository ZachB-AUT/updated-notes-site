preview:
	quarto preview

render:
	quarto render

deploy: render
	npx wrangler pages deploy _site --project-name=course-notes
