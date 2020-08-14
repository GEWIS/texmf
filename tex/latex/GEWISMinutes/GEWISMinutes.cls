%% GEWIS Minute Tex style v0.4
%% Stijl - Gijs de Man, Rink Pieters

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{GEWISMinutes}[2020/05/13 GEWIS Minute Class]
\LoadClass[a4paper, 11pt]{article}

\RequirePackageWithOptions{GEWISAgendaMinutes}[2020/05/13]

\@ifpackagelater{GEWISAgendaMinutes}{2020/05/14}{%
    \ClassError{GEWISAgenda}{Version mismatch: this version of the minutes class requires exactly GEWISAgendaMinutes package v0.4. A newer version was found}{}%
}{
    \@ifpackagelater{GEWISAgendaMinutes}{2020/05/13}{}{%
        \ClassError{GEWISAgenda}{Version mismatch: this version of the minutes class requires exactly GEWISAgendaMinutes package v0.4. An older version was found}{}%
    }
}


%%
%% General commands for minutes
%%
