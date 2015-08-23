Title: [HOW-TO] Make a website with GitHub Pages and Pelican
Date: 2015-5-18 
Tags: how-to, web-dev

---
This article is intended for audience who has some knowledge on GitHub Pages and
Pelican, but was unable to integrate two successfully. Therefore, many steps
below assume you are fully aware of the consequence and the context of commands
to be executed. Since there are already many instructional guides for GitHub
Pages and Pelican, my main focus will be on how to incorporate Pelican into
GitHub Pages.
---

Although GitHub Pages and Pelican are very easy to use on their own, I had a
trouble integrating them together. The main difficulty was GitHub Pages trying
to build a website with files on root when Pelican generates the website on
subfolder called 'output'. 

Some bloggers suggested creating two separate GitHub repos: one for entire files
and another for just the output folder. However, I did not like the idea of
having to keep track of two different repositories for one project. 

At one point or another, I thought of moving to Jekyll which is officially
supported by GitHub Pages, but I like Python more, so I decided to stick to it.
After a few hours of struggle, this is what I came to:


1. Create your GitHub repo that will store your website. It doesn't have to
follow the `username.github.io` format (my repo is named `website`).

2. Make .gitignore with

    ```
    output/
    ```

3. Create a skeleton project with `pelican-quickstart`.

4. After you finish writing contents and customizing, you can generate
your site with `pelican content`. By default, this will create your website
structure on 'output' folder.

5. Install ghp-import (`pip install ghp-import`) and do `ghp-import output`. To quote the creator, it is "a
script that can copy a directory to the gh-pages branch of the repository." More information about
ghp-import [here](https://github.com/davisp/ghp-import). 

6. Then, to update your changes online, `git push origin gh-pages` 

7. Finally, `git add .` and `git commit -m "your message"` on project's root
directory and push it to master with `git push origin master`. 


At this point, your website will be hosted on
https://`username`.github.io/`project_name`. Replace `username` and
`repo_name` with your own GitHub username and repository name, respectively. 

The main idea is to store all your code in one repository but divide generating
source code and the output folder into two different branches. The source code
will be stored in the master branch while the output folder will be stored in
gh-pages which is used to render the website.

When you want to make further changes, you can repeat process 4~7 until you are
satisfied.  Also, 5 and 6 could be combined by `ghp-import -p output`. 

