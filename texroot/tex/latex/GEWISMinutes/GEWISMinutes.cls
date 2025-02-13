%% GEWIS Minute Tex style v1.1
%% Stijl - Gijs de Man, Rink Pieters
%% Minor textual changes made in 2025 by Jens Knapen

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{GEWISMinutes}[2021/04/16 GEWIS Minute Class]

\LoadClassWithOptions{GEWISDocument}
\RequirePackage{GEWISAgendaMinutes}

% Version control
\def\@majorVersion{1}
\@agendaMinutesMajorVersion{1}
\documentMajorVersion{1}
\newcommand{\minutesMajorVersion}[1]{
	\ifnum\numexpr#1\relax=\numexpr\@majorVersion\relax\else
	\ClassError{GEWISMinutes}{Major version mismatch. Check corporate identity for more information.}
	\fi
}

%%
%% Packages only used in the minutes
%%
\usepackage{titlesec}		% Adjust the formatting of sections, subsections etc.
\usepackage{lineno} 		% For line numbers
\usepackage{marginnote}
\usepackage{manyfoot}		% For multiple footnote layers

%%
%% Language options used in the minutes only
%%
\newcommand\@languageDocument{Minutes of the\xspace}
\newcommand\@languageActionPoint{Action point\xspace}
\newcommand\@languageActionPointlist{List of action points}
\newcommand\@languageDecision{Decision\xspace}
\newcommand\@languageDecisionlist{List of decisions}
\newcommand\@languageFor{for}
\newcommand\@languageOn{on}

% Opening, adjourning and closing meeting
\newcommand\@languageOpenGMM{\@@chairman welcomes everyone and opens the \@@meetingNumbersc\ \@languageAlt\ of GEWIS with three scales of the hammer on \@@meetingDate\ at }
\newcommand\@languageOpenAlt{\@@chairman opens the \@@meetingNumbersc\ \@languageAlt\ at }
\newcommand\@languageChairs{and chairs the meeting}

\newcommand\@languageCloseGMM{\@@chairman thanks everybody for attending the \@languageAlt\ and closes the \@@meetingNumbersc\ \@languageAlt\ with three scales of the hammer at }
\newcommand\@languageCloseAlt{\@@chairman closes the \@@meetingNumbersc\ \@languageAlt\ at }

\newcommand\@languageAdjourn{The meeting is adjourned at }
\newcommand\@languageContinue{The meeting is continued at }

% Decision related
\newcommand\@languageApproveMinutes{The minutes of the \@@lastMeetingNumbersc\ are approved with thanks to the minute-taker.}
\newcommand\@languageApproveMinutesDutch{De notulen van de \@@lastMeetingNumbersc\ vergadering worden goedgekeurd met dank aan de notulist.}

% Action point related 
\newcommand\@languageDiscuss{The action points are discussed:}

% Entering and leaving the meeting
\newcommand\@languageEnters{enters}
\newcommand\@languageEnter{\@languageEnters\ the meeting at }
\newcommand\@languageLeaves{leaves}
\newcommand\@languageLeave{\@languageLeaves\ the meeting at }

% Any other business
\newcommand\@languageAOBrequests{requests}
\newcommand\@languageAOBrequest{\@languageAOBrequests\ a point for the A.O.B: }

% Voting proposals
\newcommand\@languageVoteProposal{Voting proposal}
\newcommand\@languageVoteFollows{A voting follows and voting proposal}
\newcommand\@languageVoteOverwhelmed{\@languageVoteAccepted~an overwhelming majority}
\newcommand\@languageVote{vote}
\newcommand\@languageVotes{votes}
\newcommand\@languageVoteAccepted{is accepted with}
\newcommand\@languageVoteRejected{is rejected with}
\newcommand\@languageVoteFavor{in favor and with}
\newcommand\@languageVoteAgainst{against}
\newcommand\@languageFromVoting{from voting}
\newcommand\@languageAbstainedSingular{abstained}
\newcommand\@languageAbstainedPlural{abstained}
\newcommand\@languageVotePerson{person}
\newcommand\@languageVotePersons{persons}

\iftoggle{dutch}{
	\renewcommand\@languageDocument{Notulen van de\xspace}
	\renewcommand\@languageActionPoint{Actiepunt\xspace}
	\renewcommand\@languageActionPointlist{Lijst met actiepunten}
	\renewcommand\@languageDecision{Besluit\xspace}
	\renewcommand\@languageDecisionlist{Lijst met besluiten}
	\renewcommand\@languageFor{voor}
	\renewcommand\@languageOn{op}
	
	% Opening, adjourning and closing meeting
	\renewcommand\@languageOpenGMM{\@@chairman verwelkomt iedereen en opent de \@@meetingNumbersc\ \@languageAlt\ van GEWIS met drie slagen met de hammer op \@@meetingDate\ at }
	\renewcommand\@languageOpenAlt{\@@chairman opent de \@@meetingNumbersc\ \@languageAlt\ om }
	\renewcommand\@languageChairs{en zit de vergadering voor}
	
	\renewcommand\@languageCloseGMM{\@@chairman bedankt iedereen voor het aanwezig zijn bij de \@languageAlt\ en sluit de \@@meetingNumbersc\ \@languageAlt met drie slagen van de hamer om }
	\renewcommand\@languageCloseAlt{\@@chairman sluit de \@@meetingNumbersc\ \@languageAlt\ om }
	
	\renewcommand\@languageAdjourn{De vergadering wordt geschorst om }
	\renewcommand\@languageContinue{De vergadering wordt heropend om }
	
	% Decision related
	\renewcommand\@languageApproveMinutes{De notulen van de \@@lastMeetingNumbersc\ vergadering worden goedgekeurd met dank aan de notulist.}
	
	% Action point related
	\renewcommand\@languageDiscuss{De actiepunten worden besproken:}
	
	% Entering and leaving the meeting
	\renewcommand\@languageEnters{komt}
	\renewcommand\@languageEnter{\@languageEnters\ de vergadering binnen om }
	\renewcommand\@languageLeaves{verlaat}
	\renewcommand\@languageLeave{\@languageLeaves\ de vergadering om }
	
	% Any other business
	\renewcommand\@languageAOBrequests{vraagt}
	\renewcommand\@languageAOBrequest{\@languageAOBrequests\ een punt aan voor de W.V.T.T.K.: }
	
	% Voting proposals
	\renewcommand\@languageVoteProposal{Stemvoorstel}
	\renewcommand\@languageVoteFollows{Een stemming volgt en stemvoorstel}
	\renewcommand\@languageVoteOverwhelmed{\@languageVoteAccepted~een overweldigende meerderheid}
	\renewcommand\@languageVote{stem}
	\renewcommand\@languageVotes{stemmen}
	\renewcommand\@languageVoteAccepted{wordt geaccepteerd met}
	\renewcommand\@languageVoteRejected{wordt afgekeurd met}
	\renewcommand\@languageVoteFavor{voor en met}
	\renewcommand\@languageVoteAgainst{tegen}
	\renewcommand\@languageFromVoting{van stemming}
	\renewcommand\@languageAbstainedSingular{onthield zich}
	\renewcommand\@languageAbstainedPlural{onthielden zich}
	\renewcommand\@languageVotePerson{persoon}
	\renewcommand\@languageVotePersons{personen}
}

% Settings some stuff for writing the minutes template
\begingroup
\catcode`\^^I=12
\gdef\@tabchar{^^I}
\endgroup

%%
%% Complete settings for first page
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

%%
%% Set hooks for beginning of the document and the end of the document
%%
\AtBeginDocument{
	\renewcommand\@GEWISfooter{
		\ifdefempty{\@@agendaDate}{%
			\ifdefempty{\@@agendaVersion}{}{\@languageVersion\@@agendaVersion}%
		}{%
			\ifdefempty{\@@agendaVersion}{\@@agendaDate}{\@@agendaDate, \@languageVersion\@@agendaVersion}%
		}
	}
	\@presenceList
	\newwrite\actionexporttex
	\immediate\openout\actionexporttex=actionlist.tex
	\write\actionexporttex{\@backslashchar begin{actionlist}}
}

\AtEndDocument{
	\vspace{1em}
	\write\actionexporttex{\@backslashchar end{actionlist}}
	\closeout\actionexporttex
}

%%
%% Settings relevant to the minutes, including linenumbers and spacing
%%
\renewcommand*{\labelitemi}{-}
\modulolinenumbers[5]
\linenumbers

%Space between all paragraphs, headers and lists
\setlength\parskip{0.75em}\relax

\titlespacing*{\section}{0pt}{0.5em}{0pt}
\titlespacing*{\subsection}{0pt}{0.5em}{0pt}

\setitemize{noitemsep,topsep=0pt,parsep=0.4em,partopsep=0pt}
\setenumerate{noitemsep,topsep=0pt,parsep=0.4em,partopsep=0pt}

\newcommand\manyfoottarget{\makebox[0pt][t]{\Hy@raisedlink{\hypertarget{Hfootnote.\theHfootnote}\quad}}}
\patchcmd\MFL@fnoteplain{\rule}{\manyfoottarget\rule}{}{\fail}
\renewcommand\footnote[1]{\footnoteA{#1}}
\DeclareNewFootnote{A}[arabic]
\DeclareNewFootnote{B}[Roman]

%%
%% Commands for custom headers on the agenda
%%
% Command for sections
\let\sectionback\section
\renewcommand{\section}{\@ifstar{\@sectionstarred}{\@sectionstarless}}

\newcommand{\@sectionstarred}[2][\thesection]{
	\sectionback*{#2}
}
\newcommand{\@sectionstarless}[2][\thesection]{
	\ifthenelse{\equal{#1}{\thesection}}{
		\sectionback{#2}
	}{
		\sectionback*{#1\hspace{0.5cm}#2}
	}
}

% Command for subsections
\let\subsectionback\subsection
\renewcommand{\subsection}{\@ifstar{\@subsectionstarred}{\@subsectionstarless}}

\newcommand{\@subsectionstarred}[2][\thesubsection]{
	\subsectionback*{#2}
}
\newcommand{\@subsectionstarless}[2][\thesubsection]{
	\ifthenelse{\equal{#1}{\thesubsection}}{
		\subsectionback{#2}
	}{
		\subsectionback*{#1\hspace{0.5cm}#2}
	}
}

% Command for subsubsections
\let\subsubsectionback\subsubsection
\renewcommand{\subsubsection}{\@ifstar{\@subsubsectionstarred}{\@subsubsectionstarless}}

\newcommand{\@subsubsectionstarred}[2][\thesubsubsection]{
	\subsubsectionback*{#2}
}
\newcommand{\@subsubsectionstarless}[2][\thesubsubsection]{
	\ifthenelse{\equal{#1}{\thesubsubsection}}{
		\subsubsectionback{#2}
	}{
		\subsubsectionback*{#1\hspace{0.5cm}#2}
	}
}

%%
%% Opening, adjourning and closing the meeting
%%
\newcommand{\open}[1]{
	\iftoggle{GMM}{
		\@languageOpenGMM #1.
	}{
		\@languageOpenAlt #1 \@languageChairs.
	}
}

\newcommand{\close}[1]{
	\iftoggle{GMM}{
		\@languageCloseGMM #1.
	}{
		\@languageCloseAlt #1.
	}
}

\newcommand{\adjourn}[2]{
	\textit{\@languageAdjourn #1.}
	\vspace{3em}
	
	\textit{\@languageContinue #2.}
}

%%
%% Commando for the mail
%%
\renewcommand{\quote}{
	\list{}{\topsep=0pt\rightskip=0pt\leftskip=-1cm}\item%
	\let\bfseriesback\bfseries%
	\let\bfseries\empty%
	\itshape%
}{
	\endlist
	\let\bfseries\bfseriesback
}

% For setting translation based on plurar or not
\newcommand\@updatePlural[1]{
	% Checking amount of names
	\def\updateplurallist{#1}%
	\readlist*\nameslist{\updateplurallist}%
	\setcounter{anamessize}{0}%
	\foreachitem\name\in\nameslist[]{%
		\stepcounter{anamessize}%
	}%
	\ifnum\value{anamessize}=1
	\iftoggle{dutch}{
		\renewcommand\@languageEnters{komt}
		\renewcommand\@languageLeaves{verlaat}
		\renewcommand\@languageAOBrequests{vraagt}
	}{
		\renewcommand\@languageEnters{enters}
		\renewcommand\@languageLeaves{leaves}
		\renewcommand\@languageAOBrequests{requests}
	}
	\else
	\iftoggle{dutch}{
		\renewcommand\@languageEnters{komen}
		\renewcommand\@languageLeaves{verlaten}
		\renewcommand\@languageAOBrequests{vragen}
	}{
		\renewcommand\@languageEnters{enter}
		\renewcommand\@languageLeaves{leave}
		\renewcommand\@languageAOBrequests{request}
	}
	\fi
}

%%
%% Decisions (related) commands for the meeting
%%
\DTLnewdb{decisions}
\newlength{\decWidth}
\newlength{\decTempWidth}
\newcounter{decision}[section]

% Making a decision
\newtoggle{hasDecs}
\global\togglefalse{hasDecs}
\newcommand\decisionnumber{}
\newcommand\decision[2][nil]{
	\global\toggletrue{hasDecs}
	\iftoggle{alt}{
		\renewcommand\decisionnumber{\@@meetingNumber.\thesection.\thedecision}
	}{
		\renewcommand\decisionnumber{\@@meetingNumber.\thedecision}
	}
	\stepcounter{decision}%
	\begingroup
		\addtolength{\leftskip}{1cm}
		\ifthenelse{\NOT\equal{#1}{nil}}{\begin{otherlanguage}{dutch}}\relax
		\textbf{\@languageDecision \decisionnumber:} #2\ifthenelse{\NOT\equal{#1}{nil}}{\footnote{#1}}\relax\par
		\ifthenelse{\NOT\equal{#1}{nil}}{\end{otherlanguage}}\relax
	\endgroup
	\settowidth{\global\decTempWidth}{\@@meetingNumber.\thesection.\thedecision}
	\ifdim \the\decTempWidth > \the\decWidth
	\settowidth{\global\decWidth}{\@@meetingNumber.\thesection.\thedecision}\fi
	
	\dtlexpandnewvalue
	\DTLnewrow{decisions}
	\DTLnewdbentry{decisions}{number}{\decisionnumber}
	\DTLnewdbentry{decisions}{decision}{#2}
	\dtlnoexpandnewvalue
}

% Command for approving minutes in a standardized way
\newcommand\approveMinutes{
	\iftoggle{GMM}{%
		\decision[\@languageApproveMinutes]{\@languageApproveMinutesDutch}%
	}{%
		\decision{\@languageApproveMinutes}%
	}%
}

% Printing decisionlist at the end of the minutes
\newcommand{\printDecisionlist}{
	\iftoggle{hasDecs}{
		\section{\@languageDecisionlist}%
		\begin{NoHyper}
			\begin{longtable}{@{}>{\raggedright}p{\decWidth} p{14.5cm-\decWidth}}
				\textbf{\@languageNumber}&\textbf{\@languageDecision}\\*
				\DTLforeach*{decisions}{\theDecision=decision,\theNumber=number}{%
					\theNumber&\theDecision\\%
				}%
			\end{longtable}%
		\end{NoHyper}
	}\relax
}

%%
%% Actionpoint (related) commands for the meeting
%%
\DTLnewdb{actionpoints}
\newlength{\actNrWidth}
\newlength{\actNrTempWidth}
\newlength{\actNameWidth}
\newlength{\actNameTempWidth}
\newcounter{anames}
\newcounter{anamessize}
% More specific action points for GMM
\iftoggle{GMM}{
	\newcounter{actionpoint}[section]
}{
	\newcounter{actionpoint}
}

% Environment for action listing at beginning of minutes
\newenvironment{actionlist}{
	\@languageDiscuss
	\inactionlisttrue
	\begin{itemize}
	}{
	\end{itemize}
	\inactionlistfalse
}

% Actionitems for in the action listing environment
\newif\ifinactionlist
\newcommand\actionitem[4]{
	\ifinactionlist
	\item \textbf{\@languageActionPoint #1} \@languageFor\ \getnames{#3}\ \@languageOn\ #2: #4\par
	\else
	\ClassError{GEWISMinutes}{Lonely \@backslashchar actionitem--perhaps a missing actionlist environment}{}
	\fi
}	

% Commando for setting a width of action table
\newcommand\@setnameswidth[1]{
	\def\setnameswidthlist{#1}
	\readlist*\nameslist{\setnameswidthlist}%
	\foreachitem\name\in\nameslist[]{%
		\settowidth{\global\actNameTempWidth}{\& \name}%
		\ifdim \the\actNameTempWidth > \the\actNameWidth%
		\settowidth{\global\actNameWidth}{\& \name}\fi%
	}
}

% Action point command for starred en non-starred option
\newcommand\actionpoint{\par\@ifstar{\@extendActionpoint}{\@createActionpoint}}

% Action point when preceding action point has to be prolonged
\newtoggle{hasActionpoint}
\global\togglefalse{hasActionpoint}
\newcommand\@extendActionpoint[4]{
	\global\toggletrue{hasActionpoint}
	\begingroup
		\addtolength{\leftskip}{1cm}
		Verlenging van \textbf{\@languageActionPoint #1}\ \@languageFor\ \getnames{#3}\ \@languageOn\ #2: #4\par
	\endgroup
	
	\@setnameswidth{#3}
	\settowidth{\global\actNrTempWidth}{#1}
	\ifdim \the\actNrTempWidth > \the\actNrWidth
	\settowidth{\global\actNrWidth}{#1}\fi
	
	% Make values for actionpoints in the database for later use
	\dtlexpandnewvalue
	\DTLnewrow{actionpoints}
	\DTLnewdbentry{actionpoints}{number}{#1}
	\DTLnewdbentry{actionpoints}{deadline}{#2}
	\DTLnewdbentry{actionpoints}{actionpoint}{#4}
	\dtlnoexpandnewvalue
	\DTLnewdbentry{actionpoints}{responsible}{\getnames{#3}}
	
	\write\actionexporttex{
		\@tabchar\@backslashchar actionitem{#1}{#2}{\unexpanded{#3}}{\unexpanded{#4}}
	}
}

% Action point when new action point has to be made
\newcommand\actionnumber{}
\newcommand\@createActionpoint[3]{
	\global\toggletrue{hasActionpoint}
	\iftoggle{alt}{
		\renewcommand\actionnumber{\@@meetingNumber.\thesection.\theactionpoint}
	}{
		\renewcommand\actionnumber{\@@meetingNumber.\theactionpoint}
	}
	\stepcounter{actionpoint}%
	
	\begingroup
		\addtolength{\leftskip}{1cm}
		\textbf{\@languageActionPoint\ \actionnumber}\ \@languageFor\ \getnames{#2}\ \@languageOn\ #1: #3\par
	\endgroup
	
	\@setnameswidth{#2}
	\settowidth{\global\actNrTempWidth}{\actionnumber}
	\ifdim \the\actNrTempWidth > \the\actNrWidth
	\settowidth{\global\actNrWidth}{\actionnumber}\fi
	
	% Make values for actionpoints in the database for later use
	\dtlexpandnewvalue
	\DTLnewrow{actionpoints}
	\DTLnewdbentry{actionpoints}{number}{\actionnumber}
	\DTLnewdbentry{actionpoints}{deadline}{#1}
	\DTLnewdbentry{actionpoints}{actionpoint}{#3}
	\dtlnoexpandnewvalue
	\DTLnewdbentry{actionpoints}{responsible}{\getnames{#2}}
	
	\write\actionexporttex{
		\@tabchar\@backslashchar actionitem{\actionnumber}{#1}{\unexpanded{#2}}{\unexpanded{#3}}
	}
}

%% Print actionlist at the end of the minutes
\newcommand{\printActionlist}{
	\iftoggle{hasActionpoint}{
		\section{\@languageActionPointlist}
		\begin{NoHyper}
			\begin{longtable}{@{}p{\actNrWidth} >{\raggedright}p{2cm} >{\raggedright}p{\actNameWidth} p{11.7cm-\actNrWidth-\actNameWidth}}
				\textbf{\@languageNumber}&\textbf{\@languageDeadline}&\textbf{\@languageName}&\textbf{\@languageAction}\\*
				\DTLforeach*{actionpoints}{\theAct=actionpoint,\theNumber=number,\theResp=responsible,\theDead=deadline}{%
					\theNumber&\theDead&\theResp&\theAct\\%
				}%
			\end{longtable}%
		\end{NoHyper}
	}\relax
}

%%
%% Commands for entering and leaving the meeting
%%
\newcounter{enter}
\newcounter{leave}
\newcounter{enames}
\newcounter{enamessize}

% Enter command for people entering the meeting
% Yet to implement leave command
\newcommand\enter[2]{%
	\@updatePlural{#1}%
	\let\bfseriesback\bfseries%
	\let\bfseries\empty%
	\begingroup%
		\renewcommand{\@makefnmark}{\makebox{\normalfont\@thefnmark}}%
		\marginnote{$\Leftarrow$ \footnotemarkB}%
	\endgroup%
	\footnotetextB{\label{Hfootnote.\theHfootnote}\getnames{#1}\ \@languageEnter #2}%
	\let\bfseries\bfseriesback
}

\newcommand\leave[2]{%
	\@updatePlural{#1}%
	\let\bfseriesback\bfseries%
	\let\bfseries\empty%
	\begingroup%
		\renewcommand{\@makefnmark}{\makebox{\normalfont\@thefnmark}}%
		\marginnote{$\Rightarrow$ \footnotemarkB}%
	\endgroup%
	\footnotetextB{\label{Hfootnote.\theHfootnote}\getnames{#1}\ \@languageLeave #2}
	\let\bfseries\bfseriesback
}

%%
%% Commands for any other business
%%
\newenvironment{aoblist}{
	\inaobtrue
	\begin{itemize}
	}{
	\end{itemize}
	\inaobfalse
}

% Aobitem for in the aob listing environment
\newif\ifinaob
\newcommand\aobitem[2]{
	\ifinaob
		\item \getnames{#1}: #2\par
	\else
		\ClassError{GEWISMinutes}{Lonely \@backslashchar aobitem--perhaps a missing aoblist environment}{}
	\fi
}

% Requesting an aob item
\newcommand\aob[2]{
	\@updatePlural{#1}%
	\begingroup
		\addtolength{\leftskip}{1cm}
		\getnames{#1}\ \@languageAOBrequest #2.\par
	\endgroup
}


%%
%% Commands only really interesting for the GMM
%% Note that Jens Knapen (Secretary 2024-2025) changed verbs ending in -ize (i.e. authorize) to -ise to conform with British spelling norms. 
%% This has been implemented here in February 2025, but can be changed according to the wishes of future members/secretaries
%%

%%
%% Authorisation
%%
\newenvironment{authlist}{
	Authorisations at the start of the GMM:
	\vspace{1em}
	\begingroup
	\setlength{\LTleft}{-20cm plus -1fill}
	\setlength{\LTright}{\LTleft}
	\inauthtrue
		\begin{longtable}{lcl}
		}{
		\end{longtable}
	\inauthfalse
	\endgroup
}

% Grant, to be used in authorisation environment
\newif\ifinauth
\newcommand{\authitem}[2]{%
	\ifinauth
	#1 & to & #2 \\
	\else
	\ClassError{GEWISMinutes}{Lonely \@backslashchar authitem--perhaps a missing authlist environment}{}
	\fi
}

%%
%% Voting proposals 
%%
\newcounter{vote}[section]

% Setting up a voting proposal
\newcommand\votenumber{}
\newcommand\vote[2][nil]{%
	\iftoggle{alt}{
		\renewcommand\votenumber{\@@meetingNumber.\thesection.\thevote}
	}{
		\renewcommand\votenumber{\@@meetingNumber.\thevote}
	}
	\stepcounter{vote}%
	\begingroup
		\addtolength{\leftskip}{1cm}
		\ifthenelse{\NOT\equal{#1}{nil}}{\begin{otherlanguage}{dutch}}\relax
		\textbf{\@languageVoteProposal: \votenumber}: #2\ifthenelse{\NOT\equal{#1}{nil}}{\footnote{#1}}\relax\par
		\ifthenelse{\NOT\equal{#1}{nil}}{\end{otherlanguage}}\relax
	\endgroup
}

\newcommand\voteAccepted{
	\begingroup
		\addtolength{\leftskip}{1cm}
		\@languageVoteFollows\ \votenumber\ \@languageVoteOverwhelmed.\par
	\endgroup
}

\newcommand\factor{}
\newcommand\voteResults{\@ifstar\@voteMajor\@voteMinor}
\newcommand\@voteMajor[3]{
	\renewcommand\factor{2}
	\@voteGeneral{#1}{#2}{#3}
}
\newcommand\@voteMinor[3]{
	\renewcommand\factor{1}
	\@voteGeneral{#1}{#2}{#3}
}

\newcommand\@voteGeneral[3]{
	{\addtolength{\leftskip}{1cm}%
		\@languageVoteFollows\ \votenumber\
		\ifnum\numexpr#1\relax>\numexpr(\factor*#2)\relax%
			\@languageVoteAccepted\ #1 \@getVotePlural{#1} \@languageVoteFavor\ #2 \@getVotePlural{#2} \@languageVoteAgainst.%
		\else%
			\@languageVoteRejected\ #1 \@getVotePlural{#1} \@languageVoteFavor\ #2 \@getVotePlural{#2} \@languageVoteAgainst.%
		\fi%
		\ifnum\numexpr#3\relax>0\ #3 \@getAbstainPlural{#3} \@languageFromVoting.\fi\par
	}
}

\newcommand\@getVotePlural[1]{%
	\ifnum\numexpr#1>1%
		\@languageVotes%
	\else%
		\@languageVote%
	\fi%
}%

\newcommand\@getAbstainPlural[1]{%
	\ifnum\numexpr#1>1%
		\@languageVotePersons\ \@languageAbstainedPlural%
	\else%
		\@languageVotePerson\ \@languageAbstainedSingular%
	\fi%
}%



\newcommand{\song}{
	\begin{quote}
		\textmusicalnote\ \textmusicalnote\ \textmusicalnote\\
		De nachtportier loopt door de gangen en zalen\\
		De laatste prof is net naar huis\\
		En menig student zit met huiswerk te balen\\
		De rest, die hangt voor de buis
		
		De liften die staken, geen treden die kraken\\
		Een AIO print snel nog wat uit\\
		De TU lijkt gestorven, maar dat is slechts schijn\\
		Want er klinkt nog een jolijk geluid:
		
		{\bfseriesback chorus:}\\
		Daar in het zuiden des lands aan de Dommel\\
		Elke student, ja die weet waar het is\\
		Daar in het zuiden des lands aan de Dommel\\
		Daar huist aan het eind van vloer acht ons GEWIS\\
		\textmusicalnote\ \textmusicalnote\ \textmusicalnote
	\end{quote}	
}
