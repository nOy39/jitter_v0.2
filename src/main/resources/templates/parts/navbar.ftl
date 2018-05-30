<#include "security.ftl">
<#import "login.ftl" as l>


<div uk-sticky="sel-target: .uk-navbar-container; cls-active: uk-navbar-sticky; bottom: #transparent-sticky-navbar">
    <nav class="uk-navbar uk-navbar-container uk-margin" uk-navbar style="position: relative; z-index: 980;">

        <div class="uk-navbar-left">
            <a class="uk-navbar-toggle uk-margin-small-left" href="#left-menu-slide" uk-toggle>
                <span uk-navbar-toggle-icon></span>
                <span class="uk-margin-small-left">Menu</span>
            </a>
        </div>

        <div class="uk-navbar-center">
            <div>
                <ul class="uk-navbar-nav">
                    <a class="uk-navbar-item uk-logo" href="#">Jitt3r</a>
                </ul>
            </div></div>

        <div class="nav-overlay uk-navbar-right">

            <a class="uk-navbar-toggle" uk-search-icon uk-toggle="target: .nav-overlay; animation: uk-animation-fade" href="#"></a>

        </div>

        <div class="nav-overlay uk-navbar-left uk-flex-1" hidden>

            <div class="uk-navbar-item uk-width-expand">
                <form class="uk-search uk-search-navbar uk-width-1-1" name="search" method="post">
                    <input class="uk-search-input" type="search" placeholder="Search..." autofocus>
                </form>
            </div>

            <a class="uk-navbar-toggle" uk-close uk-toggle="target: .nav-overlay; animation: uk-animation-fade" href="#"></a>

        </div>

    </nav>

</div>
<#--Left menu-->
<div id="left-menu-slide" uk-offcanvas="mode: none; overlay: true">
    <div class="uk-offcanvas-bar uk-flex uk-flex-column">

        <ul class="uk-nav uk-nav-primary">
            <li class="uk-active"><a href="/main">Jitt3r</a></li>
            <li class="uk-nav-header">Projects</li>
            <li class="uk-nav-divider"></li>
            <li class="uk-parent">
                <a href="/projects"><span class="uk-margin-small-right" uk-icon="icon: thumbnails">

                </span>Projects</a>
            </li>
            <li class="uk-nav-divider"></li>
            <#if projects??>
            <li>
                <#list projects as project>
            <ul class="uk-nav-sub">
                <li>
                <li><a href="/desk/${project.id}/list/"><span class="uk-margin-small-right" uk-icon="icon: grid"></span>${project.prj_name}</a></li>
                </li>
            </ul>
                </#list>
            </#if>
            <#if desks??>

            <span class="uk-margin-small-right" uk-icon="icon: grid"></span>
            <span>${project.getPrj_name()}</span>
            <li class="uk-nav-divider"></li>
                <#list desks as desk>
                <ul class="uk-nav-sub">
                    <li>
                    <li><a href="/desk/a/list/"><span class="uk-margin-small-right" uk-icon="icon: copy"></span>${desk.name}</a></li>
                    </li>
                </ul>
                    <#list notes as note>
                        <#if note.desk == desk>
                        <ul>
                            <ul>
                                <li>
                                    <a href="/desk/a/list/"><span class="uk-margin-small-right" uk-icon="icon: folder"></span>${note.name}</a></li>
                                </li>
                            </ul>
                        </ul>
                        </#if>
                    </#list>
                </#list>
            </#if>
            <#if author??>
            <li class="uk-nav-header">User details</li>
            <li class="uk-nav-divider"></li>

            <li>
                <form method="get" name="profile" action="/users/profile">
                    <button class="uk-button uk-button-link" type="submit">
                        <span class="uk-margin-small-right" uk-icon="icon: author"></span>${name}</button>
                </form>

            </li>
            <li>
                <@l.logout/>
            </li>
            <#else>
                <button class="uk-button uk-button-text uk-width-1-1 uk-margin-small-bottom" uk-icon="icon: sign-in">login</button>
            </#if>

            <li class="uk-nav-divider"></li>
            <li class="uk-position-small uk-position-bottom">
                <div class="uk-inline">
                    <a href="#">
                        <span uk-icon="icon: facebook; ratio: 2"></span>
                    </a>
                    <a href="#">
                        <span uk-icon="icon: mail; ratio: 2"></span>
                    </a>
                    <a href="https://github.com/nOy39/jitter_v0.2.git">
                        <span uk-icon="icon: github; ratio: 2"></span>
                    </a>
                </div>
            </li>

        </ul>

    </div>
</div>


