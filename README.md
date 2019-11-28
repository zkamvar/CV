# Zhian N. Kamvar's CV

This is a repository for Zhian N. Kamvar's Curriculum Vitae and it's changes. No
material here may be used for commercial purposes.

This CV utilizes a modified version of [moderncv][0] version 1.2.0. I believe
many of the modifications had to do with spacing and removing elements deemed
unnecessary.

To render the CV on a UNIX system, use make:

```
make
make clean
``` 

Because the CV and Resume are meant to be rearranged to serve different purposes
(job applications, awards, etc), the design of these are meant to be a bit more
modular. All of the modular elements are kept in the [tex/][1] folder and used
with `\input{}` tags. 

## CV

The various sections of the CV live in the top level of the [tex/][1] folder and
are not restricted in length.

## Resume

The resume is tailored specifically for each job application. The main 
[ZNK_RESUME.tex](ZNK_RESUME.tex)
file simply contains one `\input{}` tag that imports resume bodies from the 
[tex/Resume/](tex/Resume/) directory.

## Cover letter

The cover letters all live in the [tex/Cover/](tex/Cover/) directory and can be
either included with the resume/cv with the `\input{}` tag, or can stand alone.

[0]: https://www.ctan.org/pkg/moderncv?lang=en
[1]: tex/
