<cfset local.contentHooks = getRCValue("contentHooks")>

<cfset local.contentHooks.title = "Christopher J. Bouchard">
<cfset local.contentHooks.app = "ResumeApp">

<cfsavecontent variable="local.contentHooks.head">
    <!-- Resume App -->
    <link rel="stylesheet" href="/assets/css/timeline.css">
    <script src="/assets/js/resume-app.js"></script>
    <script src="/assets/js/anchor.js"></script>
    <script src="/assets/js/timeline.js"></script>
    <script src="/assets/js/toggle-hidden.js"></script>
</cfsavecontent>

<cfsavecontent variable="local.contentHooks.jumbotron">
    <div class="logo logo-small">
        <a href="/">
            <img src="/assets/img/upliftinglemma_logo_white.svg">
            Uplifting Lemma
        </a>
    </div>
    <img id="portrait" class="img-thumbnail hidden-xs hidden-print"
            alt="Photo of Chris Bouchard"
            src="/assets/img/portrait.png">
    <h1>
        Christopher J. Bouchard<br>
        <small>Web Application Developer</small>
    </h1>
</cfsavecontent>

<div class="row">
    <div class="col-md-6">
        <!-- We pull the first column past the second at small
        display size or larger, but we let it show up first at
        extra-small display size and in print. -->
        <section>
            <a id="contact"></a>
            <div id="my-contact-info" class="row">
                <div class="col-sm-6 col-print-6">
                    <ul class="fa-ul">
                        <!-- Email -->
                        <li><p><a href="mailto:chris@upliftinglemma.net">
                            <span class="fa fa-li fa-send"></span>
                            chris@upliftinglemma.net
                        </a></p></li>

                        <!-- Phone number -->
                        <li><p><a href="callto:15189514883">
                            <span class="fa fa-li fa-phone"></span>
                            +1 (518) 951-4883
                        </a></p></li>

                        <!-- Address -->
                        <li><p>
                            <span class="fa fa-li fa-envelope"></span>
                            405 3rd Street<br>
                            2nd Floor<br>
                            Troy, NY 12180</p>
                        </p></li>
                    </ul>
                </div>
                <div class="col-sm-6 col-print-6">
                    <ul class="fa-ul">
                        <!-- Skype -->
                        <li><p><a href="skype:chrisjbouchard">
                            <span class="fa fa-li fa-skype"></span>
                            chrisjbouchard
                        </a></p></li>

                        <!-- Google+ -->
                        <li><p><a href="https://plus.google.com/u/1/105233296650473575628">
                            <span class="fa fa-li fa-google-plus-square"></span>
                            chrisbouchard01
                        </a></p></li>

                        <!-- deviantArt -->
                        <li><p><a href="http://chrisbouchard.deviantart.com/">
                            <span class="fa fa-li fa-deviantart"></span>
                            chrisbouchard
                        </a></p></li>

                        <!-- GitHub -->
                        <li><p><a href="https://github.com/chrisbouchard">
                            <span class="fa fa-li fa-github"></span>
                            chrisbouchard
                        </a></p></li>
                    </ul>
                </div>
            </div>
        </section>

        <section>
            <h2 anchor="timeline">Timeline</h2>

            <div cb-timeline="education, career"
                    data-group-classes="{'education': 'education-bar', 'career': 'career-bar'}">
            </div>
        </section>

        <section>
            <h2 anchor="education">Education</h2>

            <ul class="list-unstyled section-list">
                <!-- PhD -->
                <li>
                    <h5 id="phd-cs" cb-timeline-event="education"
                            data-start="Jan 2014">
                        Ph.D. Computer Science (In Progress)
                    </h5>
                    <br class="hidden-sm hidden-print">
                    <span class="date">
                        Expected December 2014
                    </span><br>
                    <span class="university">
                        University at Albany &mdash; SUNY, Albany, NY
                    </span>
                </li>

                <!-- MS -->
                <li>
                    <h5 id="ms-cs" cb-timeline-event="education"
                            data-start="Jan 2010"
                            data-end="Dec 2013">
                        M.S. Computer Science
                    </h5>
                    <br class="hidden-sm hidden-print">
                    <span class="date">
                        December 2013
                    </span><br>
                    <span class="university">
                        University at Albany &mdash; SUNY, Albany, NY
                    </span>
                </li>

                <!-- BS -->
                <li>
                    <h5 id="bs-cs-am" cb-timeline-event="education"
                            data-start="Sep 2006"
                            data-end="Dec 2009">
                        B.S. Computer Science and Applied Mathematics
                    </h5>
                    <br class="hidden-sm hidden-print">
                    <span class="date">
                        December 2009
                    </span><br>
                    <span class="university">
                        University at Albany &mdash; SUNY, Albany, NY
                    </span>
                </li>
            </ul>
        </section>

        <section toggle-hidden-group>
            <h2 anchor="career">
                Career History
                <small class="hidden-print" toggle-hidden-switch></small>
            </h2>

            <ul class="list-unstyled section-list">
                <!-- Web Application Developer -->
                <li>
                    <h5 id="lany-web-dev" cb-timeline-event="career"
                            data-start="Feb 2014">
                        Web Application Developer
                    </h5>
                    <br class="hidden-sm hidden-print">
                    <span class="date">
                        February 2014&ndash;Present
                    </span><br>
                    <span class="university">
                        LeadingAge New York
                    </span>
                    <ul class="duties-list">
                        <li>Designed and built a web application for
                        collecting survey data, with auto-save, using only
                        free software.</li>
                        <li>Deployed development, QA, and production
                        servers for the survey application running
                        CentOS.</li>
                        <li>Worked with developers at HANYS to design and
                        test an authentication scheme for the survey
                        application.</li>
                        <li>Implemented version control for source code
                        using git, GitLab, and Jenkins.</li>
                        <li>Worked within a team of developers to maintain
                        existing web sites.</li>
                        <li>Wrote SQL scripts to extract staff and member
                        information for the annual mailer.</li>
                    </ul>
                    <div class="contact">
                        Contact: Linda Spokane (Supervisor, VP Research &amp; Analytics)
                    </div>
                    <ul class="list-inline contact-info">
                        <li><a href="mailto:lspokane@leadingageny.org">
                            <span class="fa fa-send"></span><!--
                            -->lspokane@leadingageny.org
                        </a></li>
                        <li><a href="callto:15188678383">
                            <span class="fa fa-phone"></span><!--
                            -->+1 (518) 867-8383
                        </a></li>
                    </ul>
                </li>

                <!-- Teaching Assistant -->
                <li toggle-hidden>
                    <h5 id="suny-ta" cb-timeline-event="career"
                            data-start="Jan 2010" data-end="Dec 2013">
                        Teaching Assistant
                    </h5>
                    <br class="hidden-sm hidden-print">
                    <span class="date">
                        2010&ndash;2013
                    </span>
                    <div class="hidden-content">
                        <span class="university">
                            University at Albany &mdash; SUNY
                        </span>
                        <ul class="duties-list">
                            <li>Assisted professors teaching classes in
                            Java, C, and MIPS assembly programming,
                            including Unix systems programming.</li>
                            <li>Held weekly labs for approximately forty
                            students.</li>
                            <li>Ran and maintained class grading scripts in
                            bash and zsh.</li>
                        </ul>
                        <div class="contact">
                            Contact: Dr. S. S. Ravi (Professor)
                        </div>
                        <ul class="list-inline contact-info">
                            <li><a href="mailto:ravi@cs.albany.edu">
                                <span class="fa fa-send"></span><!--
                                -->ravi@cs.albany.edu
                            </a></li>
                            <li><a href="callto:15184424278">
                                <span class="fa fa-phone"></span><!--
                                -->+1 (518) 442-4278
                            </a></li>
                        </ul>
                    </div>
                </li>

                <!-- Research Assistant (Berg) -->
                <li toggle-hidden>
                    <h5 id="berg-ra" cb-timeline-event="career"
                            data-start="Jun 2013" data-end="Aug 2013">
                        Research Assistant
                    </h5>
                    <br class="hidden-sm hidden-print">
                    <span class="date">
                        Summer 2013
                    </span>
                    <div class="hidden-content">
                        <span class="university">
                            The Research Foundation &mdash; SUNY
                        </span>
                        <ul class="duties-list">
                            <li>Helped plan a website to summarize results
                            of a multi-year research project.</li>
                            <li>Researched applications of computer science
                            and computational thinking in the teaching of
                            financial market regulation.</li>
                        </ul>
                        <div class="contact">
                            Contact: Dr. George Berg (Research Advisor)
                        </div>
                        <ul class="list-inline contact-info">
                            <li><a href="mailto:berg@cs.albany.edu">
                                <span class="fa fa-send"></span><!--
                                -->berg@cs.albany.edu
                            </a></li>
                            <li><a href="callto:15184424267">
                                <span class="fa fa-phone"></span><!--
                                -->+1 (518) 442-4267
                            </a></li>
                        </ul>
                    </div>
                </li>

                <!-- Research Assistant (Dran) -->
                <li>
                    <h5 id="dran-ra" cb-timeline-event="career"
                            data-start="May 2010" data-end="Aug 2012">
                        Research Assistant
                    </h5>
                    <br class="hidden-sm hidden-print">
                    <span class="date">
                        2010&ndash;2012
                    </span><br>
                    <span class="university">
                        The Research Foundation &mdash; SUNY
                    </span>
                    <ul class="duties-list">
                        <li>Researched term rewriting and equational
                        unification modulo serveral theories, including the
                        theory of block chaining.</li>
                        <li>Co-authored peer-reviewed papers which were
                        accepted at conferences and workshops such as LATA
                        and UNIF.</li>
                        <li>Managed a private Git server for the research
                        group to manage papers and projects.</li>
                    </ul>
                    <div class="contact">
                        Contact: Dr. Paliath Narendran (Research Advisor)
                    </div>
                    <ul class="list-inline contact-info">
                        <li><a href="mailto:dran@cs.albany.edu">
                            <span class="fa fa-send"></span><!--
                            -->dran@cs.albany.edu
                        </a></li>
                        <li><a href="callto:15184423387">
                            <span class="fa fa-phone"></span><!--
                            -->+1 (518) 442-3387
                        </a></li>
                    </ul>
                </li>

                <!-- NYAHSA Services -->
                <li>
                    <h5 id="nyahsa-intern" cb-timeline-event="career"
                            data-start="Jun 2007" data-end="Aug 2009">
                        Intern
                    </h5>
                    <br class="hidden-sm hidden-print">
                    <span class="date">
                        2007&ndash;2009
                    </span><br>
                    <span class="university">
                        NYAHSA Services (Now LeadingAge NY Services)
                    </span>
                    <ul class="duties-list">
                        <li>Developed web applications using ColdFusion,
                        JavaScript, and Microsoft SQL Server.</li>
                        <li>Designed a SQL database schema and ColdFusion
                        front-end for storing and analyzing survey
                        results.</li>
                        <li>Assisted in redesigning the company website
                        using Mura CMS.</li>
                        <li>Prototyped an interface using Adobe Flex for
                        organizing and running reports in the EQUIP
                        analysis tool.</li>
                        <li>Maintained existing ColdFusion and SQL
                        applications.</li>
                    </ul>
                    <div class="contact">
                        Contact: Timothy Thate (Project Manager)
                    </div>
                    <ul class="list-inline contact-info">
                        <li><a href="mailto:tthate@leadingageny.org">
                            <span class="fa fa-send"></span><!--
                            -->tthate@leadingageny.org
                        </a></li>
                        <li><a href="callto:15188678862">
                            <span class="fa fa-phone"></span><!--
                            -->+1 (518) 867-8862 x135
                        </a></li>
                    </ul>
                </li>
            </ul>
        </section>
        <section>
            <h2 anchor="references">References</h2>
            <p>A list of references is available
            <a href="#contact">upon request</a>.</p>
        </section>
    </div>
    <div class="col-md-6">
        <section>
            <h2 anchor="skills">Skills</h2>

            <h4>Programming/Mark-Up Languages</h4>
            <dl class="dl-horizontal skills-list">
                <dt>Very Familiar</dt>
                <dd>C, CFML (ColdFusion, Railo), HTML/CSS, Java,
                JavaScript,
                <span class="latex">L<sup>a</sup>T<sub>e</sub>X</span>,
                Maude, Python</dd>

                <dt>Familiar</dt>
                <dd>C++, Flex, PHP, SQL (MS SQL Server, PostgreSQL), Shell
                scripting (bash, zsh)</dd>

                <dt>Known</dt>
                <dd>Haskell, Matlab, ML, SQL (MySQL)</dd>
            </dl>

            <h4>Operating Systems</h4>
            <dl class="dl-horizontal skills-list">
                <dt>Very Familiar</dt>
                <dd>GNU/Linux (Gentoo, CentOS)</dd>

                <dt>Familiar</dt>
                <dd>Mac OS X, Windows</dd>
            </dl>
        </section>

        <section>
            <h2 anchor="programming">Programming Samples</h2>

            <ul class="list-unstyled section-list">
                <!-- Resume -->
                <li>
                    <a href="https://github.com/chrisbouchard/upliftinglemma"
                            title="View on GitHub">
                        <h5>Uplifting Lemma</h5>
                    </a>
                    <p>A small project built on FW/1, Bootstrap, and
                    Angular.js.</p>
                    <p>You are looking at this project right now! This site
                    serves a dual purpose: it hosts my
                    r&eacute;sum&eacute;, and it allows me to play around
                    with the latest versions of my favorite frameworks.</p>
                </li>

                <!-- Terminator -->
                <li>
                    <a href="https://github.com/chrisbouchard/terminator"
                            title="View on GitHub">
                        <h5>Terminator</h5>
                    </a>
                    <p>A C program to run a command as though in a
                    terminal.</p>
                    <p>While grading students&rsquo; C programs, I noticed
                    that some behaved differently depending on whether they
                    were output to the terminal or to a file. I wrote this
                    program to trick their programs into behaving as though
                    they were outputting to the terminal.</p>
                </li>

                <!-- Bartender -->
                <li>
                    <a href="https://github.com/chrisbouchard/bartender"
                            title="View on GitHub">
                        <h5>Bartender</h5>
                    </a>
                    <p>A status bar server written in Haskell and built
                    around dzen2.</p>
                    <p>A few years ago I switched to using XMonad as my
                    primary window manager. I love the simplicity, but I
                    was not happy with the existing status bars. This
                    project is my attempt at building a modular status bar
                    built around a central server and separate client
                    widgets.</p>
                </li>

                <!-- Othello AI -->
                <li>
                    <a href="https://github.com/chrisbouchard/othello-ai"
                            title="View on GitHub">
                        <h5>Othello AI</h5>
                    </a>
                    <p>A Java-based AI and GUI to play the game Othello
                    (a.k.a. Reversi).</p>
                    <p>I wrote this program as part of a team for an AI
                    course in college. The AI consists of a
                    &ldquo;council&rdquo; of small AI routines that examine
                    different aspects of the game state and vote on the
                    best move. The GUI was built using an MVC design with
                    Swing.</p>
                </li>

                <!-- Boolean Expression Solver -->
                <li>
                    <a href="http://sourceforge.net/projects/bool-expr-solve/"
                            title="View on SourceForge">
                        <h5>Boolean Expression Solver</h5>
                    </a>
                    <p>A Java-based utility that generates a truth table
                    for a given Boolean expression.</p>
                    <p>This was another class project. We were tasked to
                    create a program to evaluate boolean expressions in
                    infix notation. I extended it also evaluate
                    subexpressions and accept a wider range of
                    operators.</p>
                </li>
            </ul>
        </section>

        <section>
            <h2 anchor="hobbies">Hobbies</h2>

            <ul class="list-unstyled section-list">
                <!-- GNU/Linux -->
                <li>
                    <h5>GNU/Linux</h5>
                    <p>I administer a personal GNU/Linux server running
                    Gentoo, including a web server and a file server, with
                    a custom-compiled kernel. In fact, that&rsquo;s the
                    <a href="http://upliftinglemma.net">web server</a>
                    where this r&eacute;sum&eacute; is hosted.</p>
                    <p>I love Gentoo because I enjoy playing with the
                    bleeding edge of free software. If there&rsquo;s a beta
                    available, I want it. I also like the idea of
                    distributing programs by source &mdash; it may be
                    slower to compile, but it allows much more
                    configuration.</p>
                </li>

                <!-- Art -->
                <li>
                    <h5>Art</h5>
                    <p>I enjoy photography, vector, and pixel art, and
                    I&rsquo;ve been a
                    <a href="http://chrisbouchard.deviantart.com/">member</a>
                    of the online art community
                    <a href="http://www.deviantart.com/">deviantART</a>
                    since 2004.</p>
                </li>
            </ul>
        </section>

        <section>
            <h2 anchor="publications">Peer-Reviewed Publications</h2>

            <ul class="list-unstyled section-list">
                <!-- Forward Closure -->
                <li>
                    <h5>On Forward Closure and the Finite Variant Property</h5>
                    <br>
                    Christopher Bouchard, Kimberly A Gero, Christopher
                    Lynch, and Paliath Narendran<br>
                    <i>Frontiers of Combining Systems</i>,
                    pp 327&ndash;342. 2013.
                    <ul class="duties-list">
                        <li>
                            Presented at
                            <a href="http://frocos2013.loria.fr/">FroCoS 2013</a>
                            in Nancy, France.
                        </li>
                    </ul>
                </li>

                <!-- Some Notes on BSM -->
                <li>
                    <h5>Some Notes on Basic Syntactic Mutation</h5>
                    <br>
                    Christopher Bouchard, Kimberly A Gero, and Paliath
                    Narendran<br>
                    <i>26th International Workshop on Unification</i>,
                    pp 9&ndash;14. 2012.
                </li>

                <!-- Block Chaining -->
                <li>
                    <h5>Unification modulo Chaining</h5>
                    <br>
                    Siva Anantharaman, Christopher Bouchard, Paliath
                    Narendran, and Micha&euml;l Rusinowitch.<br>
                    <i>Language and Automata Theory and Applications</i>,
                    pp 70&ndash;82. 2012.
                    <ul class="duties-list">
                        <li>
                            Presented at
                            <a href="http://grammars.grlmc.com/lata2012/">LATA 2012</a>
                            in A Coru&ntilde;a, Spain.
                        </li>
                    </ul>
                </li>
        </section>
    </div>
</div>

<footer id="print-warning" class="visible-print">
    <p>
        <span class="fa fa-info-circle"></span>&nbsp;
        <strong>Heads up!</strong> There&rsquo;s a live version of this
        r&eacute;sum&eacute; available
        <a href="http://upliftinglemma.net/resume:main">online</a>.
    </p>
</footer>

