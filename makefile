preview:
	quarto preview

render:
	quarto render

pdf:
	find . -name "*.qmd" -not -path "./_site/*" -not -path "./.quarto/*" -not -path "./.venv/*" -print0 | while IFS= read -r -d '' f; do quarto render "$$f" --to pdf; done

deploy:
	npx wrangler pages deploy _site --project-name=course-notes
