% =============================================================================
% ResumeKit - Black & White Single-Page Resume Class
% File: cv_template.cls
% Description: High-performance, ATS-optimized, modular resume class.
% =============================================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv_template}[2026/10/06 Modular ATS-Optimized Single-Page Resume Class]

% Base Document Class: 10pt base font on A4 paper
\LoadClass[10pt, a4paper]{article}

% --- Engine Detection & Font Setup ---
\RequirePackage{iftex}

\ifXeTeX
  \RequirePackage{fontspec}
  \RequirePackage{lmodern}
\else\ifluatex
  \RequirePackage{fontspec}
  \RequirePackage{lmodern}
\else
  \RequirePackage[T1]{fontenc}
  \RequirePackage[utf8]{inputenc}
  \RequirePackage{lmodern}
\fi\fi

% Explicit Unicode mapping for reliable PDF copy/paste and text extraction
\ifPDFTeX
  \input{glyphtounicode}
  \pdfgentounicode=1
\fi

% --- Core Utility & Formatting Packages ---
\RequirePackage{geometry}    % Page margins and dimensions
\RequirePackage{enumitem}    % Tight list item spacing control
\RequirePackage{hyperref}    % Hyperlink support
\RequirePackage{import}      % Modular file imports
\RequirePackage{etoolbox}    % TeX conditional logic & list helpers
\RequirePackage{catchfile}   % Reading external text files into macros

% --- Single-Page Geometry Parameters (Balanced & Elegant Full-Page A4) ---
\geometry{
  a4paper,
  top=0.38in,
  bottom=0.38in,
  left=0.48in,
  right=0.48in
}

\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}

\pagestyle{empty}

% --- Pure Black & White Link Styling (ATS Compliant) ---
\hypersetup{
  hidelinks,
  pdfborder={0 0 0},
  unicode=true
}
\AtBeginDocument{%
  \hypersetup{pdfauthor={\@cvname}, pdftitle={\@cvname\space - AI Engineer Resume}}%
}

% --- Minimal Underline Configuration (Subtle & ATS-Friendly) ---
\RequirePackage[normalem]{ulem}
\setlength{\ULdepth}{1.8pt}
\renewcommand{\ULthickness}{0.35pt}
\renewcommand{\underline}{\uline}

% --- Section Separation Rule Toggles & Custom Horizontal Rules ---
\newbool{drawsectionrules}
\setbool{drawsectionrules}{true}

\newcommand{\showrules}{\setbool{drawsectionrules}{true}}
\newcommand{\hiderules}{\setbool{drawsectionrules}{false}}

% Standalone custom horizontal line command spanning full textwidth
\newcommand{\cvrule}[1][0.55pt]{%
  \vspace{2pt}%
  \noindent\rule{\textwidth}{#1}\par%
  \vspace{2pt}%
}
\newcommand{\cvseparator}[1][0.55pt]{\cvrule[#1]}
\newcommand{\cvline}[1][0.55pt]{\cvrule[#1]}

% --- Set-and-Forget Auto-Fetching Contact & Profile Fields ---
\newcommand{\@cvname}{}
\newcommand{\@cvtagline}{}
\newcommand{\@cvphone}{}
\newcommand{\@cvemail}{}
\newcommand{\@cvlinkedin}{}
\newcommand{\@cvgithub}{}
\newcommand{\@cvwebsite}{}
\newcommand{\@cvlocation}{}
\newcommand{\@customcontacts}{}

\newcommand{\name}[1]{\renewcommand{\@cvname}{#1}}
\newcommand{\tagline}[1]{\renewcommand{\@cvtagline}{#1}}

\newcommand{\phone}[1][]{%
  \ifstrempty{#1}{%
    \IfFileExists{links/phone.tex}{\CatchFileDef{\@cvphone}{links/phone.tex}{\endlinechar=-1}}{}%
  }{%
    \renewcommand{\@cvphone}{#1}%
  }%
}

\newcommand{\email}[1][]{%
  \ifstrempty{#1}{%
    \IfFileExists{links/email.tex}{\CatchFileDef{\@cvemail}{links/email.tex}{\endlinechar=-1}}{}%
  }{%
    \renewcommand{\@cvemail}{#1}%
  }%
}

\newcommand{\linkedin}[1][]{%
  \ifstrempty{#1}{%
    \IfFileExists{links/linkedin.tex}{\CatchFileDef{\@cvlinkedin}{links/linkedin.tex}{\endlinechar=-1}}{}%
  }{%
    \renewcommand{\@cvlinkedin}{#1}%
  }%
}

\newcommand{\github}[1][]{%
  \ifstrempty{#1}{%
    \IfFileExists{links/github.tex}{\CatchFileDef{\@cvgithub}{links/github.tex}{\endlinechar=-1}}{}%
  }{%
    \renewcommand{\@cvgithub}{#1}%
  }%
}

\newcommand{\website}[1][]{%
  \ifstrempty{#1}{%
    \IfFileExists{links/website.tex}{\CatchFileDef{\@cvwebsite}{links/website.tex}{\endlinechar=-1}}{}%
  }{%
    \renewcommand{\@cvwebsite}{#1}%
  }%
}

\newcommand{\location}[1][]{%
  \ifstrempty{#1}{%
    \IfFileExists{links/location.tex}{\CatchFileDef{\@cvlocation}{links/location.tex}{\endlinechar=-1}}{}%
  }{%
    \renewcommand{\@cvlocation}{#1}%
  }%
}

\newcommand{\addcontact}[1]{%
  \ifdefempty{\@customcontacts}{%
    \gappto\@customcontacts{#1}%
  }{%
    \gappto\@customcontacts{\enspace\textbar\enspace #1}%
  }%
}
\newcommand{\addcontactlink}[2]{\addcontact{\href{#2}{#1}}}

\newbool{firstcontact}

% --- Clean Candidate Header Renderer ---
\newcommand{\makecvheader}{%
  \begin{center}
    {\fontsize{21}{25}\selectfont\bfseries \@cvname}\par
    \ifcsempty{@cvtagline}{}{%
      \vspace{2.5pt}%
      {\small \@cvtagline}\par
    }%
    \vspace{3.5pt}%
    {\footnotesize
      \setbool{firstcontact}{true}%
      \def\printitem##1{%
        \ifbool{firstcontact}{\setbool{firstcontact}{false}}{\hspace{5pt}\textbar\hspace{5pt}}##1%
      }%
      \ifcsempty{@cvemail}{}{\printitem{\href{mailto:\@cvemail}{\@cvemail}}}%
      \ifcsempty{@cvlinkedin}{}{\printitem{\href{https://linkedin.com/in/\@cvlinkedin}{linkedin.com/in/\@cvlinkedin}}}%
      \ifcsempty{@cvgithub}{}{\printitem{\href{https://github.com/\@cvgithub}{github.com/\@cvgithub}}}%
      \ifcsempty{@cvwebsite}{}{\printitem{\href{https://\@cvwebsite}{\@cvwebsite}}}%
      \ifcsempty{@cvlocation}{}{\printitem{\@cvlocation}}%
      \ifcsempty{@cvphone}{}{\printitem{\@cvphone}}%
      \ifcsempty{@customcontacts}{}{\printitem{\@customcontacts}}%
      \par
    }%
  \end{center}%
  \vspace{-2pt}%
}

% --- Single-Page Document Wrapper Environment ---
\newenvironment{fitpage}{%
  \pagestyle{empty}%
  \raggedbottom
}{%
}

% --- Section Headings (Full-Width ATS Format with Rules) ---
\newbool{thissectionrule}
\newcommand{\cvsectionheader}[2][false]{%
  \vspace{7pt}%
  {\large \bfseries \MakeUppercase{#2}}\par\nopagebreak
  \setbool{thissectionrule}{false}%
  \ifstrequal{#1}{true}{\setbool{thissectionrule}{true}}{}%
  \ifbool{drawsectionrules}{\setbool{thissectionrule}{true}}{}%
  \ifbool{thissectionrule}{%
    \vspace{2pt}%
    \hrule height 0.55pt width \textwidth\relax\nopagebreak
    \vspace{4pt}%
  }{%
    \vspace{3pt}%
  }%
}

\newenvironment{cvsection}[2][false]{%
  \cvsectionheader[#1]{#2}%
}{%
  \vspace{2pt}%
}

% --- Bullet Item List (Full Textwidth Spanning) ---
\newenvironment{cvlist}{%
  \begin{itemize}[
    leftmargin=12pt,
    rightmargin=0pt,
    itemsep=2pt,
    parsep=0pt,
    topsep=2pt,
    partopsep=0pt,
    label=\small\textbullet
  ]%
}{%
  \end{itemize}%
}

% --- Experience & Project Entries (Full-Width \hfill Alignment) ---
\newenvironment{cventry}[4]{%
  \vspace{3.5pt}%
  \noindent\textbf{#1} \hfill \textbf{#4}\par\nopagebreak
  \vspace{1.5pt}%
  \noindent\textit{#2} \hfill \textit{#3}\par\nopagebreak
  \begin{cvlist}%
}{%
  \end{cvlist}%
}

\newcommand{\cventrysimple}[4]{%
  \vspace{3pt}%
  \noindent\textbf{#1} \hfill \textbf{#4}\par\nopagebreak
  \vspace{1.5pt}%
  \noindent\textit{#2} \hfill \textit{#3}\par
}

\newenvironment{cvproject}[2]{%
  \vspace{3.5pt}%
  \noindent #1 \ifstrempty{#2}{}{\hfill #2}\par\nopagebreak
  \begin{cvlist}%
}{%
  \end{cvlist}%
}

\newcommand{\cvskill}[2]{%
  \noindent\textbf{#1:} #2\par\vspace{2.5pt}%
}
