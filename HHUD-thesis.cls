\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hhud-thesis}[2024/12/09]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrbook}}

\ProcessOptions
\LoadClass[
    a4paper,%
    12pt,%
    headsepline,%
    chapterprefix,%
    parskip,%
    listof=totoc,%
    index=totoc,%
    bibliography=totoc,%
    cleardoublepage=empty,%
    DIV=14,%
]
{scrbook}

\PassOptionsToPackage{hyphens}{url} % breaks long URLs at hyphens % Do this early, so that if a package loads 'url', it will use this option.

\RequirePackage[T1]{fontenc} % Gibt Unicode Zeichen korrekt aus. (ö anstelle von "o)
\RequirePackage[utf8]{inputenc} % erlaubt direkte Eingabe von Unicode-Zeichen im Latex Code, insbesondere Umlaute % technisch nicht mehr notwendig, aber für die Sicherheit
\RequirePackage{babel} % Ersetzt "Section" mit "Abschnitt" etc. je nach Sprache
\RequirePackage[babel,tracking]{microtype}

%% Fonts 
\RequirePackage{newtxtext} % Times New Roman
\RequirePackage{newtxmath} % Times New Roman Math % Also loads amsmath and amssymb for extended math support
\RequirePackage[scaled=0.92]{helvet} % Set sans-serif font to Helvetica
\RequirePackage{courier} % Set monospaced font to Courier

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[style=apa, backend=biber]{biblatex}


%%%% Workarounds

\AddToHook{begindocument/before}{\@ifpackageloaded{minted}{\removefromtoclist[float]{lol}}{}}

\def\displaymath{\typeout{*** Do not use DISPLAYMATH. Use \[...\] instead ***}}
\def\eqnarray{\typeout{*** Do not use EQNARRAY(*). Use align(*)-environment instead ***}}


%%%%
\newcommand{\thesistypegerman}{\graduationlevel{}arbeit}

%% Title Page
\renewcommand{\maketitle}{%
\pdfbookmark[0]{\IfLanguageName{ngerman}{Titelseite}{Front Page}}{frontpage}

\begin{titlepage}
    \IfLanguageName{ngerman}{\includegraphics[width=102.5mm]{static/HHU_Logo_Wort-Bild-Marke_horizontal_RGB}}{\includegraphics[width=102.5mm]{static/Logo_HHU_+Name_EN_horizontal_rgb_+Safezone}}

\vspace{35mm}

% Titel
\begin{center}
    \textbf{\huge \@title}
    
    \textbf{\Large \@author}
\end{center}

\begin{center}

\end{center}

\vspace{25mm}

\begin{center}

{\Large \thesistype}

\IfLanguageName{ngerman}{Vorgelegt am Lehrstuhl für Softwaretechnik und Programmiersprachen.}{Presented at the Chair of Computer Networks.}

\vfill

\begin{tabular}[t]{ll}
  \IfLanguageName{ngerman}{Abgabe der Arbeit}{Submission}: & \DTMmonthname{\thesissubmissionmonth} \thesissubmissionyear \\
  \ifthenelse{\equal{\graduationlevel}{Seminar}}
  {% Seminararbeit
    \IfLanguageName{ngerman}{Betreuung}{Supervisor}:            & \thesissupervisor \\
  }
  {% Abschlussarbeit
    \IfLanguageName{ngerman}{Erstgutachten}{First Reviewer}:         & \firstreviewer \\
    \IfLanguageName{ngerman}{Zweitgutachten}{Second Reviewer}:       & \secondreviewer \\
    \ifthenelse{\equal{\firstreviewer}{\thesissupervisor}}%
    {%
      % falls Erstgutachten und Betreuung von selber Person, muss der Name hier nicht wiedehrolt werden
    }%
    {%
      \IfLanguageName{ngerman}{Betreuung}{Supervisor}:            & \thesissupervisor \\
    }%
  }
\end{tabular}
\end{center}
\end{titlepage}
}



\DefineBibliographyStrings{ngerman}{%
    mathesis = {Masterarbeit},
    bathesis = {Bachelorarbeit},
    phdthesis = {Dissertation}
}

\DefineBibliographyStrings{english}{%
    mathesis = {Master's Thesis},
    bathesis = {Bachelor's Thesis},
    phdthesis = {PhD Thesis}
}

\RequirePackage{ifpdf}
\RequirePackage{color}
\RequirePackage{setspace}
\RequirePackage[plainpages=false,pdfusetitle,pdfpagelabels]{hyperref}
\ifpdf
    \definecolor{brown}{cmyk}{0, 0.81, 1, 0.60}
    \hypersetup{%
      colorlinks=false, urlcolor=blue, citecolor=brown,
      bookmarksnumbered=true,
    }
\fi