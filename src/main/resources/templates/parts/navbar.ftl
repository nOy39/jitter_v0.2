<#include "security.ftl">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a href="#offcanvas-slide" class="uk-button uk-button-default" uk-toggle>Jitter</a>

    <div id="offcanvas-slide" uk-offcanvas>
        <div class="uk-offcanvas-bar">

            <ul class="uk-nav uk-nav-default">
                <li class="uk-active"><a href="#">Active</a></li>
                <li><a href="/projects/add">Add new projects</a></li>
                <li class="uk-nav-header">Header</li>
                <li>
                    <a href="/" class="uk-margin-small-right" uk-icon="icon: home; ratio: 0.8"><span>Home</span></a>
                </li>
                <li><a href="/projects">Projects</a></li>
                <li><a href="/main">Messages</a></li>
                <li class="uk-nav-divider"></li>
<#if user??>
                <li><a href="/users/profile">Profile</a></li>
</#if>
                <li><a href="#">Item</a></li>

                <li>
                    <a href="#" class="uk-icon-link uk-margin-small-right" uk-icon="copy">COPY</a>
                </li>
                <li>
                    <span>${name}</span>
                </li>
                <li class="uk-nav-divider"></li>

                <a href="" class="uk-icon-button uk-margin-small-right" uk-icon="github-alt"></a>
                <a href="" class="uk-icon-button  uk-margin-small-right" uk-icon="facebook"></a>
                <a href="" class="uk-icon-button" uk-icon="google-plus"></a>

            </ul>
        </div>
    </div>
</nav>


