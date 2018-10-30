%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% JASA-EL.cls                                   %%
%% September 19, 2017                            %%
%% Copyright 2017 Acoustical Society of America  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% JASA-El.cls
%% Developed by Amy Hendrickson
%% TeXnology Inc
%% http://www.texnology.com
%% amyh@texnology.com
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\currversion{.999}

%%
%%    These files are distributed
%%    WITHOUT ANY WARRANTY; without even the implied warranty of
%%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
%% 
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}%
%%
%%%     date            = "2/15/2017",
%%%     author          = "Amy Hendrickson (mailto:amyh@texnology.com)" 

%%% This work may be distributed and/or modified under the 
%%% conditions of the LaTeX Project Public License, either version 1.3c 
%%% of this license or (at your option) any later version.
%%% The latest version of this license is in
%%%  http://www.latex-project.org/lppl.txt
%%% and version 1.3 or later is part of all distributions of LaTeX 
%%% version 2005/12/01 or later.
%
%%% This work has the LPPL maintenance status `maintained'.
%
%%% The Current Maintainer of this work is Arthur Newhall <anewhall@whoi.edu> 
%%% This work consists of the file JASA-EL.cls

%%%     copyright       = "Copyright (C) 2017 Acoustical Society of America
%%%
%%%                        This work may be distributed and/or modified under the
%%%                        conditions of the LaTeX Project Public License, either version 1.3
%%%                        of this license or (at your option) any later version.
%%%                        The latest version of this license is in
%%%                        http://www.latex-project.org/lppl.txt
%%%                        and version 1.3 or later is part of all distributions of LaTeX
%%%                        version 2003/12/01 or later.
%%%
%%%                        This work has the LPPL maintenance status "maintained".
%%%
%%%                        The Current Maintainer of this work is the Acoustical Society of America.
%%%
%%%                        This work consists of all files listed in the document README.
%%%
%%%     address         = "Acoustical Society of America,
%%%                        USA",
%%%     telephone       = "+1 ???",
%%%     FAX             = "",
%%%     email           = "anewhall@whoi.edu
%%%     codetable       = "ISO/ASCII",
%%%     keywords        = "latex, JASATeXnew, journal",
%%%     supported       = "yes",
%%%     abstract        = "formatter for JASA journal submissions",
%%%  }

\ProvidesClass{JASA-El}%%%
 [2017/08/10 Version 1, markup document class]%
{}
\ClassInfo{JASA-El}{%
^^J
Written by Amy Hendrickson, amyh@texnology.com, http://www.texnology.com
^^J
^^J
}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Make sure authors are using RevTeX4-1
 \IfFileExists{revtex4-1.cls}{
    \def\@revtex@cls{revtex4-1}
  }{
\typeout{^^J^^J Please update your system to include
revtex4-1.cls^^J^^J}\stop
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Options. Document style options, and additional feature options.

% These are the General document style options, 2 choices

\newif\ifmanuscript
\newif\iftwelvepoint
\newif\ifdoublespace
\newif\if@two@col
\newif\ifnumlines

\newif\iftrack
\DeclareOption{trackchanges}{\global\tracktrue}

%% Manuscript is double spaced and single columned.
%% This is the default JASA-EL style.
\newif\ifjasael
\DeclareOption{jasael}{\global\manuscripttrue\twelvepointtrue
\@two@colfalse\doublespacetrue}%
\DeclareOption{JASAel}{\global\manuscripttrue\twelvepointtrue
\@two@colfalse\doublespacetrue}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Additional feature options:

\newif\ifturnonlinenumbers
\DeclareOption{TurnOnLineNumbers}{\global\turnonlinenumberstrue\global\numlinestrue}
%% in case someone forgets to put in the caps:
\DeclareOption{turnonlinenumbers}{\global\turnonlinenumberstrue
\global\numlinestrue
}
%% Turn Off Line numbers
\newif\ifturnofflinenumbers
\DeclareOption{turnofflinenumbers}{\global\turnofflinenumberstrue
\global\numlinesfalse
}

\newif\iftimes
\DeclareOption{times}{\global\timestrue}

\DeclareOption{12pt}{\global\twelvepointtrue}

\newif\ifauthoryear
\DeclareOption{author-year}{%
\global\authoryeartrue}

\DeclareOption{NumberedRefs}{%
\global\authoryearfalse}

%% in case someone forgets to capitalize:
\DeclareOption{numberedrefs}{%
\global\authoryearfalse}

%% Default
\global\authoryeartrue

\newif\ifgrouped
\DeclareOption{authaffil}{%
\global\groupedtrue}

%% End Options

%% JASAel is default style

\ExecuteOptions{JASAel,turnonlinenumbers}


\ProcessOptions	

%%
%%%%%%%%%%%%%
%% Passing options to revtex while loading:
        \LoadClass[onecolumn, amsmath, amssymb, aip,floatfix]{revtex4-1}    

%%%%%%%%%%%%%
%
\ifauthoryear
\setcitestyle{authoryear,round,aysep={,},citesep={;}}
% changes formatting style from numeric brackets to author/year, with semicolon separating citations.
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Load packages
\usepackage{graphicx}% Include figure files
\usepackage{dcolumn}% Align table columns on decimal point
\usepackage{bm}% bold math
\usepackage{amsmath,amsfonts}% popular packages from the American Mathematical Society
\usepackage{latexsym}% 
\usepackage{lineno}   
\usepackage{array}
\usepackage{adjustbox}


\PassOptionsToPackage{normalem}{ulem}
\usepackage{ulem}

%% for editing changes
\usepackage{xcolor}
\definecolor{asalinkcolor}{cmyk}{1,.5,0,0}

 \usepackage[bookmarks=false,         % show bookmarks bar?
     pdfnewwindow=true,      % links in new window
     colorlinks=true,    % false: boxed links; true: colored links
     linkcolor=asalinkcolor,     % color of internal links
     citecolor=asalinkcolor,     % color of links to bibliography
     filecolor=asalinkcolor,  % color of file links
     urlcolor=asalinkcolor,      % color of external links
final=true
 ]{hyperref}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Font families
%% modification of bk10.clo, and bk12.clo, standard LaTeX distribution
%%
%% Implements doublespace used in `manuscript' option
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Modified bk12.clo


\iftwelvepoint %% default JASA-EL style
\renewcommand\normalsize{%
   \@setfontsize\normalsize\@xiipt{20}%
   \abovedisplayskip 12\p@ \@plus3\p@ \@minus7\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}

\normalsize

%% for section heads

\renewcommand\small{%
   \@setfontsize\small\@xipt{20}%
   \abovedisplayskip 11\p@ \@plus3\p@ \@minus6\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 9\p@ \@plus3\p@ \@minus5\p@
               \parsep 4.5\p@ \@plus2\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}

\renewcommand\footnotesize{%
   \@setfontsize\footnotesize\@xpt{18}
   \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 6\p@ \@plus2\p@ \@minus2\p@
               \parsep 3\p@ \@plus2\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\ifdoublespace % JASA-El style
\renewcommand\scriptsize{\@setfontsize\scriptsize\@viiipt{14}}
\renewcommand\tiny{\@setfontsize\tiny\@vipt{10}}
\renewcommand\large{\@setfontsize\large\@xivpt{18}}
\renewcommand\Large{\@setfontsize\Large\@xviipt{22}}
\renewcommand\LARGE{\@setfontsize\LARGE\@xxpt{25}}
\renewcommand\huge{\@setfontsize\huge\@xxvpt{30}}

\let\Huge=\huge
\fi

\newcommand\xsmall{\@setfontsize\xsmall\@ixpt{11}}

%% End font sizes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\setlength\smallskipamount{3\p@ \@plus 1\p@ \@minus 1\p@}
\setlength\medskipamount{6\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\bigskipamount{12\p@ \@plus 4\p@ \@minus 4\p@}
\setlength\headheight{12\p@}



\def\@listi{\leftmargin\leftmargini
            \parsep 4\p@ \@plus2\p@ \@minus\p@
            \topsep 8\p@ \@plus2\p@ \@minus4\p@
            \itemsep4\p@ \@plus2\p@ \@minus\p@}
\let\@listI\@listi
\@listi
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep    4\p@ \@plus2\p@ \@minus\p@
              \parsep    2\p@ \@plus\p@  \@minus\p@
              \itemsep   \parsep}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \topsep    2\p@ \@plus\p@\@minus\p@
              \parsep    \z@
              \partopsep \p@ \@plus\z@ \@minus\p@
              \itemsep   \topsep}
\def\@listiv {\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep}


%%%%%%%%%%%%%%%%%%%%%%%%%
%% Track Changes
%% Amy Hendrickson, Feb 2016

\providecolor{trackcolor}{rgb}{1,0,0}

\newcount\refchangenumber

\def\added{\@ifnextchar[{\xadded}{\yadded}}

\long\def\xadded[#1]#2{%
\iftrack{\global\advance\refchangenumber by 1\relax%
\ifnumlines
\xdef\doit{\noexpand\linelabel{\the\refchangenumber}}\doit\else%
\xdef\doit{\noexpand\label{\the\refchangenumber}{}{}{}}\doit\fi%
\color{trackcolor}([#1] Added: #2)}%%
\expandafter\gdef\csname
changenum\the\refchangenumber\endcsname{Added: [#1]
\textcolor{trackcolor}{#2}, }\else#2\fi}

\long\def\yadded#1{%
\iftrack{\global\advance\refchangenumber by 1\relax%
\ifnumlines
\xdef\doit{\noexpand\linelabel{\the\refchangenumber}}\doit\else%
\xdef\doit{\noexpand\label{\the\refchangenumber}{}{}{}}\doit\fi%
\color{trackcolor}(Added: #1)}%%
\expandafter\gdef\csname changenum\the\refchangenumber\endcsname{Added:
\textcolor{trackcolor}{#1}, }\else#1\fi}

\def\deleted{\@ifnextchar[{\xdeleted}{\ydeleted}}

\long\def\xdeleted[#1]#2{%
\iftrack{\global\advance\refchangenumber by 1\relax%
\ifnumlines
\xdef\doit{\noexpand\linelabel{\the\refchangenumber}}\doit\else%
\xdef\doit{\noexpand\label{\the\refchangenumber}{}{}{}}\doit\fi%
\color{trackcolor}([#1] Deleted: \sout{#2})}%%
\expandafter\gdef\csname
changenum\the\refchangenumber\endcsname{Deleted: [#1]
\textcolor{trackcolor}{\sout{#2}}, }\else#2\fi}

\long\def\ydeleted#1{
\iftrack
\global\advance\refchangenumber by 1
\ifnumlines\xdef\doit{\noexpand\linelabel{\the\refchangenumber}}\doit\else%
\xdef\doit{\noexpand\label{\the\refchangenumber}}\doit\fi%
{\color{trackcolor}(Deleted: \sout{#1})}%
\expandafter\def\csname changenum\the\refchangenumber\endcsname{Deleted:
{\color{trackcolor}\sout{#1}}, }\fi}

\def\replaced{\@ifnextchar[{\xreplaced}{\yreplaced}}

\long\def\xreplaced[#1]#2#3{%
\iftrack
\global\advance\refchangenumber by 1
\ifnumlines\xdef\doit{\noexpand\linelabel{\the\refchangenumber}}\doit\else%
\xdef\doit{\noexpand\label{\the\refchangenumber}}\doit\fi%
{\color{trackcolor}([#1] Replaced: \sout{#2}}
{\color{black}replaced with:} {\color{trackcolor} #3)}%
\expandafter\gdef\csname
changenum\the\refchangenumber\endcsname{Replaced: [#1]
{\color{trackcolor}\sout{#2}} {\color{black} replaced with:}
{\color{trackcolor}#3}, }\else#3\fi}

\long\def\yreplaced#1#2{%
\iftrack
\global\advance\refchangenumber by 1
\ifnumlines\xdef\doit{\noexpand\linelabel{\the\refchangenumber}}\doit\else%
\xdef\doit{\noexpand\label{\the\refchangenumber}}\doit\fi%
{\color{trackcolor}(Replaced: \sout{#1}}
{\color{black}replaced with:} {\color{trackcolor} #2)}%
\expandafter\gdef\csname changenum\the\refchangenumber\endcsname{Replaced:
{\color{trackcolor}\sout{#1}} {\color{black} replaced with:}
{\color{trackcolor}#2}, }\else#2\fi}

\global\@mparswitchfalse
\def\explain#1{
\iftrack\marginpar{\vskip26pt\vtop to 0pt{\hsize30pt\hyphenpenalty10000
\noindent\baselineskip10pt{\color{red}{\boldmath$\leftarrow$}\\
\raggedright
\footnotesize\sf\baselineskip10pt
\relax#1\vskip1sp}\vss}}\fi}

\newcount\listchangenum

\def\listofchanges{\iftrack
%\clearpage
\ifnum\refchangenumber>0
\ifnumlines\nolinenumbers\fi
\vskip36pt
\hrule
\noindent{\vrule height 14pt width0pt depth 6pt\large\bf List of Changes}
\hrule
\vskip18pt
\nobreak
{\parskip=4pt \parindent-18pt \leftskip=18pt
\loop
\vskip-1pt\relax
\global\advance\listchangenum by 1\relax
\expandafter\ifx\csname changenum\the\listchangenum\endcsname\relax
\else
\csname changenum\the\listchangenum\endcsname\ on page
\pageref{\the\listchangenum}%
\ifnumlines
\setbox0=\hbox{\lineref{\the\listchangenum}}%
\ifdim\wd0>20pt%
\else%
, line\
\lineref{\the\listchangenum}%
\fi\fi.
\repeat}
\fi\fi
%\thispagestyle{empty}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Figlines for positioning multiple illustrations in 
%% one figure environment.

\long\def\figline#1{\vskip6pt\noindent\hbox to\hsize{#1}\vskip6pt}

\long\def\figcolumn#1{\bgroup
\let\fig\columnfig
\vskip2pt\relax#1\egroup\vskip2pt}

\long\def\narrowcaption#1#2{\hfill$\vcenter to 0pt
{\vss\hsize=#1 \let\small\xsmall\caption{#2}\vskip2\baselineskip\vss}$}

\def\boxedfig#1#2#3{\hfill\fbox{\vbox{\parskip=0pt\relax\baselineskip=12pt
\hsize=#2
\includegraphics[width=#2]{#1}\vskip3pt\vtop{\hsize=#2
\centerline{#3}}}}\hfill}

\def\fig#1#2#3{\ $\vcenter{\parskip=0pt\baselineskip=12pt
\relax\hsize=#2
\includegraphics[width=#2]{#1}\vskip3pt\vtop{\hsize=#2
\centering
\relax #3\vskip1sp\vskip1sp}}$\ }


\def\columnfig#1#2#3{%
\vtop{\vskip3pt\baselineskip=12pt
\parskip=0pt
\centerline{\includegraphics[width=#2]{#1}}\def\three{#3}
\ifx\three\empty \else
\vskip1pt
\centerline{\vrule height 12pt width0pt depth 8pt
\footnotesize
\hsize=#2
#3}\fi}\vskip3pt}

\def\leftfig#1#2#3{\vbox{\parskip=0pt\relax\baselineskip=12pt\relax\hsize=#2
\includegraphics[width=#2]{#1}\vskip3pt\vtop{\hsize=#2
\centering
#3\vskip1sp\vskip1sp}}\hfill}

\def\rightfig#1#2#3{\hfill\vbox{\parskip=0pt\relax\baselineskip=12pt\relax\hsize=#2
\includegraphics[width=#2]{#1}\vskip3pt\vtop{\hsize=#2
\centering#3\vskip1sp}}}

\def\rotatefig#1#2#3#4{\hfill\vbox{\centering\parskip=0pt\relax\baselineskip=12pt\hsize=#3
\includegraphics[width=#3,angle=#1]{#2}\vskip3pt\vtop{\centering
\footnotesize
\hsize=#3
#4\vskip1pt
}}\hfill}

\def\sidebysidefigures#1#2/#3#4{\figline{%
\vbox{\hsize=.5\textwidth
\centerline{\includegraphics[width=.45\textwidth]{#1}}\vskip-\baselineskip
\centerline{\vtop{\hsize=.45\textwidth\caption{#2}}}}
\vbox{\hsize=.5\textwidth
\centerline{\includegraphics[width=.45\textwidth]{#1}}\vskip-\baselineskip
\centerline{\vtop{\hsize=.45\textwidth\caption{#2}}}}%
}}



%%%%%%%%%% End Fig line Macros %%%%%%%%%%

\def\@hangfrom@section#1#2#3{\@hangfrom{#1#2}{#3}}%
\def\@hangfroms@section#1#2{#1{#2}}%

\def\xsection{section}
\def\@seccntformat #1{\csname
the#1\endcsname\def\one{#1}\ifx\one\xsection.\fi\ }

\def\thesection{\arabic{section}}
\def\thesubsection{\thesection.\arabic{subsection}}
\def\thesubsubsection{\thesubsection.\arabic{subsubsection}}
\def\theparagraph{\thesubsubsection.\arabic{paragraph}}

%% Section heads 
\def\section{\goodbreak
\@startsection {section}{1}{\z@ }{5pt}{1sp}
{\boldmath\bfseries}}

\def\sectionfont{\normalsize\bfseries}

\def\subsection{\goodbreak
\@startsection
{subsection}{2}{\z@ }{3pt}{1sp}
{\normalsize\it}}

\def\subsubsection{\@startsection {subsubsection}{3}{\parindent}{3pt
\@plus 1ex \@minus .2ex}{1sp} {\boldmath\normalfont \normalsize \itshape }}

\def\paragraph{\@startsection {paragraph}{4}{\parindent }{\z@ }{-1em}{\normalfont \normalsize 
\itshape }}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcount\currentpage
\def\setpagenumber#1{\ifmanuscript\else\global\currentpage=#1\relax\fi}

\let\savedocument\document
\def\document{\savedocument\ifnum\currentpage>0\setcounter{page}{\the\currentpage}\fi}

\def\shorttitle#1{\def\theshorttitle{#1}}
\let\theshorttitle\relax

\def\runningfootauthor#1{\def\therunningfootauthor{#1 \etal}}
\let\therunningfootauthor\relax

\def\editorinitials#1{\def\theeditor{#1}}
\editorinitials{XYZ}

\def\DOInumber#1{\def\theDOI{/#1}}
\def\theDOI{(DOI number)}

\def\copyrightyear#1{\def\thecopyrightyear{#1}}

\def\copyrightinfo#1{\def\thecopyrightinfo{#1}}

\advance\textheight -12pt

\def\acknowledgments{\section*{Acknowledgments}}
\def\endacknowledgments{\vskip12pt}

\def\acknowledgment{\section*{Acknowledgment}}
\def\endacknowledgments{\vskip12pt}

\def\frontmatter@abstractfont{%
\ifturnofflinenumbers\else
\global\numlinestrue
\linenumbers
\fi
\normalsize
 \adjust@abstractwidth
}%

\newif\iftitle
\global\titletrue


%% this was under \ifmanuscript
\long\def\maketitle{\let \Hy@saved@footnotemark \@footnotemark 
\let \Hy@saved@footnotetext \@footnotetext 
\let \@footnotemark \H@@footnotemark \let \@footnotetext
\H@@footnotetext  
\@ifnextchar [\Hy@maketitle@optarg {\HyOrg@maketitle
\Hy@maketitle@end
}\ifmanuscript\ifturnonlinenumbers
\ifturnofflinenumbers\else
\linenumbers\fi\fi
\else
\ifturnonlinenumbers
\ifturnofflinenumbers\else
%\linenumbersep=4pt
\linenumbers\fi\fi%
\fi%% end if manuscript
}

\ifmanuscript
\def\ps@titlepage{
\def \@oddhead {\iftitle\global\titlefalse\hfill\thepreprint\global\let\thepreprint\relax
\else\hfill\@runningtitle \fi}
\let \@evenhead \@oddhead 
\def \@oddfoot {\hb@xt@ \z@ {\byrevtex \hss }\hfil \preprintsty@sw {\thepage }{}\quad \checkindate \hfil }
\let \@evenfoot \@oddfoot }

\thispagestyle{titlepage}
\pagestyle{titlepage}


\AtBeginDocument{\global\reprintcolumnwidth=246pt
\def\arraystretch{1.2}
\ifgrouped\clo@groupedaddress\fi}

\def\@ssect@ltx#1#2#3#4#5#6[#7]#8{%
  \def\H@svsec{\phantomsection}%
  \@tempskipa #5\relax
  \@ifdim{\@tempskipa>\z@}{%
    \begingroup
      \interlinepenalty \@M
      #6{%
       \@ifundefined{@hangfroms@#1}{\@hang@froms}{\csname @hangfroms@#1\endcsname}%
       {\hskip#3\relax\H@svsec}{\ifnum#2=1\noindent\hskip-\parindent\fi#8}%
      }%
      \@@par
    \endgroup
    \@ifundefined{#1smark}{\@gobble}{\csname #1smark\endcsname}{#7}%
    \addcontentsline{toc}{#1}{\protect\numberline{}#8}%
  }{%
    \def\@svsechd{%
      #6{%
       \@ifundefined{@runin@tos@#1}{\@runin@tos}{\csname @runin@tos@#1\endcsname}%
       {\hskip#3\relax\H@svsec}{#8}%
      }%
      \@ifundefined{#1smark}{\@gobble}{\csname #1smark\endcsname}{#7}%
      \addcontentsline{toc}{#1}{\protect\numberline{}#8}%
    }%
  }%
\@xsect{#5}%
}

\fi% end \ifmanuscript


%% a bit more vertical space between horizontal lines, makes table more readable
\AtBeginDocument{\def\arraystretch{1.2}\ifgrouped\clo@groupedaddress\fi}

%%%%%%%% Adjustments to aip.rtx %%%%%%%%%%%%%%%

\def\frontmatter@title@above{\addvspace{6\p@}}%
\def\frontmatter@title@format{%
 \preprintsty@sw{}{\titlefont}%
\spaceskip=8pt plus 6pt
 \bfseries
 \raggedright
 \parskip\z@skip
\advance\rightskip .7in
}%
\def\frontmatter@title@below{\addvspace{12\p@}}%

\def\frontmatter@affiliationfont{%
% \frontmatter@@indent
 \preprintsty@sw{}{\small}%
 \it
\rightskip=1in
}%


%% abstract
\def\adjust@abstractwidth{%
 \parindent0pt\relax
\advance\rightskip1in
 \advance\leftskip.5in\relax
 \@totalleftmargin\leftskip
 \@afterheading\@afterindentfalse
}%


\def\frontmatter@abstractfont{%
\noindent{\bf Abstract:}\ \ 
\normalsize
 \adjust@abstractwidth
\ifturnofflinenumbers\else
\linenumbers\fi
}%



%% default values
\copyrightinfo{Acoustical Society of America.}
\copyrightyear{\the\year}

\def\frontmatter@authorformat{\sffamily\bfseries}

\def\frontmatter@author@produce@group{\begingroup \let \@author@present \@author@present@group 
\frontmatter@authorformat \frontmatterverbose@sw 
{\typeout {\string \frontmatter@author@produce@group :}
\say \@AAC@list \say \@AFF@list \say \@AFG@list }{}\let \AU@temp \@empty 
\set@listcomma@list \AU@temp \def \CO@opr {\@collaboration@present \AU@temp }
\let \AFG@opr \affils@present@group  \let \@listcomma \relax \@AFG@list 
\frontmatter@footnote@produce \par \endgroup \frontmatter@authorbelow}

%% need all this just to get line in below abstract!
\def\titleblock@produce{%
 \begingroup
  \ltx@footnote@pop
  \def\@mpfn{mpfootnote}%
  \def\thempfn{\thempfootnote}%
  \c@mpfootnote\z@
  \let\@makefnmark\frontmatter@makefnmark
  \frontmatter@setup
  \thispagestyle{titlepage}\label{FirstPage}%
  \frontmatter@title@produce
  \groupauthors@sw{%
   \frontmatter@author@produce@group
  }{%
   \frontmatter@author@produce@script
  }%
\ifgrouped\else
\begin{center}
\vskip-6pt
\loopemailnumber=1
\it
\loop
\ifnum\loopemailnumber<\emailnumber
\expandafter\csname email\the\loopemailnumber\endcsname,\\[-6pt]
\global\advance\loopemailnumber by 1
\repeat
\expandafter\csname email\the\loopemailnumber\endcsname
\end{center}
\fi
  \frontmatter@RRAPformat{%
   \expandafter\produce@RRAP\expandafter{\@date}%
   \expandafter\produce@RRAP\expandafter{\@received}%
   \expandafter\produce@RRAP\expandafter{\@revised}%
   \expandafter\produce@RRAP\expandafter{\@accepted}%
   \expandafter\produce@RRAP\expandafter{\@published}%
  }%
  \frontmatter@abstract@produce
 \vskip-4pt
 \noindent\normalsize\hskip33pt\hbox to
 \textwidth{\footnotesize\copyright\ \thecopyrightyear\
 \thecopyrightinfo\hfill}
\vskip9pt
%\noindent\normalsize\hskip.5in\hbox to402pt{[\theeditor]\hfill Pages:
%\@startpage--\pageref{finalpage}}\vskip20pt
  \@ifx@empty\@pacs{}{%
   \@pacs@produce\@pacs
  }%
  \@ifx@empty\@keywords{}{%
   \@keywords@produce\@keywords
  }%
  \par
  \frontmatter@finalspace
 \endgroup
}%


\long\def\make@footnotetext#1{%
  \set@footnotefont
  \set@footnotewidth
  \@parboxrestore
  \protected@edef\@currentlabel{%
   \csname p@\@mpfn\endcsname\@thefnmark
  }%
  \color@begingroup
   \@makefntext{%
    \rule\z@\footnotesep\ignorespaces#1%
    \@finalstrut\strutbox\vadjust{\vskip\z@skip}%
   }%
  \color@endgroup
 \minipagefootnote@drop
}%

\def\footnoterule{\dimen@ \skip \footins 
\divide \dimen@ \tw@ \kern -\dimen@ \hrule width120pt\kern \dimen@}

\advance\textheight 24pt



\pagestyle{titlepage}
\thispagestyle{titlepage}



\def\etal{{\footnotesize\sffamily\itshape et al.}}



%% to avoid an error, hope this doesn't cause problems...
\def\select@language#1{}


%% Needed for JASA-EL
 \let\saveenddocument\enddocument

 \def\enddocument{%
\listofchanges
 \ifmanuscript\else
 \newpage
 \phantomsection
 \ \label{finalpage}%% to be able to hyperlink to final page
 \fi
 \saveenddocument
 }%


\let\undefinedpagestyle\relax

% get rid of error message
\ifauthoryear
\let\NAT@force@numbers\relax
\fi

%%%%%%%%%%%%
\newcounter{multimedia}

\long\def\multimedia#1#2{\vskip12pt\global\advance\c@multimedia by 1
\phantomsection
{\leftskip18pt
\noindent\hskip-18pt\href{{#1}}{Mm.\ \the\c@multimedia.\ \ }%
\xdef\@currentlabel{\the\c@multimedia}%
#2\vskip12pt}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% bibliography, endnotes if authoryear

\def\refname{References and links}

\let\savethebibliography\thebibliography
\def\@theenmark{0}



\ifauthoryear
\bibliographystyle{jasaauthyear2}
\def\bibhang{8pt}
\let\bibsection\relax
\def\thebibliography#1{\section*{References and links}
\theendnotes\ 
\savethebibliography{#1}
\global\advance\c@NAT@ctr by \@theenmark
}
\def\endthebibliography{
 \edef\@currentlabel{\arabic{NAT@ctr}}%
 \label{LastBibItem}%
\relax}
\else
\bibliographystyle{jasanum2}
\def\@bibstyle{jasanum2}
\def\thebibliography#1{\savethebibliography{#1}\advance\parskip3pt\relax}
\def\endthebibliography{ \edef\@currentlabel{\arabic{NAT@ctr}}%
 \label{LastBibItem}\relax}
\fi


\ifauthoryear
\usepackage{endnotes}
\def\enoteformat{\vskip3pt\rightskip=0pt \leftskip=3pt
\parindent=0pt
\leavevmode\llap{\hbox{$^{\@theenmark}$}}}

\def\@makeenmark{\hbox{\expandafter\hyperlink{end\@theenmark}{$^{\@theenmark}$}}}

\def\theendnotes{\immediate\closeout\@enotes \global\@enotesopenfalse
  \begingroup
    \makeatletter
    \def\@doanenote##1##2>{\def\@theenmark{##1}\par\begingroup
        \edef\@currentlabel{\csname p@endnote\endcsname\@theenmark} %DW
\hypertarget{end\@theenmark}{}
        \enoteformat}
    \def\@endanenote{\par\endgroup}%
    \def\ETC.{\errmessage{Some long endnotes will be truncated; %
                            use BIGLATEX to avoid this}%
          \def\ETC.{\relax}}
    \enoteheading
    \enotesize
    \@input{\jobname.ent}%
  \endgroup}

\let\footnote\endnote
\fi

\def\enoteheading{\vskip24pt}

\def\notesname{}

\widowpenalty10000
\clubpenalty10000

\textfloatsep=12pt

\def\dourl#1{\href{http://#1}{\nolinkurl{#1}}}

\def\@sect@ltx#1#2#3#4#5#6[#7]#8{%
%% added for JASA-EL:
 \@afterheading\@afterindentfalse
  \@ifnum{#2>\c@secnumdepth}{%
    \def\H@svsec{\phantomsection}%
    \let\@svsec\@empty
  }{%
    \H@refstepcounter{#1}%
    \def\H@svsec{%
     \phantomsection
    }%
    \protected@edef\@svsec{{#1}}%
    \@ifundefined{@#1cntformat}{%
     \prepdef\@svsec\@seccntformat
    }{%
     \expandafter\prepdef
     \expandafter\@svsec
                 \csname @#1cntformat\endcsname
    }%
  }%
\edef\@currentlabel{\csname the#1\endcsname}
  \@tempskipa #5\relax
  \@ifdim{\@tempskipa>\z@}{%
    \begingroup
      \interlinepenalty \@M
%% added for JASA-EL:
\noindent      
#6{%
       \@ifundefined{@hangfrom@#1}{\@hang@from}{\csname @hangfrom@#1\endcsname}%
       {\hskip#3\relax\H@svsec}{\@svsec }{#8}%
      }%
%% added for JASA-EL:
\vskip-\parskip
      \@@par
    \endgroup
    \@ifundefined{#1mark}{\@gobble}{\csname #1mark\endcsname}{#7}%
    \addcontentsline{toc}{#1}{%
      \@ifnum{#2>\c@secnumdepth}{%
       \protect\numberline{}%
      }{%
       \protect\numberline{\csname the#1\endcsname}%
      }%
      #8}%
  }{%
    \def\@svsechd{%
      #6{%
       \@ifundefined{@runin@to@#1}{\@runin@to}{\csname @runin@to@#1\endcsname}%
%% added period below for paragraph
       {\hskip#3\relax\H@svsec}{\@svsec}{#8.}%
      }%
      \@ifundefined{#1mark}{\@gobble}{\csname #1mark\endcsname}{#7}%
      \addcontentsline{toc}{#1}{%
        \@ifnum{#2>\c@secnumdepth}{%
         \protect\numberline{}%
        }{%
         \protect\numberline{\csname the#1\endcsname}%
        }%
        #8}%
    }%
  }%
  \@xsect{#5}%
}%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% This is to make ) after thanks but not after affiliation or email markers.

\def\frontmatter@makefnmark{%
 \@textsuperscript{%
  \normalfont\@thefnmark%(
\ifthanks)%\global\thanksfalse
\fi%
}%
}%


\newcount\emailnumber
\newcount\loopemailnumber
\def\email#1{\global\advance\emailnumber by 1
\expandafter\gdef\csname email\the\emailnumber\endcsname{#1}}

\newif\ifthanks
\renewcommand*\thanks[1][]{\begingroup
\global\thankstrue\sanitize@url\@thanks{#1}}%

%% This is at the bottom of the page
\def\@thanks#1#2{\endgroup
 \@AF@join{#1%$^{)}$
{#2}}%
}

%% Authors should use \citep. This will make the results the same
%% if they forget.

\let\cite\citep
\advance\belowcaptionskip12pt

\def\endruledtabular{\vskip9pt}

\newdimen\reprintcolumnwidth
\global\reprintcolumnwidth=246pt


%%%%%%%%%%%%%%%%%%
%% New for JASA-El

\textwidth=6.5in
\advance\textheight-.8in

\def\correspondingauthor{\thanks{Author to whom correspondence should
be addressed.}}


\ifgrouped
\let\saveaffiliation\affiliation
\newcount\mostrecentemail
\newcount\thisrun
\def\affiliation{\global\advance\thisrun
by 1
\mostrecentemail=\emailnumber\relax
\setbox\thisrun=\vbox{\doloopnow}
\global\emailnumber=0
\saveaffiliation}

\newcount\loopnum
\def\affils@present@group#1{\global\advance\loopnum by1
\begingroup \def \AF@temp {#1}
\@tempcnta \z@ \let \AU@opr \@undefined 
\let \CO@opr \@undefined 
\def \AF@opr {\@affilID@count \AF@temp \@tempcnta }
\@AAC@list \@ifnum {\@tempcnta =\z@ }{}{\begingroup
\frontmatter@above@affilgroup  
\set@listcomma@count \@tempcnta \let \AU@opr \@undefined \let \CO@opr \@undefined 
\def \AF@opr {\@affilID@match \AF@temp }\@AAC@list \endgroup 
\begingroup \par \frontmatter@above@affiliation \frontmatter@affiliationfont 
\let \\\frontmatter@addressnewline \@tempcnta \z@ \@tfor \AF@temp :=#1\do 
{\expandafter \@ifx \expandafter {\expandafter \z@ \AF@temp }{}{\advance \@tempcnta \@ne }}
\@ifnum {\@tempcnta =\tw@ }{\let \@listcomma \relax }{}\def@after@address \runinaddress@sw {}
{\tightenlines@sw {}{\parskip \z@ }\appdef \after@address \par }\let \AFF@opr \@affil@group 
\do@affil@fromgroup \@AFF@list #1\relax
\endgroup\copy\loopnum}\par\global\emailnumber=0 \endgroup}

\def\doloopnow{\loopemailnumber=1
\noindent\vtop{\centering
\advance\rightskip1in
 \parindent0pt\relax
\it
\loop
\ifnum\loopemailnumber<\mostrecentemail
\expandafter\csname email\the\loopemailnumber\endcsname, 
\global\advance\loopemailnumber by 1
\repeat
\expandafter\csname
email\the\loopemailnumber\endcsname\ifnum\mostrecentemail>2\vskip12pt\fi}}

\fi

\parindent=36pt


\def\frontmatter@thefootnote{%
 \altaffilletter@sw{\@alph}{\@fnsymbol}{\csname c@\@mpfn\endcsname}%
}%


\def\@author@present@group#1#2#3{%
  \gdef\comma@space{\gdef\comma@space{\textsuperscript{,\,}}}%
  \doauthor{#2}{#3}{\@affil@present@group}%
  \advance\@tempcnta\m@ne
}%

\def\@affil@present@group{%
 \aftergroup\false@sw
}%

\def\preprint#1{\def\thepreprint{#1}}
\let\thepreprint\relax

\def\figurename{Fig.}
\def\tablename{Table}

\def\altaffiliation#1{\thanks{#1}}

\def\thetable{\@arabic\c@table}
\endinput
%\frontmatter@thanks
















