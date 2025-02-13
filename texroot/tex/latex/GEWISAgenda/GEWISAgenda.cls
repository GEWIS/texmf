%% GEWIS Agenda Tex style v1.1
%% Stijl - Gijs de Man, Rink Pieters
%% Minor textual changes made in 2025 by Jens Knapen

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{GEWISAgenda}[2021/04/15 GEWIS Agenda Class]

\LoadClassWithOptions{GEWISDocument}
\RequirePackage{GEWISAgendaMinutes}

% Version control
\def\@majorVersion{1}
\@agendaMinutesMajorVersion{1}
\documentMajorVersion{1}
\newcommand{\agendaMajorVersion}[1]{
	\ifnum\numexpr#1\relax=\numexpr\@majorVersion\relax\else
	\ClassError{GEWISAgenda}{Major version mismatch. Check corporate identity for more information.}
	\fi
}

%%
%% Packages only used in the agenda
%%
\usepackage{xcolor}
\definecolor{GEWISred}{cmyk}{0.0843, 1, 1, 0.23}

%%
%% Language options used in the agenda only
%%
\newcommand\@languageDocument{Agenda for the\xspace}

\newcommand\@languageDFA{Determining Final Agenda}
\newcommand\@languageAnnouncements{Announcements}
\newcommand\@languageMail{Mail}
\newcommand\@languageMinutes{Minutes}
\newcommand\@languageActionPoints{Action points}
\newcommand\@languageOAB{A.O.B.}
\newcommand\@languageInquiry{Final Inquiry}
\newcommand\@languageClosure{Closure}

\iftoggle{dutch}{
	\renewcommand\@languageDocument{Agenda voor de\xspace}
	
	\renewcommand\@languageDFA{Vaststellen Definitieve Agenda}
	\renewcommand\@languageAnnouncements{Mededelingen}
	\renewcommand\@languageMail{Post}
	\renewcommand\@languageMinutes{Notulen}
	\renewcommand\@languageActionPoints{Actiepunten}
	\renewcommand\@languageOAB{W.V.T.T.K.}
	\renewcommand\@languageInquiry{Rondvraag}
	\renewcommand\@languageClosure{Sluiting}
}

% Settings some stuff for writing the minutes template
\begingroup
\catcode`\^^I=12
\gdef\@tabchar{^^I}
\catcode`\[ = 1\relax
\catcode`\] = 2\relax
\catcode`\{ = 12\relax
\catcode`\} = 12 \relax 
\gdef\@openbracechar[{]
\gdef\@closebracechar[}]
\endgroup
\edef\@atchar{\string @}


%%
%% Complete settings for first page, for general start reading data for poster
%%
\iftoggle{alt}{
	\thispagestyle{GEWISfirstpage}
	\renewcommand\@GEWIStitle{
		{\fontsize{18}{22}\selectfont \@languageDocument \ifdefempty{\@@meetingNumber}{}{\@@meetingNumbersc}\\ \@languageAlt\ 
		\ifdefempty{\@@organName}{\\}{\@languageOf \@@organName \\}}
	}
	\renewcommand\@GEWISsubtitle{
		\ifdefempty{\@@meetingDate}{}{\@@meetingDate\ifdefempty{\@@meetingTime}{}{, \@@meetingTime}}
		\ifdefempty{\@@meetingLocation}{}{\hspace{0.73cm}\@@meetingLocation \\}
	}
	\iftoggle{posterversion}{
	   	\newwrite\general
	   	\immediate\openout\general=poster.php
	   	\write\general{<?php}
		\write\general{$information='}
		\write\general{<ol>}
		% for potential feature addendum
		%\newwrite\comments%
		%\immediate\openout\comments=data/comments.php%
		%\write\comments{<table class="adjes">}%
	}\relax
}{

	\thispagestyle{GEWISfirstpage}
	\renewcommand\@GEWIStitle{
		{\fontsize{18}{22}\selectfont \@languageDocument \ifdefempty{\@@meetingNumber}{}{\@@meetingNumbersc}\\ \@languageMeeting\ 
		\ifdefempty{\@@organName}{\\}{\@languageOf \@@organName \\}}
	}
	\renewcommand\@GEWISsubtitle{
		\ifdefempty{\@@meetingDate}{}{\@@meetingDate
			\ifdefempty{\@@meetingTime}{}{, \@@meetingTime \\}
		}
		\ifdefempty{\@@meetingLocation}{}{\@@meetingLocation \\}
	}
}

\pagestyle{GEWISfollowup}

%% Begin with presencelist, start tabular
\AtBeginDocument{
	\renewcommand\@GEWISfooter{%
		\ifdefempty{\@@agendaDate}{%
				\ifdefempty{\@@agendaVersion}{}{\@languageVersion\@@agendaVersion}%
			}{%
				\ifdefempty{\@@agendaVersion}{\@@agendaDate}{\@@agendaDate, \@languageVersion\@@agendaVersion}%
		}%
	}%

	\iftoggle{minutesversion}{
		\newwrite\template
		\immediate\openout\template=Minutes\@@meetingNumber.tex
		% Standard comments
		\write\template{\@percentchar\@percentchar\space GEWIS Minutes Template}
		\write\template{\@percentchar\@percentchar\space Stijl}
		\write\template{\@percentchar\@percentchar\space All documentation can be found on https://gewis.nl/corporateidentity/document/agenda}
		\write\template{}
		% Documentclass with commented out options
		\write\template{\@backslashchar documentclass[}
		\write\template{\@tabchar\@percentchar dutch}
		\write\template{\@tabchar\@percentchar printversion}
		\write\template{]{GEWISMinutes}}
		\write\template{}
		% Error on too old minutes
		\write\template{\@percentchar\@percentchar This example agenda requires major version 1.x for compatibility}
		\write\template{\@backslashchar minutesMajorVersion{1}}
		\write\template{}
		% Package of organ
		\write\template{\@percentchar\@percentchar Setting the details about the organ}
		\write\template{\@backslashchar usepackage[\@@organAbr]{GEWISCommitteeInfo}}
		\write\template{}
		% Meetingnumber and date
		\write\template{\@percentchar\@percentchar Setting the details about this meeting}
		\write\template{\@backslashchar meetingNumberPrefix{\@@meetingNumberPrefix}}
		\write\template{\@backslashchar meetingNumber[\@@meetingNumbersconly]{\@@meetingNumber}}
		\write\template{\@backslashchar lastmeetingNumber[\@@lastMeetingNumbersconly]{\@@lastMeetingNumber}}
		\write\template{\@backslashchar meetingDate{\themeetingDay}{\themeetingMonth}{\themeetingYear}}
		\write\template{\@backslashchar minutesDate{\themeetingDay}{\themeetingMonth}{\themeetingYear}}
		\write\template{\@backslashchar minutesVersion{1.0}}
		\write\template{}
		% Presencelist
		\write\template{\@percentchar\@percentchar Setting the functions}
		\write\template{\@backslashchar chair{\unexpanded\expandafter{\@@chairman}}}
		\write\template{\@backslashchar minuteTaker{\unexpanded\expandafter{\@@minuteTaker}}}
		\write\template{}
		\write\template{\@percentchar\@percentchar Setting the presence}
		\write\template{\@backslashchar present{\unexpanded\expandafter{\@@present}}}
		\write\template{\@backslashchar absentNotice{\unexpanded\expandafter{\@@absentnotice}}}
		\write\template{\@backslashchar absent{\unexpanded\expandafter{\@@absent}}}
		\write\template{\@backslashchar guests{\unexpanded\expandafter{\@@guests}}}
		\write\template{}
		\write\template{\@backslashchar begin{document}}
	}\relax
	\iftoggle{alt}{}{
		\@presenceList
	}
	\vspace{1em}
	
	\begin{enumerate}[parsep=1pt,topsep=0pt]
}

%% Close tabular, end with printFinal
\AtEndDocument{
	\end{enumerate}
	\iftoggle{hasAds}{
		\vspace{1em}
		\@adlist
	}\relax
	\iftoggle{GMM}{
		\vspace{1em}
		Until four days before the meeting new items may still be put forward. The meeting documents are available for inspection a week prior to the meeting. Please read these documents carefully in advance. Please do not leave these documents unattended but rather destroy them.
	}\relax
	\iftoggle{hasActionpoint}{
		\ifnum\value{page}=1\newpage\else\vspace{1em}\fi
		\@actionlist
	}\relax
	\iftoggle{posterversion}{
		\write\general{</ol>';}
		\write\general{$array = [}
		\write\general{"meetingNumber" => "\@@meetingNumber",}
		\write\general{"meetingLocation" => "\@@meetingLocation",}
		\write\general{"meetingTime" => "\@@meetingTime",}
		\write\general{"meetingMonth" => "\themeetingMonth",}
		\write\general{"meetingDay" => "\themeetingDay",}
		\write\general{"meetingYear" => "\themeetingYear",}
		\write\general{];}
		\write\general{?>}
		\closeout\general
	}\relax

	\iftoggle{minutesversion}{
		\write\template{}
		\write\template{\@percentchar\@backslashchar appendix}
		\write\template{\@percentchar\@backslashchar printActionlist}
		\write\template{\@percentchar\@backslashchar printDecisionlist}
		\write\template{}
		\write\template{\@backslashchar end{document}}
		\closeout\template
	}\relax
}


%%
%% Variables used for the agenda
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

\newcommand\agendaPointNumber[1]{\setcounter{currentPoint}{#1}}
\newcommand\pointNumber[1]{\setcounter{currentPoint}{#1}}
\newcommand\subPointNumber[1]{\setcounter{currentSubPoint}{#1}}
\newcommand\subpointNumber[1]{\setcounter{currentSubPoint}{#1}}
\newcommand\subSubPointNumber[1]{\setcounter{currentSubSubPoint}{#1}}
\newcommand\subsubpointNumber[1]{\setcounter{currentSubSubPoint}{#1}}

\newlength{\actNrWidth}
\newlength{\actNrTempWidth}
\newlength{\actNameWidth}
\newlength{\actNameTempWidth}

\newlength{\adNrWidth}
\newlength{\adNrTempWidth}

\settowidth{\actNrWidth}{\@languageNumber}

\DTLnewdb{actionpoints}
\DTLnewdb{comments}

\renewcommand{\labelenumii}{\arabic{enumii}.}
\renewcommand{\labelenumiii}{\arabic{enumiii}.}

%%
%% Modular methods for agendaPoint
%%
\newcommand\@updateNumber{
	\renewcommand\customNumber{}
	\renewcommand\customSubNumber{}
	\renewcommand\customSubSubNumber{}
	\setcounter{currentSubPoint}{1}
	\setcounter{currentSubSubPoint}{1}
}

%%
%% Generating a new agendapoint
%%
\newcommand\point[2][\theenumi]{
	\iftoggle{posterversion}{%
		\ifnum\value{currentSubPoint}>1\write\general{</ol>}\fi
		\ifnum\value{currentSubSubPoint}>1\write\general{</ol>}\fi
		\write\general{<li>#2</li>}\relax
	}\relax
	\ifnum\value{currentSubSubPoint}>1\end{enumerate}\fi
	\ifnum\value{currentSubPoint}>1\end{enumerate}\fi
	\@updateNumber
	\ifthenelse{\equal{#1}{\theenumi}}{
		\stepcounter{currentPoint}{\large\item#2}
		\iftoggle{minutesversion}{
			\write\template{}
			\write\template{\@percentchar\@backslashchar section{#2}}
		}\relax
	}{
		\renewcommand\customNumber{#1}{\large\item[#1.]#2}
		\iftoggle{minutesversion}{%
			\write\template{}
			\write\template{\@percentchar\@backslashchar section[#1]{#2}}	
		}\relax
	}
}

%%
%% Generating a new subpoint
%%
\newcommand\subpoint[2][\theenumii]{\subPoint[#1]{#2}}
\newcommand\subPoint[2][\theenumii]{
	\ifnum\value{currentPoint}=1\ClassError{GEWISAgenda}{Agendapoint error: subpoint called before a creation of a agendapoint.}\relax\fi
	\iftoggle{posterversion}{
		\ifnum\value{currentSubPoint}=1\write\general{<ol>}\fi
		\ifnum\value{currentSubSubPoint}>1\write\general{</ol>}\fi
		\write\general{<li>#2</li>}\relax
	}\relax
	\ifnum\value{currentSubPoint}=1\begin{enumerate}[parsep=3pt,topsep=4pt,leftmargin=16pt]\else
	\ifnum\value{currentSubSubPoint}>1\end{enumerate}\fi\fi
	\renewcommand\customSubNumber{}
	\renewcommand\customSubSubNumber{}
	\setcounter{currentSubSubPoint}{1}
	\ifthenelse{\equal{#1}{\theenumii}}{
		\stepcounter{currentSubPoint}{\item#2}
		\iftoggle{minutesversion}{%
			\write\template{}		
			\write\template{\@percentchar\@backslashchar subsection{#2}}
		}\relax
	}{%
		\renewcommand\customSubNumber{#1}{\item[#1.]#2}
		\iftoggle{minutesversion}{%
			\write\template{}
			\write\template{\@percentchar\@backslashchar subsection[#1]{#2}}		
		}\relax
	}
}

%%
%% Generating a new subsubpoint
%%
\newcommand\subsubpoint[2][\theenumiii]{\subSubPoint[#1]{#2}}
\newcommand\subSubPoint[2][\theenumiii]{
	\ifnum\value{currentPoint}=1\ClassError{GEWISAgenda}{Agendapoint error: subpoint called before a creation of a agendapoint.}\relax\fi
	\ifnum\value{currentSubPoint}=1\ClassError{GEWISAgenda}{Agendapoint error: subpoint called before a creation of a agendapoint.}\relax\fi
	\iftoggle{posterversion}{
		\ifnum\value{currentSubSubPoint}=1\write\general{<ol>}\fi
		\write\general{<li>#2</li>}
	}\relax
	\ifnum\value{currentSubSubPoint}=1\begin{enumerate}[parsep=3pt,topsep=3pt,leftmargin=15pt]\fi
	\renewcommand\customSubSubNumber{}
	\ifthenelse{\equal{#1}{\theenumiii}}{
		\stepcounter{currentSubSubPoint}{\small\item#2}
		\iftoggle{minutesversion}{%
			\write\template{}
			\write\template{\@percentchar\@backslashchar subsubsection{#2}}	
		}\relax
	}{%
		\renewcommand\customSubSubNumber{#1}{\small\item[#1.]#2}
		\iftoggle{minutesversion}{%
			\write\template{}
			\write\template{\@percentchar\@backslashchar subsubsection[#1]{#2}}		
		}\relax
	}
}


%% Generating opening
\newcommand\opening[1][\theenumi]{%
	\point[#1]{Opening}
	\iftoggle{minutesversion}{%
		\write\template{\@percentchar\@backslashchar open{}}
	}\relax
}

%% Generating determining final agenda
\newcommand\DFA[1][\theenumi]{%
	\point[#1]{\@languageDFA}
}

%% Generating announcements
\newcommand\announcements[1][\theenumi]{%
	\point[#1]{\@languageAnnouncements}
}

%% Generating mail
\newcommand\mail[1][\theenumi]{%
	\point[#1]{\@languageMail}
	\iftoggle{minutesversion}{%
		\write\template{\@percentchar\@backslashchar begin{quote}}
		\write\template{\@percentchar\@tabchar quote of mail}
		\write\template{\@percentchar\@backslashchar end{quote}}
		\write\template{}
		\write\template{\@percentchar\@backslashchar begin{itemize}}
		\write\template{\@percentchar\@tabchar\@backslashchar item mailitem}
		\write\template{\@percentchar\@backslashchar end{itemize}}
	}\relax
}

%% Generating action points
\newcommand\actionPoints[1][\theenumi]{%
	\point[#1]{\@languageActionPoints}
}

%% Generating any other businesses
\newcommand\AOB[1][\theenumi]{%
	\point[#1]{\@languageOAB}
}

%% Generating inquiry
\newcommand\finalInquiry[1][\theenumi]{%
	\point[#1]{\@languageInquiry}
}

%% Generating closure
\newcommand\closure[1][\theenumi]{%
	\point[#1]{\@languageClosure}
	\iftoggle{minutesversion}{%
		\write\template{\@percentchar\@backslashchar close{}}
	}\relax
}

%%
%% Alternative last minutes command, for poster implementation
%%
\newtoggle{hasToggled}
\global\togglefalse{hasToggled}
\newcommand\minutes[1][\theenumi]{%
	\iftoggle{posterversion}{
		\ifnum\value{currentSubPoint}>1\write\general{</ol>}\fi
		\ifnum\value{currentSubSubPoint}>1\write\general{</ol>}\fi
		\write\general{<li>\@languageMinutes\space\@@lastMeetingNumbersc\space\@languageAlt</li>}
	}\relax
	\iftoggle{alt}{
		\ifnum\value{currentSubPoint}>1\end{enumerate}\fi
		\@updateNumber
		\ifthenelse{\equal{#1}{\theenumi}}{
			\stepcounter{currentPoint}{\large\item\@languageMinutes\space\@@lastMeetingNumbersc\space\@languageAlt}
			\iftoggle{minutesversion}{%
				\write\template{}
				\write\template{\@percentchar\@backslashchar section{\@backslashchar texorpdfstring{\@languageMinutes\space\@@lastMeetingNumbersc\space\@languageAlt}{\@languageMinutes}}}
				
			}\relax
		}{
			\renewcommand\customNumber{#1}{\large\item[#1.] \@languageMinutes\space\@@lastMeetingNumbersc\space\@languageAlt}
			\iftoggle{minutesversion}{%
				\write\template{}
				\write\template{\@percentchar\@backslashchar section[#1]{\@backslashchar texorpdfstring{\@languageMinutes\space\@@lastMeetingNumbersc\space\@languageAlt}{\@languageMinutes}}}
			}\relax
		}
	}{
		\ifthenelse{\equal{#1}{\theenumi}}{
			\iftoggle{minutesversion}{%
				\write\template{}
				\write\template{\@percentchar\@backslashchar section{\@backslashchar texorpdfstring{\@languageMinutes\space\@@lastMeetingNumbersc\space\@languageMeeting}{\@languageMinutes}}}	
			}\relax
		}{
			\iftoggle{minutesversion}{%
				\write\template{}
				\write\template{\@percentchar\@backslashchar section[#1]{\@backslashchar texorpdfstring{\@languageMinutes\space\@@lastMeetingNumbersc\space\@languageMeeting}{\@languageMinutes}}}	
			}\relax	
		}
		\iftoggle{minutesversion}{
			\write\template{\@percentchar\@backslashchar approveMinutes}
			\write\template{}
			\global\togglefalse{minutesversion}
			\global\toggletrue{hasToggled}
		}\relax
		\point[#1]{\@languageMinutes\space\@@lastMeetingNumbersc\space\@languageMeeting}
		\iftoggle{hasToggled}{
			\global\toggletrue{minutesversion}
			\global\togglefalse{hasToggled}
		}\relax
	}
}

%%
%% Adding notes for chairman only
%%
\newcommand\note[1]{
	\iftoggle{notes}{%
		\item[] {\footnotesize\textit{\textcolor{GEWISred}{#1}}}%
	}\relax%
}

%%
%% Generating a new actionpoint
%%
\newenvironment{actionlist}{%
	\iftoggle{minutesversion}{%
		\write\template{\@percentchar\@backslashchar begin{actionlist}}%
	}\relax%
}{%
	\iftoggle{minutesversion}{%
		\write\template{\@percentchar\@backslashchar end{actionlist}}%
	}\relax%
}%

\newtoggle{hasActionpoint}
\global\togglefalse{hasActionpoint}
\newcommand\actionitem[4]{%
	\global\toggletrue{hasActionpoint}%
	\DTLnewrow{actionpoints}%
	\dtlexpandnewvalue%
	\DTLnewdbentry{actionpoints}{number}{#1}%
	\DTLnewdbentry{actionpoints}{action}{#4}%
	\DTLnewdbentry{actionpoints}{deadline}{#2}%
	\dtlnoexpandnewvalue%
	\DTLnewdbentry{actionpoints}{person}{\getnames{#3}}%
	%
	\def\actionnames{#3}
	\readlist*\nameslist{\actionnames}%
	\foreachitem\name\in\nameslist[]{%
		\settowidth{\global\actNameTempWidth}{xx\name}%
		\ifdim \the\actNameTempWidth > \the\actNameWidth%
		\settowidth{\global\actNameWidth}{xx\name}\fi%
	}%
	\settowidth{\global\actNrTempWidth}{#1x}%
	\ifdim\the\actNrTempWidth>\the\actNrWidth%
	\settowidth{\global\actNrWidth}{#1x}\fi%
	%
	\iftoggle{minutesversion}{%
		\write\template{\@percentchar\@tabchar\@backslashchar actionitem{#1}{#2}{\unexpanded{#3}}{#4}}%
		\write\template{\@percentchar}%
	}\relax%
}

%%
%% Generating new comments in combination with the right agendapoint
%%
\newtoggle{hasAds}
\global\togglefalse{hasAds}
\newcommand\ad[1]{
	\global\toggletrue{hasAds}
	\ifthenelse{\equal{\customNumber}{}}{\renewcommand\@goodCurrentPoint{\the\numexpr\value{currentPoint}-1}}{\renewcommand\@goodCurrentPoint{\customNumber}}
	\ifthenelse{\equal{\customSubNumber}{}}{\renewcommand\@goodCurrentSubPoint{\the\numexpr\value{currentSubPoint}-1}}{\renewcommand\@goodCurrentSubPoint{\customSubNumber}}
	\ifthenelse{\equal{\customSubSubNumber}{}}{\renewcommand\@goodCurrentSubSubPoint{\the\numexpr\value{currentSubSubPoint}-1}}{\renewcommand\@goodCurrentSubSubPoint{\customSubSubNumber}}
	\dtlexpandnewvalue
	\DTLnewrow{comments}
	\DTLnewdbentry{comments}{comment}{#1}
	\ifthenelse{\equal{\@goodCurrentSubPoint}{0}}{
		\DTLnewdbentry{comments}{number}{\@goodCurrentPoint}
		\settowidth{\global\adNrTempWidth}{xAd \@goodCurrentPoint}
		\ifdim \the\adNrTempWidth > \the\adNrWidth
		\settowidth{\global\adNrWidth}{xAd \@goodCurrentPoint}\fi
	}{
		\ifthenelse{\equal{\@goodCurrentSubSubPoint}{0}}{
			\DTLnewdbentry{comments}{number}{\@goodCurrentPoint.\@goodCurrentSubPoint}
			\settowidth{\global\adNrTempWidth}{xAd \@goodCurrentPoint.\@goodCurrentSubPoint}
			\ifdim \the\adNrTempWidth > \the\adNrWidth
			\settowidth{\global\adNrWidth}{xAd \@goodCurrentPoint.\@goodCurrentSubPoint}\fi
		}{
			\DTLnewdbentry{comments}{number}{\@goodCurrentPoint.\@goodCurrentSubPoint.\@goodCurrentSubSubPoint}
			\settowidth{\global\adNrTempWidth}{xAd \@goodCurrentPoint.\@goodCurrentSubPoint.\@goodCurrentSubSubPoint}
			\ifdim \the\adNrTempWidth > \the\adNrWidth
			\settowidth{\global\adNrWidth}{xAd \@goodCurrentPoint.\@goodCurrentSubPoint.\@goodCurrentSubSubPoint}\fi
		}
	}
	\dtlnoexpandnewvalue
}

%%
%% Printing the comments and final message (if enabled)
%%
\newcommand\@adlist{
	\let\bfseriesback\bfseries
	\let\bfseries\empty
	\begin{NoHyper} 
		\begin{description}[labelwidth=\adNrWidth,parsep=0pt,topsep=0pt,leftmargin=!]
			\DTLforeach*{comments}{\theComment=comment,\theNumber=number}{%
				% For potential feature addendum
				%\immediate\write\comments{<tr>}%
				%\immediate\write\comments{<th class="number"> Ad \theNumber </th>}%
				%\immediate\write\comments{<th class="comment"> \theComment </th>}%
				%\immediate\write\comments{</tr>}%
				\item[Ad \theNumber] \theComment
			}%
		\end{description}
	\end{NoHyper}
	\let\bfseries\bfseriesback\relax
}

\newcommand\@actionlist{
	\let\bfseriesback\bfseries
	\let\bfseries\empty
	\begin{NoHyper}
		\begin{longtable}{@{}p{\actNrWidth} >{\raggedright}p{2cm} >{\raggedright}p{\actNameWidth} p{11.7cm-\actNrWidth-\actNameWidth}}
			{\bfseriesback\@languageNumber}&{\bfseriesback\@languageDeadline}&{\bfseriesback\@languageName}&{\bfseriesback\@languageAction}%
			\DTLforeach*{actionpoints}{\theAction=action,\theNumber=number,\thePerson=person,\theDeadline=deadline}{%
				\\\theNumber&\theDeadline&\thePerson&\theAction%
			}%
		\end{longtable}
	\end{NoHyper}
	\let\bfseries\bfseriesback\relax
}
