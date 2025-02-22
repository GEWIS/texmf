%% GEWIS Document Tex style v1.0
%% Stijl - Gijs de Man, Rink Pieters

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{GEWISDocument}[2021/04/15 GEWIS Document Class]

\LoadClass[a4paper, 11pt]{article}
\usepackage[T1]{fontenc}

% Version control
\def\@majorVersion{1}
\newcommand{\documentMajorVersion}[1]{
	\ifnum\numexpr#1\relax=\numexpr\@majorVersion\relax\else
	\ClassError{GEWISDocument}{Major version mismatch. Check corporate identity for more information.}
	\fi
}

%%
%% Page setup using GEWIS corporate identity
%%
\usepackage{fontawesome} 	% Glyphs of association details in header
\usepackage{ocg-p} 			% Possibility to use layers - used for background hiding on print
\usepackage{fancyhdr} 		% Correctly style header and footer of the GEWIS stationery
\usepackage[hidelinks]{hyperref} % Interactive links for contact details
\usepackage{graphicx} 		% To insert pdf background
\usepackage{atbegshi}
\usepackage{atenddvi}
\usepackage{etoolbox}

%%
%% Creation of toggles for various options
%%

\newcommand\@languageAlt{}

% Create print friendly option
\newtoggle{printversion}
\toggletrue{printversion}
\DeclareOption{printversion}{\togglefalse{printversion}}

\newcommand\@languagePage{Pages}
\newtoggle{dutch}
\togglefalse{dutch}
\DeclareOption{dutch}{
	\renewcommand\@languagePage{Pagina}
	\toggletrue{dutch}
}

% Alt firstpage
\newtoggle{alt}
\togglefalse{alt}

% Create toggle for general meeting
\newtoggle{GMM}
\togglefalse{GMM}
\DeclareOption{GMM}{
	\toggletrue{GMM}
	\toggletrue{alt}
}

% Create toggle for chairman meeting
\newtoggle{CM}
\togglefalse{CM}
\DeclareOption{CM}{
	\toggletrue{CM}
	\toggletrue{alt}
}

% Create toggle for boardmeeting
\newtoggle{BM}
\togglefalse{BM}
\DeclareOption{BM}{
	\toggletrue{BM}
	\toggletrue{alt}
}

% Create toggle for notes for chairman
\newtoggle{notes}
\togglefalse{notes}
\DeclareOption{notes}{
	\toggletrue{notes}
}

% Create toggle for compiling poster
\newtoggle{posterversion}
\togglefalse{posterversion}
\DeclareOption{posterversion}{
	\toggletrue{posterversion}
}

% Create toggle for compiling minutes
\newtoggle{minutesversion}
\togglefalse{minutesversion}
\DeclareOption{minutesversion}{
	\toggletrue{minutesversion}
}
\ProcessOptions\relax

\renewcommand\title[1]{\renewcommand\@GEWIStitle{#1}}
\newcommand\subtitle[1]{\renewcommand\@GEWISsubtitle{#1}}
\newcommand\footer[1]{\renewcommand\@GEWISfooter{#1}}

% Font settings
\usepackage{mathpazo}
\pdfmapfile{=fontawesome.map}

% Margins and other spacings of the page
\usepackage[a4paper,
hmargin={35mm, 25mm},
tmargin = 15mm,
headsep = 0mm,
headheight = 9.8mm,
footskip = 9.8mm,
height = 260.4mm,
%showframe, % Debugging purposes only
]{geometry}

\AtBeginDocument{
	\pagestyle{GEWISfollowup}
	\newgeometry{
		hmargin={35mm, 25mm},
		tmargin = 47.5mm,
		headsep = 9.8mm,
		headheight = 32.5mm,
		footskip = 9.8mm,
		height = 227.9mm,
%		showframe, % Debugging purposes only
	}
	\thispagestyle{GEWISfirstpage}%
	\AtBeginShipout{\ifnum\value{pagesec}=1\globaldefs=1\restoregeometry\globaldefs=0\fi}%
}

%%
%% Variables for headers and footers
%% text, fontsize, baselineskip
%%
\newcommand\GEWIStitle[3]{
	\renewcommand{\renewcommand\@GEWIStitle}{{\fontsize{#2}{#3}\selectfont#1}}
}
\newcommand\GEWISsubtitle[3]{
	\renewcommand{\renewcommand\@GEWISsubtitle}{{\fontsize{#2}{#3}\selectfont#1}}
}
\newcommand\@GEWIStitle{}
\newcommand\@GEWISsubtitle{}
\newcommand\@GEWISfooter{}

%%
%% Options for page numbering
%%
\newlength{\pageWidth}
\newcounter{pagesec}
\def\totalsec{0}

% Get pagenumber of current section
\newcommand{\@printPageNumber}{%
	\thepagesec\ / \ref{\totalsec}%
}

\newcommand{\@pageNumber}{%
	\stepcounter{pagesec}%
	\thepagesec\ / \ref{\totalsec}%
}

% Enter new section, restart page numbering
\newcommand{\resetPageCount}{%
	\clearpage%
	\edef\@currentlabel{\thepagesec}\label{\totalsec}%
	\xdef\totalsec{\thepage}%
	\setcounter{pagesec}{0}%
}

% Make sure last pages get total section number
\AtEndDvi{\edef\@currentlabel{\thepagesec}\label{\totalsec}}

%%
%% Settings for page layout, layers and more including corporate identity
%%
\newcommand*{\@AddBackground}[2][]{%
	\iftoggle{printversion}%
	{%We include only the default letterhead and print it as well
		\AddToShipoutPicture*{%
			\put(-10.4mm\@gobble,-10.4mm\@gobble){%
				\parbox[b][\paperheight]{\paperwidth}{%
					\vfill%
					\centering%
					\includegraphics[page=#2, keepaspectratio]{stationery/letterhead_alt}%
					\vfill%
				}%
			}%
		}%
	}%
	{%We create one non-visible, but printable layer layer
		\@AddFullPageLayer[#1]{letterhead_alt}{always}{never}{P}{0}%
		%We create one visible layer with the full style (on top of the previous one, since some viewers show both)
		\@AddFullPageLayer[#2]{letterhead_alt}{never}{always}{V}{1}%
	}%
}

%Arguments: [page number]{file name}{printocg}{exportocg}{LayerName}{visible}
\newcommand*{\@AddFullPageLayer}[6][] {%
	\AddToShipoutPicture*{%
		\put(-10.4mm\@gobble,-10.4mm\@gobble){%
			\begin{ocg}[printocg=#3,exportocg=#4,listintoolbar=iffirstuse]{Layer_briefpapier_#5}{#5}{#6}%
				\parbox[b][\paperheight]{\paperwidth}{%
					\vfill%
					\centering%
					\includegraphics[page=#1, keepaspectratio]{stationery/#2}%
					\vfill%
				}%
			\end{ocg}%
		}%
	}%
}

% Pagestyle for followup pages
\fancypagestyle{GEWISfollowup}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{0pt}
	\rfoot{%
		\settowidth{\pageWidth}{\@languagePage\ \@printPageNumber}%
		\@languagePage\ \@pageNumber\hspace{\dimexpr17.5mm-\pageWidth/2}%
		\@AddBackground[4]{2}%
	}
	\lfoot{
		\textit{\@GEWISfooter}
	}
}

% Pagestyle for first page of agenda
\fancypagestyle{GEWISfirstpage}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{0pt}
	\lhead{
		\begingroup%
		\setlength{\partopsep}{1em}%
		\setlength{\topsep}{0em}
		\begin{minipage}[b][3.1cm][b]{.65\linewidth}%
			\begin{flushright}%
				\@GEWIStitle%
			\end{flushright}%
			\begin{flushright}%
				\@GEWISsubtitle%
			\end{flushright}%
		\end{minipage}%
		\endgroup%
	}
	\rfoot{
		\settowidth{\pageWidth}{\@languagePage\ \@printPageNumber}%
		\@languagePage\ \@pageNumber\hspace{\dimexpr17.5mm-\pageWidth/2}%
		\@AddBackground[3]{1}%
	}
	\lfoot{
		\textit{\@GEWISfooter}
	}
}