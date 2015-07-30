% identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{aplreport}[2015/07/22]
% initial code
% declaration of options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
% execution of options
\ProcessOptions \relax
% package loading
\LoadClass[a4paper,twoside,10pt]{article}
\RequirePackage[hyphens]{url}
\RequirePackage[usenames]{color}
\RequirePackage[colorlinks,linkcolor=black]{hyperref}
\RequirePackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\RequirePackage[swedish]{babel}
\RequirePackage{titlesec}
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{txfonts}
\RequirePackage{eso-pic}
\RequirePackage{etoolbox}
\RequirePackage{fancyhdr}
\RequirePackage[top=5cm, bottom=3cm, left=3cm, right=3cm, headheight=17pt]{geometry}
\RequirePackage{tabularx}
\RequirePackage{array}
\RequirePackage{multirow}
\RequirePackage{hhline}
\RequirePackage{colortbl}
\RequirePackage[table,usenames,dvipsnames]{xcolor}
\RequirePackage[font=it,labelfont={it,bf}]{caption}
\RequirePackage[pdftex]{graphicx}
\RequirePackage{setspace}
\RequirePackage[numbers]{natbib}

% main code
\titleformat*{\section}{\Large\bf\sffamily}
\titleformat*{\subsection}{\large\bf\sffamily}

\fancyhead[LE,RO]{\includegraphics[height=13pt]{base_figures/SMHI_logo.pdf}}
\fancyhead[LO,RE]{\textsc{\leftmark}}
\fancyfoot[LE,RO]{\thepage}
\fancyfoot[C]{}
\fancyfoot[LO,RE]{Nr \@docnumber{} -- \@shorttitle}
\pagestyle{fancy}


%Commands
\renewcommand{\sectionmark}[1]{\markboth{#1}{}}
\def\subtitle#1{\def\@subtitle{#1}}
\def\titlepagecaption#1{\def\@titlepagecaption{#1}}
\newcommand{\printtitlepagecaption}{\noindent\textit{\@titlepagecaption}}
\newcommand\AtPageMyUpperRight[1]{\AtPageLowerLeft{%
\put(\LenToUnit{0.7\paperwidth},\LenToUnit{0.87\paperheight}){#1}}}
\newcommand\AtPageMyUpperLeft[1]{\AtPageLowerLeft{%
    \put(\LenToUnit{3cm},\LenToUnit{0.87\paperheight}){#1}}}
\def\titlepagefigure#1{\def\@titlepagefigure{#1}}
\def\titlepagecaptionfigure#1{\def\@titlepagecaptionfigure{#1}}
\def\proofdate#1{\def\@proofdate{#1}}
\def\proofreader#1{\def\@proofreader{#1}}
\def\dnr#1{\def\@dnr{#1}}
\def\version#1{\def\@version{#1}}
\def\docnumber#1{\def\@docnumber{#1}}
\def\projectleader#1#2#3#4#5{\def\@projectleadername{#1}\def\@projectleaderstreet{#2}\def\@projectleaderaddress{#3}\def\@projectleaderphone{#4}\def\@projectleaderemail{#5}}
\def\receivercompany#1#2#3#4#5{\def\@receivercompanyname{#1}\def\@receivercompanystreet{#2}\def\@receivercompanyaddress{#3}\def\@receivercompanyphone{#4}\def\@receivercompanyemail{#5}}
\def\receiverperson#1#2#3#4#5{\def\@receiverpersonname{#1}\def\@receiverpersonstreet{#2}\def\@receiverpersonaddress{#3}\def\@receiverpersonphone{#4}\def\@receiverpersonemail{#5}}
\def\keywords#1{\def\@keywords{#1}}
\def\misc#1{\def\@misc{#1}}
\def\shorttitle#1{\def\@shorttitle{#1}}

\newbool{secret}
\newenvironment{sansserif}{\fontfamily{ppl}\selectfont}{\par}

\title{}
\author{}
\subtitle{}
\shorttitle{}
\titlepagefigure{}
\titlepagecaption{}
\titlepagecaptionfigure{}
\proofdate{}
\proofreader{}
\dnr{}
\version{}
\docnumber{}
\projectleader{}{}{}{}{}
\receivercompany{}{}{}{}{}
\receiverperson{}{}{}{}{}
\keywords{}
\misc{}
\shorttitle{}

\newcommand\makemetadata{
  %\hypersetup{pdftitle=\@title, pdfauthor=\@author}
  \pdfinfo{
    /Title      (\@title)
    /Author     (\@author)
    /Keywords   (\@keywords)
  }
}

\renewcommand\maketitle{
  \begin{titlepage}
    \hypersetup{pageanchor=false}
    \AddToShipoutPictureBG*{
      \AtPageMyUpperRight{{\includegraphics[width=4cm,keepaspectratio]{base_figures/SMHI_logo.pdf}}}
    }

    \vspace*{5cm}
    \begin{flushleft}
      {\Large\bf{\sffamily \@author}} \newline \\[1cm]
      {\Large\bf{\sffamily\textsc{Rapport nr} \@docnumber}} \newline \newline
      {\huge\bf{\sffamily\@title} }%
      \ifdefempty{\@subtitle}{\\[0.8cm] ~}{\\[0.3cm] \LARGE\bf{\sffamily\@subtitle}}\\[2cm]
    \end{flushleft}

    \ifdefempty{\@titlepagefigure}{}{    
      \begin{center}
        \fbox{
          \includegraphics[height=8.0cm]{\@titlepagefigure}
	}
      \end{center}
    }
  \end{titlepage}
}

\newcommand\titlepageback{
  \hypersetup{pageanchor=false}
  \thispagestyle{empty}
  \printtitlepagecaption
  \ifdefempty{\@titlepagecaptionfigure}{}{
    \\
    \\
    \includegraphics[height=3cm]{\@titlepagecaptionfigure}
  }
  \vspace*{\fill}
  \cleardoublepage
}

\newcommand\detailspage{
  \cleardoublepage
  \hypersetup{pageanchor=false}
  \thispagestyle{empty}
  \AddToShipoutPictureBG*{
    \AtPageMyUpperLeft{{\includegraphics[width=4cm,keepaspectratio]{base_figures/SMHI_logo.pdf}}}
  }
  \onehalfspacing
  \begin{center}
    \sffamily
    \begin{tabularx}{\textwidth}{p{6cm} p{6cm} l l}
      Författare: & Mottagare: & &\\
      \textbf{\@author} & \textbf{\@receivercompanyname} & &\\
      Granskningsdatum: & Granskare: & Dnr: & Version\\
      \normalsize
      \@proofdate & \@proofreader & {\bf \@dnr } & {\bf \@version }\\
      \hline
      \end{tabularx}
  \end{center}

  \vspace*{6cm}
  \begin{flushleft}
    {\Large \bf \sffamily \@title}
    \ifdefempty{\@subtitle}{~}{\\[0.3cm] \noindent \Large\bf{\sffamily\@subtitle}}\\
  \end{flushleft}
  %%
  \vfill
  \begin{center}
    \sffamily
    \begin{tabular}{p{0.5\textwidth} p{0.5\textwidth} }
      \hline
      \scriptsize{Uppdragstagare} & \scriptsize{Projektansvarig} \\
      SMHI & \ifdefempty{\@projectleadername}{ }{\@projectleadername}\\
      601 76 Norrköping & \ifdefempty{\@projectleaderphone}{ }{\@projectleaderphone}\\
      & \ifdefempty{\@projectleaderemail}{ }{\@projectleaderemail}\\
      \hline
      \scriptsize{Uppdragsgivare} & \scriptsize{Kontaktperson} \\
      \parbox{0.45\textwidth}{
        \ifdefempty{\@receivercompanyname}{}{\@receivercompanyname}
        \ifdefempty{\@receivercompanystreet}{}{\\\@receivercompanystreet}
        \ifdefempty{\@receivercompanyaddress}{}{\\\@receivercompanyaddress}
        \ifdefempty{\@receivercompanyphone}{}{\\\@receivercompanyphone}
        \ifdefempty{\@receivercompanyemail}{}{\\\@receivercompanyemail}
      } &
      \parbox{0.45\textwidth}{
        \ifdefempty{\@receiverpersonname}{}{\@receiverpersonname}
        \ifdefempty{\@receiverpersonstreet}{}{\\\@receiverpersonstreet}
        \ifdefempty{\@receiverpersonaddress}{}{\\\@receiverpersonaddress}
        \ifdefempty{\@receiverpersonphone}{}{\\\@receiverpersonphone}
        \ifdefempty{\@receiverpersonemail}{}{\\\@receiverpersonemail}
      } \\[0.5cm]
      \hline
      \multicolumn{2}{l}{\scriptsize{Klassificering}} \\
      \multicolumn{2}{l}{
        (\ifbool{secret}{ }{X}) Allmän
        (\ifbool{secret}{X}{ }) Affärssekretess
      }\\
      \hline
      \multicolumn{2}{l}{\scriptsize{Nyckelord}} \\
      \multicolumn{2}{l}{\@keywords} \\
      \hline
      \multicolumn{2}{l}{\scriptsize{Övrigt}} \\
      \multicolumn{2}{l}{\@misc} \\
      \hline
    \end{tabular}
  \end{center}
  %\end{table}
  \clearpage
  \thispagestyle{empty}
  \cleardoublepage

}

\newcommand{\toc}{
  \hypersetup{pageanchor=false}
  \thispagestyle{empty}
  \tableofcontents
  \clearpage{\pagestyle{empty}\cleardoublepage}
  \setcounter{page}{1}
}

\newcommand\makeappendix{\par
  \clearpage
  \section*{Appendix}
  \appendix
} 

\newcommand{\maketitlepages}{
  \makemetadata
  \maketitle
  \titlepageback
  \detailspage
  \toc
}

\newcommand{\newevenside}{
  \ifnumodd{\value{page}}{\newpage}{
    \clearpage
    \phantom{placeholder} % doesn't appear on page
    \thispagestyle{empty} % if want no header/footer
    \newpage
  }
}

\AtEndDocument{
  \clearpage
  \newevenside
  \thispagestyle{empty}
  \vspace*{17cm}
  \begin{center}
    \includegraphics[height=13pt]{base_figures/SMHI_logo.pdf}\\
    Sveriges Meteorologiska och Hydrologiska Institut\\
    601 76 Norrköping\\
    Tel. +46 11 -- 495 8000 Fax +46 11 -- 495 8001
  \end{center}
}
