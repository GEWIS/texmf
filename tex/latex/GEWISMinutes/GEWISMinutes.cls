%% GEWIS Minute style
%% Stijl - Gijs de Man, Rink Pieters

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{GEWISMinutes}[2020/03/16 GEWIS Minute Class]
\LoadClass[a4paper, 11pt]{article}

\usepackage[]{GEWISAgendaMinutes}

\@ifpackagelater{GEWISAgendaMinutes}{2020/02/26}{
    \ClassError{GEWISMinutes}{Version mismatch: this version of the minutes class requires exactly GEWISAgendaMinutes package v0.1. A newer version was found}%
}{
    \@ifpackagelater{GEWISAgendaMinutes}{2020/02/25}{}{
        \ClassError{GEWISMinutes}{Version mismatch: this version of the minutes class requires exactly GEWISAgendaMinutes package v0.1. An older version was found}%
    }
}

\ProcessOptions\relax


%%
%% General commands for minutes
%%
