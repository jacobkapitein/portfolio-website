---
title: "3D ISS Tracker"
date: 2022-05-19T23:12:54+02:00
draft: true
---

# 3D ISS Tracker
This project shows the live location of the International Space Station on a 3D globe. I decided to make this project after searching online for some challenging pragramming projects. A lot of those "top 10" lists said that creating an ISS tracker was pretty challenging. I didn't agree and added some spice to it: show the ISS location on a 3D globe.

## Demo
A demo can be found [here](/iss).

## Technologies used
As a quick summary, I used the following technologies and techniques:
- **Programming**:
    - TypeScript
    - ThreeJS

- **Deployment**:
    - Gulp
    - webpack
    - Docker
    - GitHub Actions

I decided to use TypeScript with [ThreeJS](http://threejs.org/). TheeJS is a JavaScript library which makes it easy to create 3D content on webpages. I found it pretty challenging to use.

## Challenges
During this project I overcame a few challenges.

1. **Displacement maps.**
I made use of displacement maps to make the globa a little more interesting. You can see the mountains sticking out of the globe. Those mountains are even on the real life place where they should be.
2. **Calculating the ISS position.** This was by far the most challenging thing to do. To be honest, I'm not a math genius. This was challenging because I retrieve the ISS coordinates from a public API. The coordinates are delivered in a "longitude-latitude" format. How would one place those 2D coordinates on a 3D globe? I overcame this challenge by dividing it into smaller problems. Positioning the coordinates around a cilinder is easy. Then I proceeded to translate the cilinder to a globe.
