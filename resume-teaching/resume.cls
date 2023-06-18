%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CV - RESUME CLASS FILE
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% This class file defines the structure and design of the template. 
%
% Original header:
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
% Created by Trey Hunner and modified by www.LaTeXTemplates.com
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% The original works were non-functional so changes in this template class
% added operational functionality and restructured to be usable in an actual
% LaTeX template.

\ProvidesClass{resume}

\LoadClass[11pt,letterpaper]{article} % Build on the article template class

% Required packages
\usepackage[parfill]{parskip}
\usepackage{array} 
\usepackage{ifthen}
\usepackage{hyperref}

\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    filecolor=magenta,      
    urlcolor=blue,
}

\pagestyle{empty} % Stop page numbering

%------------------------------------------------------------------------------
% Banner fields
%------------------------------------------------------------------------------

% Default name and address fields
\def \name#1{ \def\@name{#1} }
\def \@name {}
\def \addressSep{ $\diamond$ }
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

% Reading in an address
\def \address #1{
  \@ifundefined{@addresstwo}{
    \def \@addresstwo {#1}
  }{
  \@ifundefined{@addressthree}{
  \def \@addressthree {#1}
  }{
     \def \@addressone {#1}
  }}
}

% Printing an address field (with phone number)
\def \printaddress #1{
  \begingroup
    \def \\ {\addressSep\ }
    \centerline{#1}
  \endgroup
  \par
  \addressskip
}

% Pringing the name field
\def \printname {
  \begingroup
    \hfil{\MakeUppercase{\namesize\bf \@name}}\hfil
    \nameskip\break
  \endgroup
}

% Rewrite printing the document title fields
\let\ori@document=\document
\renewcommand{\document}{
  \ori@document 
  \printname 
  \@ifundefined{@addressone}{}{
    \printaddress{\@addressone}}
  \@ifundefined{@addresstwo}{}{
    \printaddress{\@addresstwo}}
     \@ifundefined{@addressthree}{}{ 
    \printaddress{\@addressthree}}
}

%------------------------------------------------------------------------------
% Section definition
%------------------------------------------------------------------------------

\newenvironment{ResumeSection}[1]{ % Args: section name
  \sectionskip
  \MakeUppercase{{\bf #1}}
  \sectionlineskip
  \hrule 
  % Take individual parts of the section
  \begin{list}{}{ 
    \setlength{\leftmargin}{0em} 
  }
  \item[]
}{
  \end{list}
}

%------------------------------------------------------------------------------
%	Dated Position field
%------------------------------------------------------------------------------

\newenvironment{DatedField}[4]{ % Args: company, period dates, title, location
  {\bf #1} \hfill {#2} % Company/name -> period dates
  \ifthenelse{\equal{#3}{}}{}{ % Don't print missing 3/4th args
    \\
    {\em #3} \hfill {\em #4}  % Position title -> location
  }\smallskip
  \begin{itemize}{\leftmargin=0em} % List environment \item entries
    \itemsep -0.5em \vspace{-0.5em} 
  }{
  \end{itemize}
  \vspace{0.5em}
}

% Whitespace functions
\def\namesize{ \LARGE } 
\def\nameskip{ \medskip } 
\def\sectionskip{ \medskip }
\def\addressskip{ \smallskip } 
\def\sectionlineskip{ \medskip } 