%% GEWIS Agenda Tex style v0.4
%% Stijl - Gijs de Man, Rink Pieters

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{GEWISAgenda}[2020/05/13 GEWIS Agenda Class]
\LoadClass[a4paper, 11pt]{article}

\RequirePackageWithOptions{GEWISAgendaMinutes}[2020/05/13]

\@ifpackagelater{GEWISAgendaMinutes}{2020/05/14}{%
    \ClassError{GEWISAgenda}{Version mismatch: this version of the minutes class requires exactly GEWISAgendaMinutes package v0.4. A newer version was found}{}%
}{
    \@ifpackagelater{GEWISAgendaMinutes}{2020/05/13}{}{%
        \ClassError{GEWISAgenda}{Version mismatch: this version of the minutes class requires exactly GEWISAgendaMinutes package v0.4. An older version was found}{}%
    }
}


%%  ----------------------------------------------------------------------------------------
%%  01000001 01100111 01100101 01101110 01100100 01100001 01110011
%%  01100101 01110100 01110100 01101001 01101110 01100111 01110011
%%  ----------------------------------------------------------------------------------------

%%
%% General commands for agenda
%%
\newcounter{currentPoint}
\setcounter{currentPoint}{1}
\newcounter{currentSubPoint}
\setcounter{currentSubPoint}{1}
\newcounter{currentSubSubPoint}
\setcounter{currentSubSubPoint}{1}

\newcommand\customNumber{}
\newcommand\customSubNumber{}
\newcommand\customSubSubNumber{}

\newcommand\@goodCurrentPoint{}
\newcommand\@goodCurrentSubPoint{}
\newcommand\@goodCurrentSubSubPoint{}

\newlength{\numberWidth}
\newlength{\nameWidth}
\newlength{\deadWidth}
\newlength{\numberTempWidth}
\newlength{\nameTempWidth}
\newlength{\deadTempWidth}

\settowidth{\numberWidth}{\@languageNumber}
\settowidth{\nameWidth}{\@languageName}
\settowidth{\deadWidth}{\@languageDeadline}

\DTLnewdb{comments}
\hyphenpenalty=10000

%%
%% Pagestyle for first page of agenda
%%
\fancypagestyle{AgendaFirstpage}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{0pt}
	\lhead{
		\begin{minipage}[c]{.65\linewidth}
			\begin{flushright}
				{\fontsize{18}{22}\selectfont \@languageAgendaFor \ifdefempty{\@@meetingNumber}{}{\@@meetingNumbersc}\\ \@languageMeeting
					\ifdefempty{\@@organName}{\\}{\@languageOf \@@organName \\}}
				\vspace{3mm}
				\ifdefempty{\@@meetingDate}{}{\@@meetingDate
					\ifdefempty{\@@meetingTime}{}{, \@@meetingTime \\}
				}
				\ifdefempty{\@@meetingLocation}{}{\@@meetingLocation \\}
			\end{flushright}
		\end{minipage}
	}
	\rfoot{
		\begin{adjustwidth}{117mm}{}\hfill
			\begin{minipage}[c]{32mm}\centering
				\@languagePage \@pageNumber
			\end{minipage}
		\end{adjustwidth}
        \@AddBackground[3]{1}
	}
	\lfoot{
	\begin{adjustwidth}{2mm}{}
		\begin{minipage}[l]{100mm}
			\textit{%
				\ifdefempty{\@@agendaDate}{%
					\ifdefempty{\@@agendaVersion}{}{\@languageVersion\@@agendaVersion}%
				}{%
					\ifdefempty{\@@agendaVersion}{\@@agendaDate}{\@@agendaDate, \@languageVersion\@@agendaVersion}%
			}}%
		\end{minipage}\hfill
	\end{adjustwidth}
	}
}

%%
%% Pagestyle for first page of  meeting agenda
%%
\fancypagestyle{AgendaFirstpageGM}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{0pt}
	\lhead{
		\begin{minipage}[c]{.65\linewidth}
			\begin{flushright}
				{\fontsize{18}{22}\selectfont \@languageAgendaFor \ifdefempty{\@@meetingNumber}{}{\@@meetingNumbersc}\\ \@languageGM
					\ifdefempty{\@@organName}{\\}{\@languageOf \@@organName \\}}
				\vspace{3mm}
					\ifdefempty{\@@meetingDate}{}{\@@meetingDate
						\ifdefempty{\@@meetingTime}{}{, \@@meetingTime}
					} \hspace{1cm}
					\ifdefempty{\@@meetingLocation}{}{\@@meetingLocation \\}
			\end{flushright}
		\end{minipage}
	}
	\rfoot{
		\begin{adjustwidth}{117mm}{}\hfill
			\begin{minipage}[c]{32mm}\centering
				\@languagePage \@pageNumber
			\end{minipage}
		\end{adjustwidth}
        \@AddBackground[3]{1}
	}
	\lfoot{
		\begin{adjustwidth}{2mm}{}
			\begin{minipage}[l]{100mm}
				\textit{%
				\ifdefempty{\@@agendaDate}{%
					\ifdefempty{\@@agendaVersion}{}{\@languageVersion\@@agendaVersion}%
				}{%
					\ifdefempty{\@@agendaVersion}{\@@agendaDate}{\@@agendaDate, \@languageVersion\@@agendaVersion}%
				}}%
			\end{minipage}\hfill
		\end{adjustwidth}
	}
}

%%
%% Complete settings for first page
%%
%% You might look at this and think, wow, why did you do it in such a stupid way. Well, if you find a better way, without having the `client' restore the geometry, please let me know. I suffered from trying to implement this, and I am happy that it works so let's just let it be for now. OK? OK.
\iftoggle{general}{
	\newgeometry{
		tmargin=47.5mm,
		hmargin={33mm, 27mm},
		headheight = 52.5mm,
		headsep = 9.8mm,
		height = 227.5mm,
		footskip = 9.5mm, %22mm,
		nomarginpar,
	}
	\thispagestyle{AgendaFirstpageGM}
	\afterpage{
		\globaldefs=1
		\newgeometry{
			tmargin=15.5mm,
			hmargin={33mm, 27mm},
			headheight = 52.5mm,
			headsep = 9.8mm,
			height = 259.5mm,
			footskip = 9.5mm, %22mm,
			nomarginpar,
		}
	}
}{
	\iftoggle{chairman}{
		\newgeometry{
			tmargin=47.5mm,
			hmargin={33mm, 27mm},
			headheight = 52.5mm,
			headsep = 9.8mm,
			height = 227.5mm,
			footskip = 9.5mm, %22mm,
			nomarginpar,
		}
		\thispagestyle{AgendaFirstpageGM}
		\afterpage{
			\globaldefs=1
			\newgeometry{
				tmargin=15.5mm,
				hmargin={33mm, 27mm},
				headheight = 52.5mm,
				headsep = 9.8mm,
				height = 259.5mm,
				footskip = 9.5mm, %22mm,
				nomarginpar,
			}
		}
	}{
		\newgeometry{
			tmargin=47.5mm,
			hmargin={33mm, 27mm},
			headheight = 52.5mm,
			headsep = 9.8mm,
			height = 227.5mm,
			footskip = 9.5mm, %22mm,
			nomarginpar,
		}
		\thispagestyle{AgendaFirstpage}
		\afterpage{
			\globaldefs=1
			\newgeometry{
				tmargin=15.5mm,
				hmargin={33mm, 27mm},
				headheight = 52.5mm,
				headsep = 9.8mm,
				height = 259.5mm,
				footskip = 9.5mm, %22mm,
				nomarginpar,
			}
		}
	}
}

\pagestyle{GEWISfollowup}

%%
%% Generating a new agendapoint
%%
\newcommand\agendaPoint[2][\thecurrentPoint]{%
	\renewcommand\customNumber{}%
    \renewcommand\customSubNumber{}%
    \renewcommand\customSubSubNumber{}%
	\setcounter{currentSubPoint}{1}%
	\setcounter{currentSubSubPoint}{1}%
	\setlength\extrarowheight{6pt}%
	\begin{tabular}{R{8mm} p{12cm}}%
		\large #1. & \large #2 \\%
	\end{tabular}%
	\ifthenelse{\equal{\string #1}{\string \thecurrentPoint}}%
		{\stepcounter{currentPoint}}{\renewcommand\customNumber{#1}} \\%
}

%%
%% Generating opening
%%
\newcommand\opening[1][\thecurrentPoint]{%
	\renewcommand\customNumber{}%
	\renewcommand\customSubNumber{}%
	\renewcommand\customSubSubNumber{}%
	\setcounter{currentSubPoint}{1}%
	\setcounter{currentSubSubPoint}{1}%
	\setlength\extrarowheight{6pt}%
	\begin{tabular}{R{8mm} p{12cm}}%
		\large #1. & \large Opening \\%
	\end{tabular}%
	\ifthenelse{\equal{\string #1}{\string \thecurrentPoint}}%
	{\stepcounter{currentPoint}}{\renewcommand\customNumber{#1}} \\%
}

%%
%% Generating determining final agenda
%%
\newcommand\VDA[1][\thecurrentPoint]{\DFA[#1]}%
\newcommand\DFA[1][\thecurrentPoint]{%
	\renewcommand\customNumber{}%
	\renewcommand\customSubNumber{}%
	\renewcommand\customSubSubNumber{}%
	\setcounter{currentSubPoint}{1}%
	\setcounter{currentSubSubPoint}{1}%
	\setlength\extrarowheight{6pt}%
	\begin{tabular}{R{8mm} p{12cm}}%
		\large #1. & \large \@languageDFA \\%
	\end{tabular}%
	\ifthenelse{\equal{\string #1}{\string \thecurrentPoint}}%
	{\stepcounter{currentPoint}}{\renewcommand\customNumber{#1}} \\%
}

%%
%% Generating announcements
%%
\newcommand\mededelingen[1][\thecurrentPoint]{\announcements[#1]}%
\newcommand\announcements[1][\thecurrentPoint]{%
	\renewcommand\customNumber{}%
	\renewcommand\customSubNumber{}%
	\renewcommand\customSubSubNumber{}%
	\setcounter{currentSubPoint}{1}%
	\setcounter{currentSubSubPoint}{1}%
	\setlength\extrarowheight{6pt}%
	\begin{tabular}{R{8mm} p{12cm}}%
		\large #1. & \large \@languageAnnouncements \\%
	\end{tabular}%
	\ifthenelse{\equal{\string #1}{\string \thecurrentPoint}}%
	{\stepcounter{currentPoint}}{\renewcommand\customNumber{#1}} \\%
}

%%
%% Generating last minutes
%%
\newcommand\notulen[1][\thecurrentPoint]{\minutes[#1]}%
\newcommand\minutes[1][\thecurrentPoint]{%
	\renewcommand\customNumber{}%
	\renewcommand\customSubNumber{}%
	\renewcommand\customSubSubNumber{}%
	\setcounter{currentSubPoint}{1}%
	\setcounter{currentSubSubPoint}{1}%
	\setlength\extrarowheight{6pt}%
	\begin{tabular}{R{8mm} p{12cm}}%
		\large #1. & \large \@languageLastMinutes \\%
	\end{tabular}%
	\ifthenelse{\equal{\string #1}{\string \thecurrentPoint}}%
	{\stepcounter{currentPoint}}{\renewcommand\customNumber{#1}} \\%
}

\newcommand\notulenALV[1][\thecurrentPoint]{\minutesGM[#1]}%
\newcommand\minutesGM[1][\thecurrentPoint]{%
	\renewcommand\customNumber{}%
	\renewcommand\customSubNumber{}%
	\renewcommand\customSubSubNumber{}%
	\setcounter{currentSubPoint}{1}%
	\setcounter{currentSubSubPoint}{1}%
	\setlength\extrarowheight{6pt}%
	\begin{tabular}{R{8mm} p{12cm}}%
		\large #1. & \large \@languageLastMinutesGeneral \\%
	\end{tabular}%
	\ifthenelse{\equal{\string #1}{\string \thecurrentPoint}}%
	{\stepcounter{currentPoint}}{\renewcommand\customNumber{#1}} \\%
}

\newcommand\notulenVV[1][\thecurrentPoint]{\minutesGM[#1]}%
\newcommand\notulenCM[1][\thecurrentPoint]{\minutesGM[#1]}%

%%
%% Generating action points
%%
\newcommand\actiePunten[1][\thecurrentPoint]{\actionPoints[#1]}%
\newcommand\actionPoints[1][\thecurrentPoint]{%
	\renewcommand\customNumber{}%
	\renewcommand\customSubNumber{}%
	\renewcommand\customSubSubNumber{}%
	\setcounter{currentSubPoint}{1}%
	\setcounter{currentSubSubPoint}{1}%
	\setlength\extrarowheight{6pt}%
	\begin{tabular}{R{8mm} p{12cm}}%
		\large #1. & \large \@languageActionPoints \\%
	\end{tabular}%
	\ifthenelse{\equal{\string #1}{\string \thecurrentPoint}}%
	{\stepcounter{currentPoint}}{\renewcommand\customNumber{#1}} \\%
}

%%
%% Generating any other businesses
%%
\newcommand\WVTTK[1][\thecurrentPoint]{\AOB[#1]}%
\newcommand\AOB[1][\thecurrentPoint]{%
	\renewcommand\customNumber{}%
	\renewcommand\customSubNumber{}%
	\renewcommand\customSubSubNumber{}%
	\setcounter{currentSubPoint}{1}%
	\setcounter{currentSubSubPoint}{1}%
	\setlength\extrarowheight{6pt}%
	\begin{tabular}{R{8mm} p{12cm}}%
		\large #1. & \large \@languageOAB \\%
	\end{tabular}%
	\ifthenelse{\equal{\string #1}{\string \thecurrentPoint}}%
	{\stepcounter{currentPoint}}{\renewcommand\customNumber{#1}} \\%
}

%%
%% Generating inquiry
%%
\newcommand\rondvraag[1][\thecurrentPoint]{\finalInquiry[#1]}%
\newcommand\finalInquiry[1][\thecurrentPoint]{%
	\renewcommand\customNumber{}%
	\renewcommand\customSubNumber{}%
	\renewcommand\customSubSubNumber{}%
	\setcounter{currentSubPoint}{1}%
	\setcounter{currentSubSubPoint}{1}%
	\setlength\extrarowheight{6pt}%
	\begin{tabular}{R{8mm} p{12cm}}%
		\large #1. & \large \@languageInquiry \\%
	\end{tabular}%
	\ifthenelse{\equal{\string #1}{\string \thecurrentPoint}}%
	{\stepcounter{currentPoint}}{\renewcommand\customNumber{#1}} \\%
}

%%
%% Generating closure
%%
\newcommand\sluiting[1][\thecurrentPoint]{\closure[#1]}%
\newcommand\closure[1][\thecurrentPoint]{%
	\renewcommand\customNumber{}%
	\renewcommand\customSubNumber{}%
	\renewcommand\customSubSubNumber{}%
	\setcounter{currentSubPoint}{1}%
	\setcounter{currentSubSubPoint}{1}%
	\setlength\extrarowheight{6pt}%
	\begin{tabular}{R{8mm} p{12cm}}%
		\large #1. & \large \@languageClosure \\%
	\end{tabular}%
	\ifthenelse{\equal{\string #1}{\string \thecurrentPoint}}%
	{\stepcounter{currentPoint}}{\renewcommand\customNumber{#1}} \\%
}

%%
%% Generating a new subpoint
%%
\newcommand\subPoint[2][\thecurrentSubPoint]{%
	\renewcommand\customSubNumber{}%
    \renewcommand\customSubSubNumber{}%
	\setcounter{currentSubSubPoint}{1}%
	\setlength\extrarowheight{6pt}%
	\begin{tabular}{R{14mm} p{12cm}}%
		\large #1. & \large#2 \\%
	\end{tabular}%
	\ifthenelse{\equal{\string #1}{\string \thecurrentSubPoint}}%
		{\stepcounter{currentSubPoint}}{\renewcommand\customSubNumber{#1}} \\%
}

%%
%% Generating a new subsubpoint
%%
\newcommand\subSubPoint[2][\thecurrentSubSubPoint]{%
	\renewcommand\customSubSubNumber{}%
	\setlength\extrarowheight{6pt}%
	\begin{tabular}{R{20mm} p{12cm}}%
		\large#1. & \large#2 \\%
	\end{tabular}%
	\ifthenelse{\equal{\string #1}{\string \thecurrentSubSubPoint}}%
		{\stepcounter{currentSubSubPoint}}{\renewcommand\customSubSubNumber{#1}} \\%
}

%%
%% Change agendapoint counters
%%
\newcommand\agendaPointNumber[1]{\setcounter{currentPoint}{#1}}
\newcommand\subPointNumber[1]{\setcounter{currentSubPoint}{#1}}
\newcommand\subSubPointNumber[1]{\setcounter{currentSubSubPoint}{#1}}

\newcommand\hasAP{0}
\DTLnewdb{actionpoints}

%%
%% Generating a new actionpoint
%%
\newcommandx\actionPoint[4][2=\@@meetingNumber]{%
	\renewcommand\hasAP{1}%
	\dtlexpandnewvalue%
	\DTLnewrow{actionpoints}%
	\DTLnewdbentry{actionpoints}{number}{#1}%
	\DTLnewdbentry{actionpoints}{action}{#3}%
	\DTLnewdbentry{actionpoints}{person}{#4}%
	\DTLnewdbentry{actionpoints}{deadline}{#2}%
	\dtlnoexpandnewvalue%
	%
	\settowidth{\nameTempWidth}{#4}%
	\ifdim \the\nameTempWidth > \the\nameWidth%
	\settowidth{\nameWidth}{#4}\fi%
	%
	\settowidth{\numberTempWidth}{#1}%
	\ifdim \the\numberTempWidth > \the\numberWidth%
	\settowidth{\numberWidth}{#1}\fi%
	%
	\settowidth{\deadTempWidth}{#2}%
	\ifdim \the\deadTempWidth > \the\deadWidth%
	\settowidth{\deadWidth}{#2}\fi%
}%

%%
%% Generating new comments in combination with the right agendapoint
%%
\newcommand\addComment[1]{%
	\ifthenelse{\equal{\customNumber}{}}{\renewcommand\@goodCurrentPoint{\the\numexpr\value{currentPoint}-1}}{\renewcommand\@goodCurrentPoint{\customNumber}}
	%
	\ifthenelse{\equal{\customSubNumber}{}}{\renewcommand\@goodCurrentSubPoint{\the\numexpr\value{currentSubPoint}-1}}{\renewcommand\@goodCurrentSubPoint{\customSubNumber}}
	%
	\ifthenelse{\equal{\customSubSubNumber}{}}{\renewcommand\@goodCurrentSubSubPoint{\the\numexpr\value{currentSubSubPoint}-1}}{\renewcommand\@goodCurrentSubSubPoint{\customSubSubNumber}}
	%
	\dtlexpandnewvalue
	\DTLnewrow{comments}
	\DTLnewdbentry{comments}{comment}{#1}
	\ifthenelse{\equal{\@goodCurrentSubPoint}{0}}{%
		\DTLnewdbentry{comments}{number}{\@goodCurrentPoint}%
		\settowidth{\addTempWidth}{Ad \@goodCurrentPoint}
		\ifdim \the\addTempWidth > \the\addWidth
		\settowidth{\addWidth}{Ad \@goodCurrentPoint}\fi
	}{%
		\ifthenelse{\equal{\@goodCurrentSubSubPoint}{0}}{%
			\DTLnewdbentry{comments}{number}{\@goodCurrentPoint.\@goodCurrentSubPoint}%
			\settowidth{\addTempWidth}{Ad \@goodCurrentPoint.\@goodCurrentSubPoint}
			\ifdim \the\addTempWidth > \the\addWidth
			\settowidth{\addWidth}{Ad \@goodCurrentPoint.\@goodCurrentSubPoint}\fi
		}{%
			\DTLnewdbentry{comments}{number}{\@goodCurrentPoint.\@goodCurrentSubPoint.\@goodCurrentSubSubPoint}%
			\settowidth{\addTempWidth}{Ad \@goodCurrentPoint.\@goodCurrentSubPoint.\@goodCurrentSubSubPoint}
			\ifdim \the\addTempWidth > \the\addWidth
			\settowidth{\addWidth}{Ad \@goodCurrentPoint.\@goodCurrentSubPoint.\@goodCurrentSubSubPoint}\fi
		}%
	}%
	\dtlnoexpandnewvalue
}

%%
%% Printing the comments and final message (if enabled)
%%
\def\printFinal{\@ifstar\@printFinalStar\@printFinalNoStar}
\def\@printFinalStar{\@printFinal{1}}
\def\@printFinalNoStar{\@printFinal{0}}

\newcommand\@printFinal[1]{
	\vspace{1em}
	\ifthenelse{\equal{\hasAP}{1}}{
		\setlength\extrarowheight{5pt}%
		\begin{tabular}{p{\numberWidth} p{\deadWidth} p{\nameWidth} p{13.7cm-\numberWidth-\nameWidth-\deadWidth}}%
			\textbf{\@languageNumber}&\textbf{\@languageDeadline}&\textbf{\@languageName}&\textbf{\@languageAction}%
		\end{tabular} \\%
		\DTLforeach{actionpoints}{\theAction=action,\theNumber=number,\thePerson=person,\theDeadline=deadline}{%
		\begin{tabular}{p{\numberWidth} p{\deadWidth} p{\nameWidth} p{13.7cm-\numberWidth-\nameWidth-\deadWidth}}%
			\theNumber&\theDeadline&\thePerson&\theAction%
		\end{tabular} \\%
		} \\%
	}

	\setlength\extrarowheight{5pt}%
	\DTLforeach{comments}{\theComment=comment,\theNumber=number}{%
		\begin{tabular}{p{\addWidth} p{14.5cm-\addWidth}}%
			Ad \theNumber&\theComment%
		\end{tabular} \\%
	}

	\ifthenelse{\equal{#1}{1}}{%
		\begin{tabular}{p{15cm}}
			Until four days before the meeting new items may still be put forward. The
			meeting documents are available for inspection a week prior to the meeting.
			Please read these documents in advance carefully. Do not leave these documents unattended but rather destroy them.
	   \end{tabular}
    }


    %You would think these whitespaces above are useless, but be surprised. By deleting them, and having text overlap from the first page to the second page, the geometry will actually not update. To make a long story short, if you don't want you geometry to be fucked up, let these whitespaces be.
}
