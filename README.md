# Jacob's Portfolio Website

This repo contains my personal static portfolio website. The site is created with markdown files using [Hugo](https://gohugo.io/) as a compiler.

The theme for this website is my own: [kortfolio](https://github.com/jacobkapitein/kortfolio).

# Development
You need to use Hugo extended. Install it using [this guide](https://gohugo.io/getting-started/installing/).
After that run `hugo server -D --bind 0.0.0.0`

# Serving using Docker
To serve this project using Docker, first build it:

`docker build -t portfolio-website .`

After that serve it:

`docker run -d -p {external_port}:80 --name portfolio-website-live portfolio-website`