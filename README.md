# Hummingbird OpenAPI Generator Template

Template for Hummingbird App using OpenAPI Generator

Run the following to clone locally.
```bash
curl -L https://raw.githubusercontent.com/kicsipixel/openapi_template/refs/heads/main/scripts/download.sh | bash -s <project-name> 
```

Then enter the folder created, run `./configure.sh` and follow the instructions.

And then call the configure script with a path argument. This will create a new project at the specified path

```bash
./configure.sh <path to new project>
```

Default route is `/health`:

```bash
curl -i http://localhost:8080/health
```
